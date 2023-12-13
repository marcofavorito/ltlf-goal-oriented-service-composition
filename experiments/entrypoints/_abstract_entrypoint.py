import argparse
import logging
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Callable, Optional

from experiments.core import composition_problem_to_pddl, ActionMode, Heuristic, RunArgs, run_script, save_results


def configure_logging(filename: Optional[str] = None):
    console = logging.StreamHandler()
    handlers = [console]
    if filename:
        file = logging.FileHandler(filename)
        handlers += [file]
    logging.basicConfig(
        format="[%(asctime)s][%(levelname)s]: %(message)s",
        level=logging.DEBUG,
        handlers=handlers,
    )


def reset_logging():
    root = logging.getLogger()
    for handler in root.handlers:
        root.removeHandler(handler)
    for logfilter in root.filters:
        root.removeFilter(logfilter)


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--workdir", type=str, default="output")
    parser.add_argument("--timeout", type=float, default=1000.0)
    return parser.parse_args()


def run_experiment(workdir: Path,
                   timeout: float,
                   experiment_name: str,
                   service_builder_fn: Callable,
                   goal_builder_fn: Callable,
                   action_mode: ActionMode,
                   heuristic: Heuristic) -> None:
    if not workdir.exists():
        workdir.mkdir(parents=True)

    output_dir = workdir / experiment_name
    if output_dir.exists():
        raise ValueError(f"directory {output_dir} already exists")

    output_dir.mkdir()
    reset_logging()
    configure_logging(filename=str(output_dir / "output.log"))

    logging.info(f"Running experiment {experiment_name}, workdir {workdir}, timeout {timeout}")
    with TemporaryDirectory() as tmpfile:
        tmpdirpath = Path(tmpfile)
        domain_txt, problem_txt = composition_problem_to_pddl(service_builder_fn(), goal_builder_fn())

        domain_filepath = (tmpdirpath / "domain.pddl")
        problem_filepath = (tmpdirpath / "problem.pddl")
        domain_filepath.write_text(domain_txt)
        problem_filepath.write_text(problem_txt)

        run_args = RunArgs(domain_filepath, problem_filepath, action_mode, heuristic, "", timeout)
        result = run_script(run_args)

        # save output
        save_results(tmpdirpath, output_dir, run_args, result)

    logging.info("Done!")
