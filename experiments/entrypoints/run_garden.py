import logging
from pathlib import Path
from typing import Sequence

from examples.garden.garden_example import bot_1, bot_2, bot_0, get_goal
from experiments.core import ActionMode, Heuristic
from experiments.entrypoints._abstract_entrypoint import run_experiment, parse_args, configure_logging, _main
from ltlf_goal_oriented_service_composition.services import Service


def build_services() -> Sequence[Service]:
    return [bot_0(), bot_1(), bot_2()]


def _do_job(workdir: Path, timeout: float):
    for action_mode in ActionMode:
        for heuristic in Heuristic:
            run_experiment(workdir, timeout, f"garden_{action_mode.value}_{heuristic.value}", build_services,
                           get_goal, action_mode, heuristic)


if __name__ == '__main__':
    _main(_do_job)
