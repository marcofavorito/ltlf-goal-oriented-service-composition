import logging
from pathlib import Path
from typing import Sequence

from examples.electric_motor.electric_motor_example import one_state_service, BUILD_ROTOR, BUILD_STATOR, BUILD_INVERTER, \
    ASSEMBLE_MOTOR, build_goal
from experiments.core import ActionMode, Heuristic
from experiments.entrypoints._abstract_entrypoint import run_experiment, parse_args, configure_logging
from ltlf_goal_oriented_service_composition.services import Service


def build_services() -> Sequence[Service]:
    rotor_builder = one_state_service("rotor_builder", BUILD_ROTOR)
    stator_builder = one_state_service("stator_builder", BUILD_STATOR)
    inverter_builder = one_state_service("inverter_builder", BUILD_INVERTER)
    motor_assembler = one_state_service("motor_assembler", ASSEMBLE_MOTOR)
    return [rotor_builder, stator_builder, inverter_builder, motor_assembler]


def main():
    arguments = parse_args()
    workdir = Path(arguments.workdir)
    if not workdir.exists():
        workdir.mkdir(parents=True)
    configure_logging(filename=str(workdir / "output.log"))

    try:
        for action_mode in ActionMode:
            for heuristic in Heuristic:
                run_experiment(workdir, arguments.timeout, f"electric_motor_{action_mode.value}_{heuristic.value}", build_services, build_goal, action_mode, heuristic)
    except KeyboardInterrupt:
        logging.warning("Interrupted by user")
    except Exception:
        logging.exception("Exception occurred")


if __name__ == '__main__':
    main()
