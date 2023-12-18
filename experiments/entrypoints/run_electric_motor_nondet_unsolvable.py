from pathlib import Path
from typing import Sequence

from experiments.core import ActionMode, Heuristic
from experiments.domains.electric_motor import BUILD_STATOR, BUILD_ROTOR, BUILD_INVERTER, ASSEMBLE_MOTOR, ELECTRIC_TEST, \
    STATIC_TEST, build_goal
from experiments.entrypoints._abstract_entrypoint import run_experiment, _main
from experiments.services import breakable_forever_service
from ltlf_goal_oriented_service_composition.services import Service


def build_services() -> Sequence[Service]:
    services = []
    action_to_name = {
        BUILD_STATOR: "rotor_builder",
        BUILD_ROTOR:  "stator_builder",
        BUILD_INVERTER: "inverter_builder",
        ASSEMBLE_MOTOR: "motor_assembler",
        ELECTRIC_TEST: "mechanical_engineer_1",
        STATIC_TEST: "mechanical_engineer_2",
    }
    for action, service_name in action_to_name.items():
        service_name = action_to_name[action]
        services.append(breakable_forever_service(service_name, action))
    return services


def _do_job(workdir: Path, timeout: float):
    for action_mode in ActionMode:
        for heuristic in Heuristic:
            run_experiment(workdir, timeout,
                           f"electric_motor_nondet_unsolvable_{action_mode.value}_{heuristic.value}",
                           build_services, build_goal, action_mode, heuristic)


if __name__ == '__main__':
    _main(_do_job)
