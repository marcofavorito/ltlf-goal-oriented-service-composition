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
    (cleaning)
    (development)
    (exposure)
    (film_deposition)
    (repair)
    (resist_coating)
    (startsymb)
    (f_copy)
    (f_sync)
    (f_world)
    (f_ok)
    (f_goal)
    (q_1)
    (q_1s)
    (q_2)
    (q_2s)
    (q_3)
    (q_3s)
    (q_4)
    (q_4s)
    (q_5)
    (q_5s)
    (q_6)
    (q_6s)
    (q_7)
    (q_7s)
    (q_8)
    (q_8s)
    (q_9)
    (q_9s)
    (q_10)
    (q_10s)
    (q_11)
    (q_11s)
    (q_12)
    (q_12s)
    (q_13)
    (q_13s)
    (q_14)
    (q_14s)
    (q_15)
    (q_15s)
    (q_16)
    (q_16s)
    (q_17)
    (q_17s)
    (q_18)
    (q_18s)
    (q_19)
    (q_19s)
    (q_20)
    (q_20s)
    (q_21)
    (q_21s)
    (q_22)
    (q_22s)
    (q_23)
    (q_23s)
    (q_24)
    (q_24s)
    (q_25)
    (q_25s)
    (q_26)
    (q_26s)
    (q_27)
    (q_27s)
    (q_28)
    (q_28s)
    (q_29)
    (q_29s)
    (q_30)
    (q_30s)
    (q_31)
    (q_31s)
    (q_32)
    (q_32s)
    (q_33)
    (q_33s)
    (q_34)
    (q_34s)
    (q_35)
    (q_35s)
    (q_36)
    (q_36s)
    (q_37)
    (q_37s)
    (q_38)
    (q_38s)
    (q_39)
    (q_39s)
    (q_40)
    (q_40s)
    (q_41)
    (q_41s)
    (q_42)
    (q_42s)
    (q_43)
    (q_43s)
    (q_44)
    (q_44s)
  )
  (:action cleaning_0_handler_cleaning_0
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_handler_cleaning_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_0 s0_handler_cleaning_0) (and (not (current_state_0 s0_handler_cleaning_0)) (current_state_0 s0_handler_cleaning_broken)))
        (cleaning)
        (f_copy)
        (not 
          (development))
        (not 
          (exposure))
        (not 
          (film_deposition))
        (not 
          (repair))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action development_4_handler_development_0
    :parameters ()
    :precondition 
      (and
        (current_state_4 s4_handler_development_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_4 s4_handler_development_0) (and (not (current_state_4 s4_handler_development_0)) (current_state_4 s4_handler_development_broken)))
        (development)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (exposure))
        (not 
          (film_deposition))
        (not 
          (repair))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action exposure_3_handler_exposure_0
    :parameters ()
    :precondition 
      (and
        (current_state_3 s3_handler_exposure_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_3 s3_handler_exposure_0) (and (not (current_state_3 s3_handler_exposure_0)) (current_state_3 s3_handler_exposure_broken)))
        (exposure)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (development))
        (not 
          (film_deposition))
        (not 
          (repair))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action film_deposition_1_handler_film_deposition_0
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_handler_film_deposition_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_1 s1_handler_film_deposition_0) (and (not (current_state_1 s1_handler_film_deposition_0)) (current_state_1 s1_handler_film_deposition_broken)))
        (film_deposition)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (development))
        (not 
          (exposure))
        (not 
          (repair))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action repair_0_handler_cleaning_broken
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_handler_cleaning_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_0 s0_handler_cleaning_broken))
          (current_state_0 s0_handler_cleaning_0))
        (repair)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (development))
        (not 
          (exposure))
        (not 
          (film_deposition))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action repair_1_handler_film_deposition_broken
    :parameters ()
    :precondition 
      (and
        (current_state_1 s1_handler_film_deposition_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_1 s1_handler_film_deposition_broken))
          (current_state_1 s1_handler_film_deposition_0))
        (repair)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (development))
        (not 
          (exposure))
        (not 
          (film_deposition))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action repair_2_handler_resist_coating_broken
    :parameters ()
    :precondition 
      (and
        (current_state_2 s2_handler_resist_coating_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_2 s2_handler_resist_coating_broken))
          (current_state_2 s2_handler_resist_coating_0))
        (repair)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (development))
        (not 
          (exposure))
        (not 
          (film_deposition))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action repair_3_handler_exposure_broken
    :parameters ()
    :precondition 
      (and
        (current_state_3 s3_handler_exposure_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_3 s3_handler_exposure_broken))
          (current_state_3 s3_handler_exposure_0))
        (repair)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (development))
        (not 
          (exposure))
        (not 
          (film_deposition))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action repair_4_handler_development_broken
    :parameters ()
    :precondition 
      (and
        (current_state_4 s4_handler_development_broken)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_4 s4_handler_development_broken))
          (current_state_4 s4_handler_development_0))
        (repair)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (development))
        (not 
          (exposure))
        (not 
          (film_deposition))
        (not 
          (resist_coating))
        (not 
          (f_world))
      )
    )
  (:action resist_coating_2_handler_resist_coating_0
    :parameters ()
    :precondition 
      (and
        (current_state_2 s2_handler_resist_coating_0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_2 s2_handler_resist_coating_0) (and (not (current_state_2 s2_handler_resist_coating_0)) (current_state_2 s2_handler_resist_coating_broken)))
        (resist_coating)
        (f_copy)
        (not 
          (cleaning))
        (not 
          (development))
        (not 
          (exposure))
        (not 
          (film_deposition))
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
        (when
          (q_29)
          (q_29s))
        (when
          (q_30)
          (q_30s))
        (when
          (q_31)
          (q_31s))
        (when
          (q_32)
          (q_32s))
        (when
          (q_33)
          (q_33s))
        (when
          (q_34)
          (q_34s))
        (when
          (q_35)
          (q_35s))
        (when
          (q_36)
          (q_36s))
        (when
          (q_37)
          (q_37s))
        (when
          (q_38)
          (q_38s))
        (when
          (q_39)
          (q_39s))
        (when
          (q_40)
          (q_40s))
        (when
          (q_41)
          (q_41s))
        (when
          (q_42)
          (q_42s))
        (when
          (q_43)
          (q_43s))
        (when
          (q_44)
          (q_44s))
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
        (not 
          (q_29))
        (not 
          (q_30))
        (not 
          (q_31))
        (not 
          (q_32))
        (not 
          (q_33))
        (not 
          (q_34))
        (not 
          (q_35))
        (not 
          (q_36))
        (not 
          (q_37))
        (not 
          (q_38))
        (not 
          (q_39))
        (not 
          (q_40))
        (not 
          (q_41))
        (not 
          (q_42))
        (not 
          (q_43))
        (not 
          (q_44))
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
          (q_27))
        (not 
          (q_28))
        (not 
          (q_29))
        (not 
          (q_30))
        (not 
          (q_31))
        (not 
          (q_32))
        (not 
          (q_33))
        (not 
          (q_34))
        (not 
          (q_35))
        (not 
          (q_36))
        (not 
          (q_37))
        (not 
          (q_38))
        (not 
          (q_39))
        (not 
          (q_40))
        (not 
          (q_41))
        (not 
          (q_42))
        (not 
          (q_43)))
    :effect
