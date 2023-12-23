(define (problem problem)

  (:domain 'domain-problem')
  (:objects s0_rotor_builder_0 - state s0_rotor_builder_broken - state s1_stator_builder_0 - state s1_stator_builder_broken - state s2_inverter_builder_0 - state s3_motor_assembler_0 - state s4_mechanical_engineer_1_0 - state s5_mechanical_engineer_2_0 - state)
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
  (:goal (and (f_goal) (current_state_0 s0_rotor_builder_0)  (current_state_1 s1_stator_builder_0)  (current_state_2 s2_inverter_builder_0)  (current_state_3 s3_motor_assembler_0)  (current_state_4 s4_mechanical_engineer_1_0)  (current_state_5 s5_mechanical_engineer_2_0) ))

)