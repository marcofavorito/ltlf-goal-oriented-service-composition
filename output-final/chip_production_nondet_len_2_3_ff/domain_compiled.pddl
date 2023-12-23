(define (domain 'domain-problem')
  (:types
    state - NO_TYPE
    action - NO_TYPE
  )

  (:predicates
    (current_state_0 ?x0 - state)
    (current_state_1 ?x0 - state)
    (cleaning)
    (film_deposition)
    (repair)
    (startsymb)
    (f_copy)
    (f_sync)
    (f_world)
    (f_ok)
    (q_1)
    (q_1s)
    (q_1d)
    (q_2)
    (q_2s)
    (q_2d)
    (q_3)
    (q_3s)
    (q_3d)
    (q_4)
    (q_4s)
    (q_4d)
    (q_5)
    (q_5s)
    (q_5d)
    (q_6)
    (q_6s)
    (q_6d)
    (q_7)
    (q_7s)
    (q_7d)
    (q_8)
    (q_8s)
    (q_8d)
    (q_9)
    (q_9s)
    (q_9d)
    (q_10)
    (q_10s)
    (q_10d)
    (q_11)
    (q_11s)
    (q_11d)
    (q_12)
    (q_12s)
    (q_12d)
    (q_13)
    (q_13s)
    (q_13d)
    (q_14)
    (q_14s)
    (q_14d)
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
          (film_deposition))
        (not 
          (repair))
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
          (repair))
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
          (film_deposition))
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
          (film_deposition))
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
      )
    )
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
          (q_14s)))
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
      (and
        (when
          (and
            (q_1s)
            (cleaning)
            (q_4d)
            (q_6d)
            (q_9d)
            (q_11d))
          (q_1d))
        (not 
          (q_1s))
      )
    )
  (:action o_sync_q_2s
    :parameters ()
    :precondition 
      (and
        (film_deposition)
        (f_sync)
        (f_ok)
        (q_2s))
    :effect
      (and
        (when
          (and
            (q_2s)
            (film_deposition)
            (q_4d)
            (q_5d)
            (q_6d)
            (q_9d)
            (q_10d)
            (q_11d)
            (q_12d))
          (q_2d))
        (not 
          (q_2s))
      )
    )
  (:action o_sync_q_3s
    :parameters ()
    :precondition 
      (and
        (startsymb)
        (f_sync)
        (f_ok)
        (q_3s))
    :effect
      (and
        (when
          (and
            (q_3s)
            (startsymb)
            (q_11d))
          (q_3d))
        (not 
          (q_3s))
      )
    )
  (:action o_sync_q_4s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_4s))
    :effect
      (and
        (q_9s)
        (when
          (and
            (q_6d)
            (q_11d))
          (q_4d))
        (not 
          (q_4s))
      )
    )
  (:action o_sync_q_4s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_4s))
    :effect
      (and
        (q_13)
        (q_4)
        (not 
          (q_4s))
      )
    )
  (:action o_sync_q_5s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_5s))
    :effect
      (and
        (q_10s)
        (when
          (and
            (q_4d)
            (q_6d)
            (q_9d)
            (q_11d)
            (q_12d))
          (q_5d))
        (not 
          (q_5s))
      )
    )
  (:action o_sync_q_5s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_5s))
    :effect
      (and
        (q_13)
        (q_5)
        (not 
          (q_5s))
      )
    )
  (:action o_sync_q_6s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_6s))
    :effect
      (and
        (q_13)
        (q_4)
        (when
          (q_11d)
          (q_6d))
        (not 
          (q_6s))
      )
    )
  (:action o_sync_q_7s
    :parameters ()
    :precondition 
      (and
        (not 
          (cleaning))
        (f_sync)
        (f_ok)
        (q_7s))
    :effect
      (and
        (when
          (and
            (q_7s)
            (not 
              (cleaning))
            (q_4d)
            (q_5d)
            (q_6d)
            (q_9d)
            (q_10d)
            (q_11d)
            (q_12d))
          (q_7d))
        (not 
          (q_7s))
      )
    )
  (:action o_sync_q_8s
    :parameters ()
    :precondition 
      (and
        (not 
          (film_deposition))
        (f_sync)
        (f_ok)
        (q_8s))
    :effect
      (and
        (when
          (and
            (q_8s)
            (not 
              (film_deposition))
            (q_4d)
            (q_6d)
            (q_9d)
            (q_11d)
            (q_12d))
          (q_8d))
        (not 
          (q_8s))
      )
    )
  (:action o_sync_q_9s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_9s))
    :effect
      (and
        (q_1s)
        (q_12s)
        (when
          (and
            (q_4d)
            (q_6d)
            (q_11d))
          (q_9d))
        (not 
          (q_9s))
      )
    )
  (:action o_sync_q_10s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_10s))
    :effect
      (and
        (q_2s)
        (q_7s)
        (when
          (and
            (q_4d)
            (q_5d)
            (q_6d)
            (q_9d)
            (q_11d)
            (q_12d))
          (q_10d))
        (not 
          (q_10s))
      )
    )
  (:action o_sync_q_11s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_11s))
    :effect
      (and
        (q_3s)
        (q_6s)
        (q_11d)
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
        (q_5s)
        (q_8s)
        (when
          (and
            (q_4d)
            (q_6d)
            (q_9d)
            (q_11d))
          (q_12d))
        (not 
          (q_12s))
      )
    )
  (:action o_sync_q_13s
    :parameters ()
    :precondition 
      (and
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
        (f_sync)
        (f_ok)
        (q_14s))
    :effect
      (and
        (not 
          (q_14s))
        (not 
          (f_ok))
      )
    )
)