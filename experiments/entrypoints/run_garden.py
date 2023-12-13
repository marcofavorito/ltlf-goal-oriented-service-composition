import logging
from pathlib import Path
from typing import Sequence

from examples.garden.garden_example import bot_1, bot_2, bot_0, get_goal
from experiments.core import ActionMode, Heuristic
from experiments.entrypoints._abstract_entrypoint import run_experiment, parse_args, configure_logging
from ltlf_goal_oriented_service_composition.services import Service


def build_services() -> Sequence[Service]:
    return [bot_0(), bot_1(), bot_2()]


def main():
    arguments = parse_args()
    workdir = Path(arguments.workdir)
    if not workdir.exists():
        workdir.mkdir(parents=True)
    configure_logging(filename=str(workdir / "output.log"))

    try:
        for action_mode in ActionMode:
            for heuristic in Heuristic:
                run_experiment(workdir, arguments.timeout, f"garden_{action_mode.value}_{heuristic.value}", build_services, get_goal, action_mode, heuristic)
    except KeyboardInterrupt:
        logging.warning("Interrupted by user")
    except Exception:
        logging.exception("Exception occurred")


if __name__ == '__main__':
    main()
