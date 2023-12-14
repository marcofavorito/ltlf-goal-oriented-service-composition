(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_rotor_builder_0)
    (current_state_1 s1_stator_builder_0)
    (current_state_2 s2_inverter_builder_0)
    (current_state_3 s3_motor_assembler_0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (next (and (eventually assemble_motor) (until (not assemble_motor) build_rotor) (until (not assemble_motor) build_stator) (until (not assemble_motor) build_inverter))))
    (eventually (and
           (current_state_0 s0_rotor_builder_0)
        (not (next (true) ))))
    (eventually (and
           (current_state_1 s1_stator_builder_0)
        (not (next (true) ))))
    (eventually (and
           (current_state_2 s2_inverter_builder_0)
        (not (next (true) ))))
    (eventually (and
           (current_state_3 s3_motor_assembler_0)
        (not (next (true) ))))
)))