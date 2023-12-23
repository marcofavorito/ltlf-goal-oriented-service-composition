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
    (q_29)
    (q_29s)
    (q_29t)
    (q_30)
    (q_30s)
    (q_30t)
    (q_31)
    (q_31s)
    (q_31t)
    (q_32)
    (q_32s)
    (q_32t)
    (q_33)
    (q_33s)
    (q_33t)
    (q_34)
    (q_34s)
    (q_34t)
    (q_35)
    (q_35s)
    (q_35t)
    (q_36)
    (q_36s)
    (q_36t)
    (q_37)
    (q_37s)
    (q_37t)
    (q_38)
    (q_38s)
    (q_38t)
    (q_39)
    (q_39s)
    (q_39t)
    (q_40)
    (q_40s)
    (q_40t)
    (q_41)
    (q_41s)
    (q_41t)
    (q_42)
    (q_42s)
    (q_42t)
    (q_43)
    (q_43s)
    (q_43t)
    (q_44)
    (q_44s)
    (q_44t)
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
          (q_37s))
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
          (q_43))
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
  (:action o_sync_q_3s_1
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
  (:action o_sync_q_3s_2
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
          (q_43))
        (when
          (q_3s)
          (q_3))
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
          (q_42s))
        (when
          (q_4s)
          (q_5s))
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
          (q_33s))
        (when
          (q_5s)
          (q_6s))
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
          (q_32s))
        (when
          (q_6s)
          (q_7s))
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
          (q_34s))
        (when
          (q_7s)
          (q_8s))
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
          (q_9s))
        (when
          (q_8s)
          (q_35s))
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
          (q_10s))
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
          (q_43))
        (when
          (q_9s)
          (q_9))
        (q_10t)
        (when
          (q_9s)
          (not 
            (q_9s)))
        (not 
          (q_9t))
      )
    )
  (:action o_sync_q_10s
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
          (q_39s))
        (when
          (q_10s)
          (q_11s))
        (q_11t)
        (when
          (q_10s)
          (not 
            (q_10s)))
        (not 
          (q_10t))
      )
    )
  (:action o_sync_q_11s
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
          (q_36s))
        (when
          (q_11s)
          (q_12s))
        (q_12t)
        (when
          (q_11s)
          (not 
            (q_11s)))
        (not 
          (q_11t))
      )
    )
  (:action o_sync_q_12s
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
          (q_32s))
        (when
          (q_12s)
          (q_13s))
        (q_13t)
        (when
          (q_12s)
          (not 
            (q_12s)))
        (not 
          (q_12t))
      )
    )
  (:action o_sync_q_13s
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
          (q_34s))
        (when
          (q_13s)
          (q_14s))
        (q_14t)
        (when
          (q_13s)
          (not 
            (q_13s)))
        (not 
          (q_13t))
      )
    )
  (:action o_sync_q_14s
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
        (when
          (q_14s)
          (q_35s))
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
          (q_16s))
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
          (q_43))
        (when
          (q_15s)
          (q_15))
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
        (when
          (q_16s)
          (q_38s))
        (when
          (q_16s)
          (q_17s))
        (q_17t)
        (when
          (q_16s)
          (not 
            (q_16s)))
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
        (when
          (q_17s)
          (q_36s))
        (when
          (q_17s)
          (q_18s))
        (q_18t)
        (when
          (q_17s)
          (not 
            (q_17s)))
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
        (when
          (q_18s)
          (q_33s))
        (when
          (q_18s)
          (q_19s))
        (q_19t)
        (when
          (q_18s)
          (not 
            (q_18s)))
        (not 
          (q_18t))
      )
    )
  (:action o_sync_q_19s
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
          (q_34s))
        (when
          (q_19s)
          (q_20s))
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
        (when
          (q_20s)
          (q_21s))
        (when
          (q_20s)
          (q_35s))
        (q_21t)
        (when
          (q_20s)
          (not 
            (q_20s)))
        (not 
          (q_20t))
      )
    )
  (:action o_sync_q_21s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_21t))
    :effect
      (and
        (when
          (q_21s)
          (q_22s))
        (q_22t)
        (when
          (q_21s)
          (not 
            (q_21s)))
        (not 
          (q_21t))
      )
    )
  (:action o_sync_q_21s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_21t))
    :effect
      (and
        (when
          (q_21s)
          (q_43))
        (when
          (q_21s)
          (q_21))
        (q_22t)
        (when
          (q_21s)
          (not 
            (q_21s)))
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
        (when
          (q_22s)
          (q_40s))
        (when
          (q_22s)
          (q_23s))
        (q_23t)
        (when
          (q_22s)
          (not 
            (q_22s)))
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
        (when
          (q_23s)
          (q_36s))
        (when
          (q_23s)
          (q_24s))
        (q_24t)
        (when
          (q_23s)
          (not 
            (q_23s)))
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
        (when
          (q_24s)
          (q_33s))
        (when
          (q_24s)
          (q_25s))
        (q_25t)
        (when
          (q_24s)
          (not 
            (q_24s)))
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
        (when
          (q_25s)
          (q_32s))
        (when
          (q_25s)
          (q_26s))
        (q_26t)
        (when
          (q_25s)
          (not 
            (q_25s)))
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
        (when
          (q_26s)
          (q_27s))
        (when
          (q_26s)
          (q_35s))
        (q_27t)
        (when
          (q_26s)
          (not 
            (q_26s)))
        (not 
          (q_26t))
      )
    )
  (:action o_sync_q_27s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_27t))
    :effect
      (and
        (when
          (q_27s)
          (q_28s))
        (q_28t)
        (when
          (q_27s)
          (not 
            (q_27s)))
        (not 
          (q_27t))
      )
    )
  (:action o_sync_q_27s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_27t))
    :effect
      (and
        (when
          (q_27s)
          (q_43))
        (when
          (q_27s)
          (q_27))
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
        (when
          (q_28s)
          (q_41s))
        (when
          (q_28s)
          (q_29s))
        (q_29t)
        (when
          (q_28s)
          (not 
            (q_28s)))
        (not 
          (q_28t))
      )
    )
  (:action o_sync_q_29s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_29t))
    :effect
      (and
        (when
          (q_29s)
          (q_36s))
        (when
          (q_29s)
          (q_30s))
        (q_30t)
        (when
          (q_29s)
          (not 
            (q_29s)))
        (not 
          (q_29t))
      )
    )
  (:action o_sync_q_30s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_30t))
    :effect
      (and
        (when
          (q_30s)
          (q_33s))
        (when
          (q_30s)
          (q_31s))
        (q_31t)
        (when
          (q_30s)
          (not 
            (q_30s)))
        (not 
          (q_30t))
      )
    )
  (:action o_sync_q_31s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_31t))
    :effect
      (and
        (when
          (q_31s)
          (q_34s))
        (when
          (q_31s)
          (q_32s))
        (q_32t)
        (when
          (q_31s)
          (not 
            (q_31s)))
        (not 
          (q_31t))
      )
    )
  (:action o_sync_q_32s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_32t))
    :effect
      (and
        (q_33t)
        (when
          (q_32s)
          (not 
            (q_32s)))
        (when
          (and
            (q_32s)
            (resist_coating))
          (not 
            (f_ok)))
        (not 
          (q_32t))
      )
    )
  (:action o_sync_q_33s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_33t))
    :effect
      (and
        (q_34t)
        (when
          (q_33s)
          (not 
            (q_33s)))
        (when
          (and
            (q_33s)
            (film_deposition))
          (not 
            (f_ok)))
        (not 
          (q_33t))
      )
    )
  (:action o_sync_q_34s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_34t))
    :effect
      (and
        (q_35t)
        (when
          (q_34s)
          (not 
            (q_34s)))
        (when
          (and
            (q_34s)
            (exposure))
          (not 
            (f_ok)))
        (not 
          (q_34t))
      )
    )
  (:action o_sync_q_35s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_35t))
    :effect
      (and
        (q_36t)
        (when
          (q_35s)
          (not 
            (q_35s)))
        (when
          (and
            (q_35s)
            (development))
          (not 
            (f_ok)))
        (not 
          (q_35t))
      )
    )
  (:action o_sync_q_36s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_36t))
    :effect
      (and
        (q_37t)
        (when
          (q_36s)
          (not 
            (q_36s)))
        (when
          (and
            (q_36s)
            (cleaning))
          (not 
            (f_ok)))
        (not 
          (q_36t))
      )
    )
  (:action o_sync_q_37s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_37t))
    :effect
      (and
        (q_38t)
        (when
          (q_37s)
          (not 
            (q_37s)))
        (when
          (and
            (q_37s)
            (not 
              (startsymb)))
          (not 
            (f_ok)))
        (not 
          (q_37t))
      )
    )
  (:action o_sync_q_38s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_38t))
    :effect
      (and
        (q_39t)
        (when
          (q_38s)
          (not 
            (q_38s)))
        (when
          (and
            (q_38s)
            (not 
              (resist_coating)))
          (not 
            (f_ok)))
        (not 
          (q_38t))
      )
    )
  (:action o_sync_q_39s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_39t))
    :effect
      (and
        (q_40t)
        (when
          (q_39s)
          (not 
            (q_39s)))
        (when
          (and
            (q_39s)
            (not 
              (film_deposition)))
          (not 
            (f_ok)))
        (not 
          (q_39t))
      )
    )
  (:action o_sync_q_40s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_40t))
    :effect
      (and
        (q_41t)
        (when
          (q_40s)
          (not 
            (q_40s)))
        (when
          (and
            (q_40s)
            (not 
              (exposure)))
          (not 
            (f_ok)))
        (not 
          (q_40t))
      )
    )
  (:action o_sync_q_41s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_41t))
    :effect
      (and
        (q_42t)
        (when
          (q_41s)
          (not 
            (q_41s)))
        (when
          (and
            (q_41s)
            (not 
              (development)))
          (not 
            (f_ok)))
        (not 
          (q_41t))
      )
    )
  (:action o_sync_q_42s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_42t))
    :effect
      (and
        (q_43t)
        (when
          (q_42s)
          (not 
            (q_42s)))
        (when
          (and
            (q_42s)
            (not 
              (cleaning)))
          (not 
            (f_ok)))
        (not 
          (q_42t))
      )
    )
  (:action o_sync_q_43s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_43t))
    :effect
      (and
        (q_44t)
        (when
          (q_43s)
          (not 
            (q_43s)))
        (not 
          (q_43t))
      )
    )
  (:action o_sync_q_44s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_44t))
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
          (q_29s)
          (q_29))
        (when
          (q_30s)
          (q_30))
        (when
          (q_31s)
          (q_31))
        (when
          (q_32s)
          (q_32))
        (when
          (q_33s)
          (q_33))
        (when
          (q_34s)
          (q_34))
        (when
          (q_35s)
          (q_35))
        (when
          (q_36s)
          (q_36))
        (when
          (q_37s)
          (q_37))
        (when
          (q_38s)
          (q_38))
        (when
          (q_39s)
          (q_39))
        (when
          (q_40s)
          (q_40))
        (when
          (q_41s)
          (q_41))
        (when
          (q_42s)
          (q_42))
        (when
          (q_43s)
          (q_43))
        (when
          (q_44s)
          (q_44))
        (when
          (q_44s)
          (not 
            (f_ok)))
        (not 
          (q_44t))
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
          (q_44s))
      )
    )
)