(define (problem problem)

  (:domain 'domain-problem')
  (:objects s0_rotor_builder_0 - state s0_rotor_builder_broken - state s1_stator_builder_0 - state s1_stator_builder_broken - state s2_inverter_builder_0 - state s2_inverter_builder_broken - state s3_motor_assembler_0 - state s3_motor_assembler_broken - state s4_mechanical_engineer_1_0 - state s4_mechanical_engineer_1_broken - state s5_mechanical_engineer_2_0 - state s5_mechanical_engineer_2_broken - state)
  (:init 
    (current_state_0 s0_rotor_builder_0)
    (current_state_1 s1_stator_builder_0)
    (current_state_2 s2_inverter_builder_0)
    (current_state_3 s3_motor_assembler_0)
    (current_state_4 s4_mechanical_engineer_1_0)
    (current_state_5 s5_mechanical_engineer_2_0)
    (startsymb)
    (q_1)
    (f_copy)
    (f_ok)
  )
  (:goal (and (current_state_0 s0_rotor_builder_0)  (current_state_1 s1_stator_builder_0)  (current_state_2 s2_inverter_builder_0)  (current_state_3 s3_motor_assembler_0)  (current_state_4 s4_mechanical_engineer_1_0)  (current_state_5 s5_mechanical_engineer_2_0) 
    (not 
      (q_27))
    (q_1d)
    (q_21d)
    (q_2d)
    (q_3d)
    (q_19d)
    (q_26d)
    (q_4d)
    (q_5d)
    (q_6d)
    (q_7d)
    (q_8d)
    (q_14d)
    (q_15d)
    (or
      (q_22d)
      (q_20d))
    (q_9d)
    (q_26d)
    (q_10d)
    (q_26d)
    (q_13d)
    (q_25d)
    (q_11d)
    (q_23d)
    (q_12d)
    (q_24d)))

)