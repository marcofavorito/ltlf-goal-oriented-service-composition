import logging
from functools import partial
from pathlib import Path
from typing import Sequence

from examples.electric_motor.electric_motor_example import one_state_service
from examples.electric_motor_nondet.electric_motor_nondet_example import BUILD_ROTOR, BUILD_STATOR, BUILD_INVERTER, \
    ASSEMBLE_MOTOR, build_goal, breakable_state_service
from experiments.core import ActionMode, Heuristic
from experiments.entrypoints._abstract_entrypoint import run_experiment, parse_args, configure_logging
from ltlf_goal_oriented_service_composition.services import Service


def build_services(n: int) -> Sequence[Service]:
    assert 1 <= n <= 4
    builder_services = []
    for i, action in enumerate([BUILD_ROTOR, BUILD_STATOR, BUILD_INVERTER]):
        component = action.split("_")[1]
        service_name = f"{component}_builder"
        if (i+1) <= n:
            builder_services.append(breakable_state_service(service_name, component))
        else:
            builder_services.append(one_state_service(service_name, component))

    if n == 4:
        motor_assembler = breakable_state_service("motor_assembler", ASSEMBLE_MOTOR)
    else:
        motor_assembler = one_state_service("motor_assembler", ASSEMBLE_MOTOR)
    return builder_services + [motor_assembler]


def main():
    arguments = parse_args()
    workdir = Path(arguments.workdir)
    if not workdir.exists():
        workdir.mkdir(parents=True)
    configure_logging(filename=str(workdir / "output.log"))

    combination_already_failed: set[tuple[ActionMode, Heuristic]] = set()
    try:
        for n in range(1, 4):
            for action_mode in ActionMode:
                for heuristic in Heuristic:
                    if (action_mode, heuristic) in combination_already_failed:
                        print(f"Skipping configuration {(action_mode, heuristic)} for {n=}")
                        logging.info(f"Skipping configuration {(action_mode, heuristic)} for {n=}")
                        continue
                    result = run_experiment(workdir, arguments.timeout, f"electric_motor_nondet_{action_mode.value}_{heuristic.value}",
                                   partial(build_services, n), build_goal, action_mode, heuristic)
                    if result.timed_out:
                        logging.info(f"Combination {(action_mode, heuristic)} timed out with n={n}, not continuing with this configuration...")
                        combination_already_failed.add((action_mode, heuristic))
    except KeyboardInterrupt:
        logging.warning("Interrupted by user")
    except Exception:
        logging.exception("Exception occurred")


if __name__ == '__main__':
    main()
