(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_rotor_builder_0 - state
    s0_rotor_builder_broken - state
    s1_stator_builder_0 - state
    s1_stator_builder_broken - state
    s2_inverter_builder_0 - state
    s2_inverter_builder_broken - state
    s3_motor_assembler_0 - state
    s3_motor_assembler_broken - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (current_state_2 ?s - state)
    (current_state_3 ?s - state)
    (assemble_motor)
    (build_retrieve_inverter)
    (build_retrieve_rotor)
    (build_retrieve_stator)
    (startsymb)
  )
(:action assemble_motor_3_motor_assembler_0
    :precondition (current_state_3 s3_motor_assembler_0)
    :effect (and
        (oneof
            (current_state_3 s3_motor_assembler_0)
            (and (not (current_state_3 s3_motor_assembler_0)) (current_state_3 s3_motor_assembler_broken))
         )
        (assemble_motor)
        (not (build_retrieve_inverter))
        (not (build_retrieve_rotor))
        (not (build_retrieve_stator))
    )
)
(:action build_retrieve_inverter_2_inverter_builder_0
    :precondition (current_state_2 s2_inverter_builder_0)
    :effect (and
        (oneof
            (current_state_2 s2_inverter_builder_0)
            (and (not (current_state_2 s2_inverter_builder_0)) (current_state_2 s2_inverter_builder_broken))
         )
        (build_retrieve_inverter)
        (not (assemble_motor))
        (not (build_retrieve_rotor))
        (not (build_retrieve_stator))
    )
)
(:action build_retrieve_rotor_0_rotor_builder_0
    :precondition (current_state_0 s0_rotor_builder_0)
    :effect (and
        (oneof
            (current_state_0 s0_rotor_builder_0)
            (and (not (current_state_0 s0_rotor_builder_0)) (current_state_0 s0_rotor_builder_broken))
         )
        (build_retrieve_rotor)
        (not (assemble_motor))
        (not (build_retrieve_inverter))
        (not (build_retrieve_stator))
    )
)
(:action build_retrieve_stator_1_stator_builder_0
    :precondition (current_state_1 s1_stator_builder_0)
    :effect (and
        (oneof
            (current_state_1 s1_stator_builder_0)
            (and (not (current_state_1 s1_stator_builder_0)) (current_state_1 s1_stator_builder_broken))
         )
        (build_retrieve_stator)
        (not (assemble_motor))
        (not (build_retrieve_inverter))
        (not (build_retrieve_rotor))
    )
)
  )
