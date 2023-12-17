import logging
from pathlib import Path
from typing import Callable, Sequence

from examples.chip_production.chip_production_example import ALL_SYMBOLS, one_state_service
from experiments.core import ActionMode, Heuristic
from experiments.entrypoints._abstract_entrypoint import run_experiment, parse_args, configure_logging, _main


def get_service_builder_fn(current_symbols: Sequence[str]) -> Callable:
    def build_services():
        return [
            one_state_service(f"handler_{name}", name) for name in current_symbols
        ]
    return build_services


def get_goal_fn(current_symbols: Sequence[str]) -> Callable:
    def build_goal():
        assert len(current_symbols) >= 1
        all_but_one = lambda s: f"{s} & " + " & ".join([f"!{other}" for other in current_symbols if other != s])
        if len(current_symbols) > 1:
            formula_str = f"F({all_but_one(current_symbols[0])}"
        else:
            formula_str = f"F({current_symbols[0]}"
        nb_open_brackets = 1
        for symbol in current_symbols[1:]:
            formula_str += f" & F({all_but_one(symbol)}"
            nb_open_brackets += 1
        formula_str += ")" * nb_open_brackets
        return formula_str
    return build_goal


def _do_job(workdir: Path, timeout: float):
    combination_already_failed: set[tuple[ActionMode, Heuristic]] = set()
    for n in range(1, len(ALL_SYMBOLS)):
        for action_mode in ActionMode:
            for heuristic in Heuristic:
                if (action_mode, heuristic) in combination_already_failed:
                    print(f"Skipping configuration {(action_mode, heuristic)} for {n=}")
                    logging.info(f"Skipping configuration {(action_mode, heuristic)} for {n=}")
                    continue
                current_symbols = ALL_SYMBOLS[:n]
                build_services = get_service_builder_fn(current_symbols)
                build_goal = get_goal_fn(current_symbols)
                result = run_experiment(workdir, timeout, f"chip_production_len_{n}_{action_mode.value}_{heuristic.value}",
                               build_services, build_goal, action_mode, heuristic)
                if result.planning_result and result.planning_result.timed_out:
                    logging.info(f"Combination {(action_mode, heuristic)} timed out with n={n}, not continuing with this configuration...")
                    combination_already_failed.add((action_mode, heuristic))


if __name__ == '__main__':
    _main(_do_job)
