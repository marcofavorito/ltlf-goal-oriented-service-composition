from ltlf_goal_oriented_service_composition.services import Service


# atomic action outside task
REPAIR = "repair"


def one_state_service(service_name: str, action: str) -> Service:
    return Service(
        {f"{service_name}_0"},
        {action},
        {f"{service_name}_0"},
        f"{service_name}_0",
        {
            f"{service_name}_0": {
                action: {f"{service_name}_0"},
            },
        },
    )


def breakable_state_service(service_name: str, action: str) -> Service:
    initial = f"{service_name}_0"
    broken = f"{service_name}_broken"
    return Service(
        {initial, broken},
        {action, REPAIR},
        {initial},
        initial,
        {
            initial: {
                action: {initial, broken},
            },
            broken: {
                REPAIR: {initial}
            }
        },
    )


def breakable_forever_service(service_name: str, action: str) -> Service:
    initial = f"{service_name}_0"
    broken = f"{service_name}_broken"
    return Service(
        {initial, broken},
        {action},
        {initial},
        initial,
        {
            initial: {
                action: {initial, broken},
            },
            broken: {}
        },
    )
