import dataclasses
import json
import shutil
from enum import Enum
from pathlib import Path
from typing import Sequence, Optional

from pylogics.parsers import parse_ltl

from experiments.utils import run_command, RUNNER_SCRIPT, ROOT_PATH, Result
from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB


class Heuristic(Enum):
    HMAX = "hmax"
    FF = "ff"


class ActionMode(Enum):
    MODE_2 = "2"
    MODE_1 = "1"


@dataclasses.dataclass
class RunArgs:
    domain_filepath: Path
    problem_filepath: Path
    action_mode: ActionMode
    heuristic: Heuristic
    planner_args: Sequence[str]
    timeout: Optional[float] = None

    def tolist(self):
        return [
            self.domain_filepath,
            self.problem_filepath,
            self.action_mode,
            self.heuristic,
            self.planner_args,
            self.timeout
        ]

    def savejson(self, output: Path):
        obj = dict(
            heuristic=self.heuristic.value,
            action_mode=self.action_mode.value,
            planner_args=self.planner_args,
            timeout=self.timeout
        )
        with open(output, "w") as f:
            json.dump(obj, f)


def composition_problem_to_pddl(services: Sequence[Service], goal_formula: str) -> tuple[str, str]:
    formula_str = f"{_START_SYMB} & X[!]({goal_formula})"
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    domain, problem = services_to_pddl(services, formula_pddl)
    return domain, problem


def run_script(run_args: RunArgs) -> Result:
    domain_file, problem_file, action_mode, heuristic, planner_args, timeout = run_args.tolist()
    assert domain_file.parent == problem_file.parent
    tempdir = domain_file.parent
    mynd_args = " ".join([
        "-heuristic",
        f"{heuristic.value}",
        "-exportDot",
        str(tempdir / "policy.dot"),
        "-dumpPlan",
    ])
    return run_command([
        RUNNER_SCRIPT,
        domain_file.resolve(),
        problem_file.resolve(),
        "TB",
        action_mode.value,
        "mynd",
        mynd_args,
        *planner_args
    ],
        cwd=ROOT_PATH, timeout=timeout)


def copy_if_src_exists(src: Path, dest: Path) -> None:
    if src.exists():
        shutil.copy(src, dest)


def save_results(tmpdirpath: Path, output_dir: Path, run_args: RunArgs, result: Result) -> None:
    domain_filepath = run_args.domain_filepath
    problem_filepath = run_args.problem_filepath

    (output_dir / "stdout.txt").write_text(result.stdout)
    (output_dir / "stderr.txt").write_text(result.stderr)
    (output_dir / "summary.txt").write_text(result.summary())
    copy_if_src_exists(domain_filepath, output_dir / "domain.pddl")
    copy_if_src_exists(problem_filepath, output_dir / "problem.pddl")
    copy_if_src_exists(tmpdirpath / "domain_compiled.pddl", output_dir / "domain_compiled.pddl")
    copy_if_src_exists(tmpdirpath / "problem_compiled.pddl", output_dir / "problem_compiled.pddl")
    copy_if_src_exists(tmpdirpath / "policy.dot", output_dir / "problem.pddl")
    copy_if_src_exists(ROOT_PATH / "output.sas", output_dir / "output.sas")
    run_args.savejson(output_dir / "args.json")
