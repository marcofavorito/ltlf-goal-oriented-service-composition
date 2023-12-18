from pathlib import Path
from pathlib import Path
from typing import Sequence

from experiments.core import ActionMode, Heuristic
from experiments.entrypoints._abstract_entrypoint import run_experiment, _main
from ltlf_goal_oriented_service_composition.services import Service


def get_goal():
    return "clean & X[!]((clean U ((water & X[!](pluck)) | (pluck & X[!](water)))))"


def bot_0():
    return Service(
        {"a0", "a1"},
        {"clean", "empty"},
        {"a0"},
        "a0",
        {
            "a0": {
                "clean": {"a0", "a1"},
            },
            "a1": {"empty": {"a0"}},
        },
    )


def bot_1():
    return Service(
        {"b0", "b1", "b2"},
        {"water", "pluck", "empty"},
        {"b0"},
        "b0",
        {
            "b0": {
                "water": {"b0"},
                "pluck": {"b1", "b2"},
            },
            "b1": {
                "water": {"b1"},
                "empty": {"b0"},
            }
        },
    )


def bot_2():
    return Service(
        {"c0", "c1"},
        {"pluck", "empty"},
        {"c0"},
        "c0",
        {
            "c0": {
                "pluck": {"c1"},
            },
            "c1": {
                "empty": {"c0"}
            },
        },
    )


def build_services() -> Sequence[Service]:
    return [bot_0(), bot_1(), bot_2()]


def _do_job(workdir: Path, timeout: float):
    for action_mode in ActionMode:
        for heuristic in Heuristic:
            run_experiment(workdir, timeout, f"garden_{action_mode.value}_{heuristic.value}", build_services,
                           get_goal, action_mode, heuristic)


if __name__ == '__main__':
    _main(_do_job)
