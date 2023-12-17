import inspect
import shutil
import sys
from pathlib import Path

from pylogics.parsers import parse_ltl

from examples.simple_garden.simple_garden_example import bot_0, GOAL_FORMULA
from experiments.core import ActionMode
from experiments.handler import run_command
from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.to_pddl import _START_SYMB, services_to_pddl, final_services_condition
from tutorial.rendering import service_to_graphviz

CURPATH = Path(inspect.getfile(inspect.currentframe())).resolve()
CURRENT_DIR = CURPATH.parent
ROOT_DIR = CURRENT_DIR.parent.parent


if __name__ == '__main__':
    # bot 0
    bot0 = bot_0()
    digraph = service_to_graphviz(bot0)
    digraph.render("bot_0")

    # formula
    formula_str = f"{_START_SYMB} & X[!]({GOAL_FORMULA})"
    formula = parse_ltl(formula_str)
    (CURRENT_DIR / "formula.txt").write_text(formula_str)

    # formula in PDDL
    formula_pddl = rewrite(formula)
    (CURRENT_DIR / "formula_pddl.txt").write_text(formula_pddl)

    # service community domain/problem
    domain, problem = services_to_pddl([bot0], formula_pddl)
    domain_filepath = CURRENT_DIR / "domain.pddl"
    problem_filepath = CURRENT_DIR / "problem.pddl"
    accepting_service_condition_filepath = CURRENT_DIR / "services_condition.txt"
    accepting_service_condition = final_services_condition([bot0])
    domain_filepath.write_text(domain)
    problem_filepath.write_text(problem)
    accepting_service_condition_filepath.write_text(accepting_service_condition)

    for action_mode in ActionMode:
        action_mode_str = action_mode.value
        print("Processing action mode", action_mode_str)

        # ./scripts/tb_encode.sh tutorial/simple_garden/domain.pddl tutorial/simple_garden/problem.pddl 1
        result = run_command([
            "./scripts/tb_encode.sh",
            domain_filepath,
            problem_filepath,
            action_mode_str
        ], cwd=str(ROOT_DIR))
        assert result.returncode == 0, result

        orig_domain_compiled = ROOT_DIR / Path("tutorial/simple_garden/domain_compiled.pddl")
        orig_problem_compiled = ROOT_DIR / Path("tutorial/simple_garden/problem_compiled.pddl")
        domain_compiled = ROOT_DIR / Path(f"tutorial/simple_garden/domain_{action_mode_str}_compiled.pddl")
        problem_compiled = ROOT_DIR / Path(f"tutorial/simple_garden/problem_{action_mode_str}_compiled.pddl")

        # rename encoding output with suffix of action mode
        shutil.move(orig_domain_compiled, domain_compiled)
        shutil.move(orig_problem_compiled, problem_compiled)

        # ./scripts/run_mynd.sh tutorial/simple_garden/domain_compiled.pddl tutorial/simple_garden/problem_compiled.pddl
        # "-heuristic hmax -exportDot policy.dot -dumpPlan"
        result = run_command([
            "./scripts/run_mynd.sh",
            domain_compiled,
            problem_compiled,
            f"-heuristic hmax -exportDot ../../tutorial/simple_garden/policy_{action_mode_str}.dot -dumpPlan"
        ], cwd=str(ROOT_DIR))
        assert result.returncode == 0, result

        orig_policy = ROOT_DIR / Path(f"tutorial/simple_garden/policy_{action_mode_str}.dot")
        renamed_policy = ROOT_DIR / Path(f"tutorial/simple_garden/policy_{action_mode_str}.dot")
        shutil.move(orig_policy, renamed_policy)

        # write policy
        result = run_command([
            "dot",
            "-Tsvg",
            f"tutorial/simple_garden/policy_{action_mode_str}.dot",
            "-o",
            f"tutorial/simple_garden/policy_{action_mode_str}.svg",
        ], cwd=str(ROOT_DIR))
        assert result.returncode == 0, result

        # simplify policy
        # python scripts/simplify-policy.py --dot-file mypolicy.dot
        result = run_command([
            sys.executable,
            "./scripts/simplify-policy.py",
            "--dot-file",
            f"tutorial/simple_garden/policy_{action_mode_str}.dot",
            "--out-file",
            f"tutorial/simple_garden/simplified_policy_{action_mode_str}.dot"
        ], cwd=str(ROOT_DIR))
        assert result.returncode == 0, result

        # write simplified policy
        result = run_command([
            "dot",
            "-Tsvg",
            f"tutorial/simple_garden/simplified_policy_{action_mode_str}.dot",
            "-o"
            f"tutorial/simple_garden/simplified_policy_{action_mode_str}.svg",
        ], cwd=str(ROOT_DIR))
        assert result.returncode == 0, result
