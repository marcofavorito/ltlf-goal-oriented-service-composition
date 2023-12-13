import argparse
import shutil
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Sequence

from examples.garden.garden_example import bot_1, bot_2, bot_0, get_goal
from experiments.core import composition_problem_to_pddl, run_script, ActionMode, Heuristic, RunArgs, save_results
from experiments.utils import ROOT_PATH
from ltlf_goal_oriented_service_composition.services import Service


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--workdir", type=str, default="output")

    return parser.parse_args()


def build_services() -> Sequence[Service]:
    return [bot_0(), bot_1(), bot_2()]


def main():
    arguments = parse_args()
    workdir = Path(arguments.workdir)
    if not workdir.exists():
        workdir.mkdir(parents=True)

    output_dir = workdir / "garden"
    if output_dir.exists():
        raise ValueError(f"directory {output_dir} already exists")

    output_dir.mkdir()

    with TemporaryDirectory() as tmpfile:
        tmpdirpath = Path(tmpfile)
        domain_txt, problem_txt = composition_problem_to_pddl(build_services(), get_goal())

        domain_filepath = (tmpdirpath / "domain.pddl")
        problem_filepath = (tmpdirpath / "problem.pddl")
        domain_filepath.write_text(domain_txt)
        problem_filepath.write_text(problem_txt)

        run_args = RunArgs(domain_filepath, problem_filepath, ActionMode.MODE_2, Heuristic.HMAX, "")
        result = run_script(run_args)

        # save output
        save_results(tmpdirpath, output_dir, run_args, result)


if __name__ == '__main__':
    main()
