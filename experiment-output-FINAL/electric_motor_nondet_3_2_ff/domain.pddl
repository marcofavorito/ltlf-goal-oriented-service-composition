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
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (current_state_2 ?s - state)
    (current_state_3 ?s - state)
    (assemble_motor)
    (build_inverter)
    (build_rotor)
    (build_stator)
    (repair)
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
        (not (repair))
    )
)
(:action build_inverter_2_inverter_builder_0
    :precondition (current_state_2 s2_inverter_builder_0)
    :effect (and
        (oneof
            (current_state_2 s2_inverter_builder_0)
            (and (not (current_state_2 s2_inverter_builder_0)) (current_state_2 s2_inverter_builder_broken))
         )
        (build_inverter)
        (not (assemble_motor))
        (not (build_rotor))
        (not (build_stator))
        (not (repair))
    )
)
(:action build_rotor_0_rotor_builder_0
    :precondition (current_state_0 s0_rotor_builder_0)
    :effect (and
        (oneof
            (current_state_0 s0_rotor_builder_0)
            (and (not (current_state_0 s0_rotor_builder_0)) (current_state_0 s0_rotor_builder_broken))
         )
        (build_rotor)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_stator))
        (not (repair))
    )
)
(:action build_stator_1_stator_builder_0
    :precondition (current_state_1 s1_stator_builder_0)
    :effect (and
        (oneof
            (current_state_1 s1_stator_builder_0)
            (and (not (current_state_1 s1_stator_builder_0)) (current_state_1 s1_stator_builder_broken))
         )
        (build_stator)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_rotor))
        (not (repair))
    )
)
(:action repair_0_rotor_builder_broken
    :precondition (current_state_0 s0_rotor_builder_broken)
    :effect (and
            (and (not (current_state_0 s0_rotor_builder_broken)) (current_state_0 s0_rotor_builder_0))
        (repair)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_rotor))
        (not (build_stator))
    )
)
(:action repair_1_stator_builder_broken
    :precondition (current_state_1 s1_stator_builder_broken)
    :effect (and
            (and (not (current_state_1 s1_stator_builder_broken)) (current_state_1 s1_stator_builder_0))
        (repair)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_rotor))
        (not (build_stator))
    )
)
(:action repair_2_inverter_builder_broken
    :precondition (current_state_2 s2_inverter_builder_broken)
    :effect (and
            (and (not (current_state_2 s2_inverter_builder_broken)) (current_state_2 s2_inverter_builder_0))
        (repair)
        (not (assemble_motor))
        (not (build_inverter))
        (not (build_rotor))
        (not (build_stator))
    )
)
  )
