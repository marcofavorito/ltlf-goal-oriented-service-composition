(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_rotor_builder_0 - state
    s1_stator_builder_0 - state
    s2_inverter_builder_0 - state
    s3_motor_assembler_0 - state
    s4_mechanical_engineer_1_0 - state
    s5_mechanical_engineer_2_0 - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (current_state_2 ?s - state)
    (current_state_3 ?s - state)
    (current_state_4 ?s - state)
    (current_state_5 ?s - state)
    (assemble_motor)
    (build_inverter)
    (build_rotor)
    (build_stator)
    (electric_test)
    (static_test)
    (startsymb)
  )
(:action assemble_motor_3_motor_assembler_0
    :precondition (current_state_3 s3_motor_assembler_0)
    :effect (and
            (current_state_3 s3_motor_assembler_0)
        (assemble_motor)
        (not (build_inverter))
        (not (build_rotor))
        (not (build_stator))
        (not (electric_test))
        (not (static_test))
    )
)
(:action build_inverter_2_inverter_builder_0
    :precondition (current_state_2 s2_inverter_builder_0)
    :effect (and
            (current_state_2 s2_inverter_builder_0)
        (build_inverter)
        (not (assemble_motor))
        (not (build_rotor))
        (not (build_stator))
        (not (electric_test))
        (not (static_test))
    )
)
(:action build_rotor_1_stator_builder_0
    :precondition (current_state_1 s1_stator_builder_0)
    :effect (and
            (current_state_1 s1_stator_builder_0)
        (build_rotor)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_stator))
        (not (electric_test))
        (not (static_test))
    )
)
(:action build_stator_0_rotor_builder_0
    :precondition (current_state_0 s0_rotor_builder_0)
    :effect (and
            (current_state_0 s0_rotor_builder_0)
        (build_stator)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_rotor))
        (not (electric_test))
        (not (static_test))
    )
)
(:action electric_test_4_mechanical_engineer_1_0
    :precondition (current_state_4 s4_mechanical_engineer_1_0)
    :effect (and
            (current_state_4 s4_mechanical_engineer_1_0)
        (electric_test)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_rotor))
        (not (build_stator))
        (not (static_test))
    )
)
(:action static_test_5_mechanical_engineer_2_0
    :precondition (current_state_5 s5_mechanical_engineer_2_0)
    :effect (and
            (current_state_5 s5_mechanical_engineer_2_0)
        (static_test)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_rotor))
        (not (build_stator))
        (not (electric_test))
    )
)
  )
