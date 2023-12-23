(define (domain 'domain-problem')
  (:types
    state - NO_TYPE
    action - NO_TYPE
  )

  (:predicates
    (current_state_0 ?x0 - state)
    (current_state_1 ?x0 - state)
    (current_state_2 ?x0 - state)
    (current_state_3 ?x0 - state)
    (current_state_4 ?x0 - state)
    (current_state_5 ?x0 - state)
    (assemble_motor)
    (build_inverter)
    (build_rotor)
    (build_stator)
    (electric_test)
    (repair)
    (static_test)
    (startsymb)
    (f_copy)
    (f_sync)
    (f_world)
    (f_ok)
    (f_goal)
    (q_1)
    (q_1s)
    (q_1t)
    (q_2)
    (q_2s)
    (q_2t)
    (q_3)
    (q_3s)
    (q_3t)
    (q_4)
    (q_4s)
    (q_4t)
    (q_5)
    (q_5s)
    (q_5t)
    (q_6)
    (q_6s)
    (q_6t)
    (q_7)
    (q_7s)
    (q_7t)
    (q_8)
    (q_8s)
    (q_8t)
    (q_9)
    (q_9s)
    (q_9t)
    (q_10)
    (q_10s)
    (q_10t)
    (q_11)
    (q_11s)
    (q_11t)
    (q_12)
    (q_12s)
    (q_12t)
    (q_13)
    (q_13s)
    (q_13t)
    (q_14)
    (q_14s)
    (q_14t)
    (q_15)
    (q_15s)
    (q_15t)
    (q_16)
    (q_16s)
    (q_16t)
    (q_17)
    (q_17s)
    (q_17t)
    (q_18)
    (q_18s)
    (q_18t)
    (q_19)
    (q_19s)
    (q_19t)
    (q_20)
    (q_20s)
    (q_20t)
    (q_21)
    (q_21s)
    (q_21t)
    (q_22)
    (q_22s)
    (q_22t)
    (q_23)
    (q_23s)
    (q_23t)
    (q_24)
    (q_24s)
    (q_24t)
    (q_25)
    (q_25s)
    (q_25t)
    (q_26)
    (q_26s)
    (q_26t)
    (q_27)
    (q_27s)
    (q_27t)
    (q_28)
    (q_28s)
    (q_28t)
  )
  (:action assemble_motor_3_motor_assembler_0
    :parameters ()
    :precondition 
      (and
        (current_state_3 s3_motor_assembler_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_3 s3_motor_assembler_0) (and (not (current_state_3 s3_motor_assembler_0)) (current_state_3 s3_motor_assembler_broken)))
        (assemble_motor)
        (f_copy)
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (repair))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action build_inverter_2_inverter_builder_0
    :parameters ()
    :precondition 
      (and
        (current_state_2 s2_inverter_builder_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_2 s2_inverter_builder_0) (and (not (current_state_2 s2_inverter_builder_0)) (current_state_2 s2_inverter_builder_broken)))
        (build_inverter)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (repair))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action build_rotor_1_stator_builder_0
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_stator_builder_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_1 s1_stator_builder_0) (and (not (current_state_1 s1_stator_builder_0)) (current_state_1 s1_stator_builder_broken)))
        (build_rotor)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (repair))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action build_stator_0_rotor_builder_0
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_rotor_builder_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_0 s0_rotor_builder_0) (and (not (current_state_0 s0_rotor_builder_0)) (current_state_0 s0_rotor_builder_broken)))
        (build_stator)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (electric_test))
        (not 
          (repair))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action electric_test_4_mechanical_engineer_1_0
    :parameters ()
    :precondition 
      (and
        (current_state_4 s4_mechanical_engineer_1_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_4 s4_mechanical_engineer_1_0) (and (not (current_state_4 s4_mechanical_engineer_1_0)) (current_state_4 s4_mechanical_engineer_1_broken)))
        (electric_test)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (repair))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action repair_0_rotor_builder_broken
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_rotor_builder_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_0 s0_rotor_builder_broken))
          (current_state_0 s0_rotor_builder_0))
        (repair)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action repair_1_stator_builder_broken
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_stator_builder_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_1 s1_stator_builder_broken))
          (current_state_1 s1_stator_builder_0))
        (repair)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action repair_2_inverter_builder_broken
    :parameters ()
    :precondition 
      (and
        (current_state_2 s2_inverter_builder_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_2 s2_inverter_builder_broken))
          (current_state_2 s2_inverter_builder_0))
        (repair)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action repair_3_motor_assembler_broken
    :parameters ()
    :precondition 
      (and
        (current_state_3 s3_motor_assembler_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_3 s3_motor_assembler_broken))
          (current_state_3 s3_motor_assembler_0))
        (repair)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action repair_4_mechanical_engineer_1_broken
    :parameters ()
    :precondition 
      (and
        (current_state_4 s4_mechanical_engineer_1_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_4 s4_mechanical_engineer_1_broken))
          (current_state_4 s4_mechanical_engineer_1_0))
        (repair)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action repair_5_mechanical_engineer_2_broken
    :parameters ()
    :precondition 
      (and
        (current_state_5 s5_mechanical_engineer_2_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_5 s5_mechanical_engineer_2_broken))
          (current_state_5 s5_mechanical_engineer_2_0))
        (repair)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (static_test))
        (not 
          (f_world))
      )
    )
  (:action static_test_5_mechanical_engineer_2_0
    :parameters ()
    :precondition 
      (and
        (current_state_5 s5_mechanical_engineer_2_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_5 s5_mechanical_engineer_2_0) (and (not (current_state_5 s5_mechanical_engineer_2_0)) (current_state_5 s5_mechanical_engineer_2_broken)))
        (static_test)
        (f_copy)
        (not 
          (assemble_motor))
        (not 
          (build_inverter))
        (not 
          (build_rotor))
        (not 
          (build_stator))
        (not 
          (electric_test))
        (not 
          (repair))
        (not 
          (f_world))
      )
    )
  (:action o_copy
    :parameters ()
    :precondition 
      (and
        (f_ok)
        (f_copy))
    :effect
      (and
        (f_sync)
        (q_1t)
        (when
          (q_1)
          (q_1s))
        (when
          (q_2)
          (q_2s))
        (when
          (q_3)
          (q_3s))
        (when
          (q_4)
          (q_4s))
        (when
          (q_5)
          (q_5s))
        (when
          (q_6)
          (q_6s))
        (when
          (q_7)
          (q_7s))
        (when
          (q_8)
          (q_8s))
        (when
          (q_9)
          (q_9s))
        (when
          (q_10)
          (q_10s))
        (when
          (q_11)
          (q_11s))
        (when
          (q_12)
          (q_12s))
        (when
          (q_13)
          (q_13s))
        (when
          (q_14)
          (q_14s))
        (when
          (q_15)
          (q_15s))
        (when
          (q_16)
          (q_16s))
        (when
          (q_17)
          (q_17s))
        (when
          (q_18)
          (q_18s))
        (when
          (q_19)
          (q_19s))
        (when
          (q_20)
          (q_20s))
        (when
          (q_21)
          (q_21s))
        (when
          (q_22)
          (q_22s))
        (when
          (q_23)
          (q_23s))
        (when
          (q_24)
          (q_24s))
        (when
          (q_25)
          (q_25s))
        (when
          (q_26)
          (q_26s))
        (when
          (q_27)
          (q_27s))
        (when
          (q_28)
          (q_28s))
        (not 
          (f_copy))
        (not 
          (q_1))
        (not 
          (q_2))
        (not 
          (q_3))
        (not 
          (q_4))
        (not 
          (q_5))
        (not 
          (q_6))
        (not 
          (q_7))
        (not 
          (q_8))
        (not 
          (q_9))
        (not 
          (q_10))
        (not 
          (q_11))
        (not 
          (q_12))
        (not 
          (q_13))
        (not 
          (q_14))
        (not 
          (q_15))
        (not 
          (q_16))
        (not 
          (q_17))
        (not 
          (q_18))
        (not 
          (q_19))
        (not 
          (q_20))
        (not 
          (q_21))
        (not 
          (q_22))
        (not 
          (q_23))
        (not 
          (q_24))
        (not 
          (q_25))
        (not 
          (q_26))
        (not 
          (q_27))
        (not 
          (q_28))
      )
    )
  (:action o_goal
    :parameters ()
    :precondition 
      (and
        (f_world)
        (f_ok)
        (not 
          (q_1))
        (not 
          (q_2))
        (not 
          (q_3))
        (not 
          (q_4))
        (not 
          (q_5))
        (not 
          (q_6))
        (not 
          (q_7))
        (not 
          (q_8))
        (not 
          (q_9))
        (not 
          (q_10))
        (not 
          (q_11))
        (not 
          (q_12))
        (not 
          (q_13))
        (not 
          (q_14))
        (not 
          (q_15))
        (not 
          (q_16))
        (not 
          (q_17))
        (not 
          (q_18))
        (not 
          (q_19))
        (not 
          (q_20))
        (not 
          (q_21))
        (not 
          (q_22))
        (not 
          (q_23))
        (not 
          (q_24))
        (not 
          (q_25))
        (not 
          (q_26))
        (not 
          (q_27)))
    :effect
(f_goal)    )
  (:action o_sync_q_1s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_1t))
    :effect
      (and
        (when
          (q_1s)
          (q_21s))
        (when
          (q_1s)
          (q_2s))
        (q_2t)
        (when
          (q_1s)
          (not 
            (q_1s)))
        (not 
          (q_1t))
      )
    )
  (:action o_sync_q_2s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_2t))
    :effect
      (and
        (when
          (q_2s)
          (q_27))
        (when
          (q_2s)
          (q_3))
        (q_3t)
        (when
          (q_2s)
          (not 
            (q_2s)))
        (not 
          (q_2t))
      )
    )
  (:action o_sync_q_3s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_3t))
    :effect
      (and
        (when
          (q_3s)
          (q_19s))
        (when
          (q_3s)
          (q_4s))
        (q_4t)
        (when
          (q_3s)
          (not 
            (q_3s)))
        (not 
          (q_3t))
      )
    )
  (:action o_sync_q_4s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_4t))
    :effect
      (and
        (when
          (q_4s)
          (q_5s))
        (when
          (q_4s)
          (q_12s))
        (q_5t)
        (when
          (q_4s)
          (not 
            (q_4s)))
        (not 
          (q_4t))
      )
    )
  (:action o_sync_q_5s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_5t))
    :effect
      (and
        (when
          (q_5s)
          (q_6s))
        (when
          (q_5s)
          (q_11s))
        (q_6t)
        (when
          (q_5s)
          (not 
            (q_5s)))
        (not 
          (q_5t))
      )
    )
  (:action o_sync_q_6s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_6t))
    :effect
      (and
        (when
          (q_6s)
          (q_7s))
        (when
          (q_6s)
          (q_13s))
        (q_7t)
        (when
          (q_6s)
          (not 
            (q_6s)))
        (not 
          (q_6t))
      )
    )
  (:action o_sync_q_7s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_7t))
    :effect
      (and
        (when
          (q_7s)
          (q_8s))
        (when
          (q_7s)
          (q_10s))
        (q_8t)
        (when
          (q_7s)
          (not 
            (q_7s)))
        (not 
          (q_7t))
      )
    )
  (:action o_sync_q_8s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_8t))
    :effect
      (and
        (when
          (q_8s)
          (q_14s))
        (when
          (q_8s)
          (q_9s))
        (q_9t)
        (when
          (q_8s)
          (not 
            (q_8s)))
        (not 
          (q_8t))
      )
    )
  (:action o_sync_q_9s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9t))
    :effect
      (and
        (when
          (q_9s)
          (q_26s))
        (q_10t)
        (when
          (q_9s)
          (not 
            (q_9s)))
        (not 
          (q_9t))
      )
    )
  (:action o_sync_q_9s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9t))
    :effect
      (and
        (when
          (q_9s)
          (q_16s))
        (when
          (q_9s)
          (q_9))
        (when
          (q_9s)
          (q_27))
        (q_10t)
        (when
          (q_9s)
          (not 
            (q_9s)))
        (not 
          (q_9t))
      )
    )
  (:action o_sync_q_10s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_10t))
    :effect
      (and
        (when
          (q_10s)
          (q_26s))
        (q_11t)
        (when
          (q_10s)
          (not 
            (q_10s)))
        (not 
          (q_10t))
      )
    )
  (:action o_sync_q_10s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_10t))
    :effect
      (and
        (when
          (q_10s)
          (q_17s))
        (when
          (q_10s)
          (q_10))
        (when
          (q_10s)
          (q_27))
        (q_11t)
        (when
          (q_10s)
          (not 
            (q_10s)))
        (not 
          (q_10t))
      )
    )
  (:action o_sync_q_11s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_11t))
    :effect
      (and
        (when
          (q_11s)
          (q_23s))
        (q_12t)
        (when
          (q_11s)
          (not 
            (q_11s)))
        (not 
          (q_11t))
      )
    )
  (:action o_sync_q_11s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_11t))
    :effect
      (and
        (when
          (q_11s)
          (q_18s))
        (when
          (q_11s)
          (q_11))
        (when
          (q_11s)
          (q_27))
        (q_12t)
        (when
          (q_11s)
          (not 
            (q_11s)))
        (not 
          (q_11t))
      )
    )
  (:action o_sync_q_12s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_12t))
    :effect
      (and
        (when
          (q_12s)
          (q_24s))
        (q_13t)
        (when
          (q_12s)
          (not 
            (q_12s)))
        (not 
          (q_12t))
      )
    )
  (:action o_sync_q_12s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_12t))
    :effect
      (and
        (when
          (q_12s)
          (q_18s))
        (when
          (q_12s)
          (q_12))
        (when
          (q_12s)
          (q_27))
        (q_13t)
        (when
          (q_12s)
          (not 
            (q_12s)))
        (not 
          (q_12t))
      )
    )
  (:action o_sync_q_13s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_13t))
    :effect
      (and
        (when
          (q_13s)
          (q_25s))
        (q_14t)
        (when
          (q_13s)
          (not 
            (q_13s)))
        (not 
          (q_13t))
      )
    )
  (:action o_sync_q_13s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_13t))
    :effect
      (and
        (when
          (q_13s)
          (q_18s))
        (when
          (q_13s)
          (q_13))
        (when
          (q_13s)
          (q_27))
        (q_14t)
        (when
          (q_13s)
          (not 
            (q_13s)))
        (not 
          (q_13t))
      )
    )
  (:action o_sync_q_14s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_14t))
    :effect
      (and
        (when
          (q_14s)
          (q_15s))
        (q_15t)
        (when
          (q_14s)
          (not 
            (q_14s)))
        (not 
          (q_14t))
      )
    )
  (:action o_sync_q_14s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_14t))
    :effect
      (and
        (when
          (q_14s)
          (q_27))
        (when
          (q_14s)
          (q_14))
        (q_15t)
        (when
          (q_14s)
          (not 
            (q_14s)))
        (not 
          (q_14t))
      )
    )
  (:action o_sync_q_15s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_15t))
    :effect
      (and
        (when
          (q_15s)
          (q_22s))
        (q_16t)
        (when
          (q_15s)
          (not 
            (q_15s)))
        (not 
          (q_15t))
      )
    )
  (:action o_sync_q_15s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_15t))
    :effect
      (and
        (when
          (q_15s)
          (q_20s))
        (q_16t)
        (when
          (q_15s)
          (not 
            (q_15s)))
        (not 
          (q_15t))
      )
    )
  (:action o_sync_q_16s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_16t))
    :effect
      (and
        (q_17t)
        (when
          (q_16s)
          (not 
            (q_16s)))
        (when
          (and
            (q_16s)
            (static_test))
          (not 
            (f_ok)))
        (not 
          (q_16t))
      )
    )
  (:action o_sync_q_17s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_17t))
    :effect
      (and
        (q_18t)
        (when
          (q_17s)
          (not 
            (q_17s)))
        (when
          (and
            (q_17s)
            (electric_test))
          (not 
            (f_ok)))
        (not 
          (q_17t))
      )
    )
  (:action o_sync_q_18s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_18t))
    :effect
      (and
        (q_19t)
        (when
          (q_18s)
          (not 
            (q_18s)))
        (when
          (and
            (q_18s)
            (assemble_motor))
          (not 
            (f_ok)))
        (not 
          (q_18t))
      )
    )
  (:action o_sync_q_19s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_19t))
    :effect
      (and
        (when
          (q_19s)
          (q_26s))
        (q_20t)
        (when
          (q_19s)
          (not 
            (q_19s)))
        (not 
          (q_19t))
      )
    )
  (:action o_sync_q_19s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_19t))
    :effect
      (and
        (when
          (q_19s)
          (q_27))
        (when
          (q_19s)
          (q_19))
        (q_20t)
        (when
          (q_19s)
          (not 
            (q_19s)))
        (not 
          (q_19t))
      )
    )
  (:action o_sync_q_20s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_20t))
    :effect
      (and
        (q_21t)
        (when
          (q_20s)
          (not 
            (q_20s)))
        (when
          (and
            (q_20s)
            (not 
              (static_test)))
          (not 
            (f_ok)))
        (not 
          (q_20t))
      )
    )
  (:action o_sync_q_21s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_21t))
    :effect
      (and
        (q_22t)
        (when
          (q_21s)
          (not 
            (q_21s)))
        (when
          (and
            (q_21s)
            (not 
              (startsymb)))
          (not 
            (f_ok)))
        (not 
          (q_21t))
      )
    )
  (:action o_sync_q_22s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_22t))
    :effect
      (and
        (q_23t)
        (when
          (q_22s)
          (not 
            (q_22s)))
        (when
          (and
            (q_22s)
            (not 
              (electric_test)))
          (not 
            (f_ok)))
        (not 
          (q_22t))
      )
    )
  (:action o_sync_q_23s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_23t))
    :effect
      (and
        (q_24t)
        (when
          (q_23s)
          (not 
            (q_23s)))
        (when
          (and
            (q_23s)
            (not 
              (build_stator)))
          (not 
            (f_ok)))
        (not 
          (q_23t))
      )
    )
  (:action o_sync_q_24s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_24t))
    :effect
      (and
        (q_25t)
        (when
          (q_24s)
          (not 
            (q_24s)))
        (when
          (and
            (q_24s)
            (not 
              (build_rotor)))
          (not 
            (f_ok)))
        (not 
          (q_24t))
      )
    )
  (:action o_sync_q_25s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_25t))
    :effect
      (and
        (q_26t)
        (when
          (q_25s)
          (not 
            (q_25s)))
        (when
          (and
            (q_25s)
            (not 
              (build_inverter)))
          (not 
            (f_ok)))
        (not 
          (q_25t))
      )
    )
  (:action o_sync_q_26s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_26t))
    :effect
      (and
        (q_27t)
        (when
          (q_26s)
          (not 
            (q_26s)))
        (when
          (and
            (q_26s)
            (not 
              (assemble_motor)))
          (not 
            (f_ok)))
        (not 
          (q_26t))
      )
    )
  (:action o_sync_q_27s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_27t))
    :effect
      (and
        (q_28t)
        (when
          (q_27s)
          (not 
            (q_27s)))
        (not 
          (q_27t))
      )
    )
  (:action o_sync_q_28s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_28t))
    :effect
      (and
        (f_world)
        (when
          (q_1s)
          (q_1))
        (when
          (q_2s)
          (q_2))
        (when
          (q_3s)
          (q_3))
        (when
          (q_4s)
          (q_4))
        (when
          (q_5s)
          (q_5))
        (when
          (q_6s)
          (q_6))
        (when
          (q_7s)
          (q_7))
        (when
          (q_8s)
          (q_8))
        (when
          (q_9s)
          (q_9))
        (when
          (q_10s)
          (q_10))
        (when
          (q_11s)
          (q_11))
        (when
          (q_12s)
          (q_12))
        (when
          (q_13s)
          (q_13))
        (when
          (q_14s)
          (q_14))
        (when
          (q_15s)
          (q_15))
        (when
          (q_16s)
          (q_16))
        (when
          (q_17s)
          (q_17))
        (when
          (q_18s)
          (q_18))
        (when
          (q_19s)
          (q_19))
        (when
          (q_20s)
          (q_20))
        (when
          (q_21s)
          (q_21))
        (when
          (q_22s)
          (q_22))
        (when
          (q_23s)
          (q_23))
        (when
          (q_24s)
          (q_24))
        (when
          (q_25s)
          (q_25))
        (when
          (q_26s)
          (q_26))
        (when
          (q_27s)
          (q_27))
        (when
          (q_28s)
          (q_28))
        (when
          (q_28s)
          (not 
            (f_ok)))
        (not 
          (q_28t))
        (not 
          (f_sync))
        (not 
          (q_1s))
        (not 
          (q_2s))
        (not 
          (q_3s))
        (not 
          (q_4s))
        (not 
          (q_5s))
        (not 
          (q_6s))
        (not 
          (q_7s))
        (not 
          (q_8s))
        (not 
          (q_9s))
        (not 
          (q_10s))
        (not 
          (q_11s))
        (not 
          (q_12s))
        (not 
          (q_13s))
        (not 
          (q_14s))
        (not 
          (q_15s))
        (not 
          (q_16s))
        (not 
          (q_17s))
        (not 
          (q_18s))
        (not 
          (q_19s))
        (not 
          (q_20s))
        (not 
          (q_21s))
        (not 
          (q_22s))
        (not 
          (q_23s))
        (not 
          (q_24s))
        (not 
          (q_25s))
        (not 
          (q_26s))
        (not 
          (q_27s))
        (not 
          (q_28s))
      )
    )
)