
# all the atomic actions for the task
BUILD_STATOR = "build_stator"
BUILD_ROTOR = "build_rotor"
BUILD_INVERTER = "build_inverter"
ASSEMBLE_MOTOR = "assemble_motor"
ELECTRIC_TEST = "electric_test"
STATIC_TEST = "static_test"

ALL_SYMBOLS = [
    BUILD_STATOR,
    BUILD_ROTOR,
    BUILD_INVERTER,
    ASSEMBLE_MOTOR,
    ELECTRIC_TEST,
    STATIC_TEST,
]


def build_goal():
    constraints = []
    # eventually, assemble motor
    constraints.append(f"F({ASSEMBLE_MOTOR})")

    # but not before rotor, stator and inverter have been built
    constraints.append(f"!{ASSEMBLE_MOTOR} U {BUILD_ROTOR}")
    constraints.append(f"!{ASSEMBLE_MOTOR} U {BUILD_STATOR}")
    constraints.append(f"!{ASSEMBLE_MOTOR} U {BUILD_INVERTER}")

    # after assemble, either electric or static test, but not both
    constraints.append(f"!{ELECTRIC_TEST} U {ASSEMBLE_MOTOR}")
    constraints.append(f"!{STATIC_TEST} U {ASSEMBLE_MOTOR}")
    constraints.append(f"F({STATIC_TEST} | {ELECTRIC_TEST})")

    formula_str = " & ".join(map(lambda s: f"({s})", constraints))
    return formula_str
