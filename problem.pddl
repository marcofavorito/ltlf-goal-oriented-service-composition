(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_rotor_builder_0)
    (current_state_1 s1_stator_builder_0)
    (current_state_2 s2_inverter_builder_0)
    (current_state_3 s3_motor_assembler_0)
    (current_state_4 s4_painter_0)
    (current_state_5 s5_runner_0)
    (current_state_6 s6_electric_tester_0)
    (current_state_7 s7_static_tester_0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (next (and (eventually build_retrieve_stator) (always (or (not build_retrieve_stator) (not (next (not (always (not build_retrieve_stator))))))) (eventually build_retrieve_rotor) (always (or (not build_retrieve_rotor) (not (next (not (always (not build_retrieve_rotor))))))) (eventually build_retrieve_inverter) (always (or (not build_retrieve_inverter) (not (next (not (always (not build_retrieve_inverter))))))) (eventually running_in) (always (or (not running_in) (not (next (not (always (not running_in))))))) (eventually assemble_motor) (always (or (not assemble_motor) (not (next (not (always (not assemble_motor))))))) (always (or (not electric_test) (not (next (not (always (not electric_test))))))) (always (or (not painting) (not (next (not (always (not painting))))))) (always (or (not static_test) (not (next (not (always (not static_test))))))) (always (or (not build_retrieve_stator) (next (until (not build_retrieve_stator) assemble_motor)))) (or (always (not assemble_motor)) (until (not assemble_motor) build_retrieve_stator)) (always (or (not assemble_motor) (not (next (not (or (always (not assemble_motor)) (until (not assemble_motor) build_retrieve_stator))))))) (always (or (not build_retrieve_rotor) (next (until (not build_retrieve_rotor) assemble_motor)))) (or (always (not assemble_motor)) (until (not assemble_motor) build_retrieve_rotor)) (always (or (not assemble_motor) (not (next (not (or (always (not assemble_motor)) (until (not assemble_motor) build_retrieve_rotor))))))) (always (or (not build_retrieve_inverter) (next (until (not build_retrieve_inverter) assemble_motor)))) (or (always (not assemble_motor)) (until (not assemble_motor) build_retrieve_inverter)) (always (or (not assemble_motor) (not (next (not (or (always (not assemble_motor)) (until (not assemble_motor) build_retrieve_inverter))))))) (always (or (not assemble_motor) (next (until (not assemble_motor) running_in)))) (or (always (not running_in)) (until (not running_in) assemble_motor)) (always (or (not running_in) (not (next (not (or (always (not running_in)) (until (not running_in) assemble_motor))))))) (or (always (not painting)) (until (not painting) assemble_motor)) (always (or (not painting) (not (next (not (or (always (not painting)) (until (not painting) assemble_motor))))))) (or (always (not electric_test)) (until (not electric_test) assemble_motor)) (always (or (not electric_test) (not (next (not (or (always (not electric_test)) (until (not electric_test) assemble_motor))))))) (or (always (not static_test)) (until (not static_test) assemble_motor)) (always (or (not static_test) (not (next (not (or (always (not static_test)) (until (not static_test) assemble_motor))))))) (always (or (always (not electric_test)) (always (not static_test)))))))
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
    (eventually (and
           (current_state_4 s4_painter_0)
        (not (next (true) ))))
    (eventually (and
           (current_state_5 s5_runner_0)
        (not (next (true) ))))
    (eventually (and
           (current_state_6 s6_electric_tester_0)
        (not (next (true) ))))
    (eventually (and
           (current_state_7 s7_static_tester_0)
        (not (next (true) ))))
)))