(f_goal)    )
  (:action o_world
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
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
        (not 
          (q_29s))
        (not 
          (q_30s))
        (not 
          (q_31s))
        (not 
          (q_32s))
        (not 
          (q_33s))
        (not 
          (q_34s))
        (not 
          (q_35s))
        (not 
          (q_36s))
        (not 
          (q_37s))
        (not 
          (q_38s))
        (not 
          (q_39s))
        (not 
          (q_40s))
        (not 
          (q_41s))
        (not 
          (q_42s))
        (not 
          (q_43s))
        (not 
          (q_44s)))
    :effect
      (and
        (f_world)
        (not 
          (f_sync))
      )
    )
  (:action o_sync_q_1s
    :parameters ()
    :precondition 
      (and
        (cleaning)
        (f_sync)
        (f_ok)
        (q_1s))
    :effect
(not 
        (q_1s))    )
  (:action o_sync_q_2s
    :parameters ()
    :precondition 
      (and
        (development)
        (f_sync)
        (f_ok)
        (q_2s))
    :effect
(not 
        (q_2s))    )
  (:action o_sync_q_3s
    :parameters ()
    :precondition 
      (and
        (exposure)
        (f_sync)
        (f_ok)
        (q_3s))
    :effect
(not 
        (q_3s))    )
  (:action o_sync_q_4s
    :parameters ()
    :precondition 
      (and
        (film_deposition)
        (f_sync)
        (f_ok)
        (q_4s))
    :effect
(not 
        (q_4s))    )
  (:action o_sync_q_5s
    :parameters ()
    :precondition 
      (and
        (resist_coating)
        (f_sync)
        (f_ok)
        (q_5s))
    :effect
(not 
        (q_5s))    )
  (:action o_sync_q_6s
    :parameters ()
    :precondition 
      (and
        (startsymb)
        (f_sync)
        (f_ok)
        (q_6s))
    :effect
(not 
        (q_6s))    )
  (:action o_sync_q_7s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_7s))
    :effect
      (and
        (q_18s)
        (not 
          (q_7s))
      )
    )
  (:action o_sync_q_7s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_7s))
    :effect
      (and
        (q_43)
        (q_7)
        (not 
          (q_7s))
      )
    )
  (:action o_sync_q_8s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_8s))
    :effect
      (and
        (q_19s)
        (not 
          (q_8s))
      )
    )
  (:action o_sync_q_8s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_8s))
    :effect
      (and
        (q_43)
        (q_8)
        (not 
          (q_8s))
      )
    )
  (:action o_sync_q_9s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9s))
    :effect
      (and
        (q_20s)
        (not 
          (q_9s))
      )
    )
  (:action o_sync_q_9s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9s))
    :effect
      (and
        (q_43)
        (q_9)
        (not 
          (q_9s))
      )
    )
  (:action o_sync_q_10s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_10s))
    :effect
      (and
        (q_21s)
        (not 
          (q_10s))
      )
    )
  (:action o_sync_q_10s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_10s))
    :effect
      (and
        (q_43)
        (q_10)
        (not 
          (q_10s))
      )
    )
  (:action o_sync_q_11s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_11s))
    :effect
      (and
        (q_22s)
        (not 
          (q_11s))
      )
    )
  (:action o_sync_q_11s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_11s))
    :effect
      (and
        (q_43)
        (q_11)
        (not 
          (q_11s))
      )
    )
  (:action o_sync_q_12s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_12s))
    :effect
      (and
        (q_43)
        (q_7)
        (not 
          (q_12s))
      )
    )
  (:action o_sync_q_13s
    :parameters ()
    :precondition 
      (and
        (not 
          (cleaning))
        (f_sync)
        (f_ok)
        (q_13s))
    :effect
(not 
        (q_13s))    )
  (:action o_sync_q_14s
    :parameters ()
    :precondition 
      (and
        (not 
          (development))
        (f_sync)
        (f_ok)
        (q_14s))
    :effect
(not 
        (q_14s))    )
  (:action o_sync_q_15s
    :parameters ()
    :precondition 
      (and
        (not 
          (exposure))
        (f_sync)
        (f_ok)
        (q_15s))
    :effect
(not 
        (q_15s))    )
  (:action o_sync_q_16s
    :parameters ()
    :precondition 
      (and
        (not 
          (film_deposition))
        (f_sync)
        (f_ok)
        (q_16s))
    :effect
(not 
        (q_16s))    )
  (:action o_sync_q_17s
    :parameters ()
    :precondition 
      (and
        (not 
          (resist_coating))
        (f_sync)
        (f_ok)
        (q_17s))
    :effect
(not 
        (q_17s))    )
  (:action o_sync_q_18s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_18s))
    :effect
      (and
        (q_1s)
        (q_39s)
        (not 
          (q_18s))
      )
    )
  (:action o_sync_q_19s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_19s))
    :effect
      (and
        (q_2s)
        (q_28s)
        (not 
          (q_19s))
      )
    )
  (:action o_sync_q_20s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_20s))
    :effect
      (and
        (q_3s)
        (q_30s)
        (not 
          (q_20s))
      )
    )
  (:action o_sync_q_21s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_21s))
    :effect
      (and
        (q_4s)
        (q_31s)
        (not 
          (q_21s))
      )
    )
  (:action o_sync_q_22s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_22s))
    :effect
      (and
        (q_5s)
        (q_29s)
        (not 
          (q_22s))
      )
    )
  (:action o_sync_q_23s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_23s))
    :effect
      (and
        (q_6s)
        (q_12s)
        (not 
          (q_23s))
      )
    )
  (:action o_sync_q_24s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_24s))
    :effect
      (and
        (q_8s)
        (q_14s)
        (not 
          (q_24s))
      )
    )
  (:action o_sync_q_25s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_25s))
    :effect
      (and
        (q_9s)
        (q_14s)
        (not 
          (q_25s))
      )
    )
  (:action o_sync_q_26s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_26s))
    :effect
      (and
        (q_10s)
        (q_14s)
        (not 
          (q_26s))
      )
    )
  (:action o_sync_q_27s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_27s))
    :effect
      (and
        (q_11s)
        (q_14s)
        (not 
          (q_27s))
      )
    )
  (:action o_sync_q_28s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_28s))
    :effect
      (and
        (q_13s)
        (q_36s)
        (not 
          (q_28s))
      )
    )
  (:action o_sync_q_29s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_29s))
    :effect
      (and
        (q_13s)
        (q_37s)
        (not 
          (q_29s))
      )
    )
  (:action o_sync_q_30s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_30s))
    :effect
      (and
        (q_13s)
        (q_38s)
        (not 
          (q_30s))
      )
    )
  (:action o_sync_q_31s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_31s))
    :effect
      (and
        (q_13s)
        (q_42s)
        (not 
          (q_31s))
      )
    )
  (:action o_sync_q_32s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_32s))
    :effect
      (and
        (q_15s)
        (q_17s)
        (not 
          (q_32s))
      )
    )
  (:action o_sync_q_33s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_33s))
    :effect
      (and
        (q_15s)
        (q_25s)
        (not 
          (q_33s))
      )
    )
  (:action o_sync_q_34s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_34s))
    :effect
      (and
        (q_15s)
        (q_26s)
        (not 
          (q_34s))
      )
    )
  (:action o_sync_q_35s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_35s))
    :effect
      (and
        (q_15s)
        (q_27s)
        (not 
          (q_35s))
      )
    )
  (:action o_sync_q_36s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_36s))
    :effect
      (and
        (q_16s)
        (q_32s)
        (not 
          (q_36s))
      )
    )
  (:action o_sync_q_37s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_37s))
    :effect
      (and
        (q_16s)
        (q_33s)
        (not 
          (q_37s))
      )
    )
  (:action o_sync_q_38s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_38s))
    :effect
      (and
        (q_16s)
        (q_40s)
        (not 
          (q_38s))
      )
    )
  (:action o_sync_q_39s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_39s))
    :effect
      (and
        (q_16s)
        (q_41s)
        (not 
          (q_39s))
      )
    )
  (:action o_sync_q_40s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_40s))
    :effect
      (and
        (q_17s)
        (q_24s)
        (not 
          (q_40s))
      )
    )
  (:action o_sync_q_41s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_41s))
    :effect
      (and
        (q_17s)
        (q_34s)
        (not 
          (q_41s))
      )
    )
  (:action o_sync_q_42s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_42s))
    :effect
      (and
        (q_17s)
        (q_35s)
        (not 
          (q_42s))
      )
    )
  (:action o_sync_q_43s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_43s))
    :effect
(not 
        (q_43s))    )
  (:action o_sync_q_44s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_44s))
    :effect
      (and
        (not 
          (q_44s))
        (not 
          (f_ok))
      )
    )
)