import logging
from pathlib import Path
from typing import Sequence

from examples.electric_motor_nondet_unsolvable.electric_motor_nondet_unsolvable_example import \
    breakable_forever_service, BUILD_ROTOR, BUILD_STATOR, BUILD_INVERTER, ASSEMBLE_MOTOR, build_goal
from experiments.core import ActionMode, Heuristic
from experiments.entrypoints._abstract_entrypoint import run_experiment, parse_args, configure_logging, _main
from ltlf_goal_oriented_service_composition.services import Service


def build_services() -> Sequence[Service]:
    rotor_builder = breakable_forever_service("rotor_builder", BUILD_ROTOR)
    stator_builder = breakable_forever_service("stator_builder", BUILD_STATOR)
    inverter_builder = breakable_forever_service("inverter_builder", BUILD_INVERTER)
    motor_assembler = breakable_forever_service("motor_assembler", ASSEMBLE_MOTOR)
    return [rotor_builder, stator_builder, inverter_builder, motor_assembler]


def _do_job(workdir: Path, timeout: float):
    for action_mode in ActionMode:
        for heuristic in Heuristic:
            run_experiment(workdir, timeout,
                           f"electric_motor_nondet_unsolvable_{action_mode.value}_{heuristic.value}",
                           build_services, build_goal, action_mode, heuristic)


if __name__ == '__main__':
    _main(_do_job)
