(define (domain 'domain-problem')
  (:types
    state - NO_TYPE
    action - NO_TYPE
  )

  (:predicates
    (current_state_0 ?x0 - state)
    (cleaning)
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
        (current_state_0 s0_handler_cleaning_0)
        (cleaning)
        (f_copy)
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
          (q_6)))
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
          (q_7s)))
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
        (startsymb)
        (f_sync)
        (f_ok)
        (q_2s))
    :effect
(not 
        (q_2s))    )
  (:action o_sync_q_3s_1
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_3s))
    :effect
      (and
        (q_1s)
        (not 
          (q_3s))
      )
    )
  (:action o_sync_q_3s_2
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_3s))
    :effect
      (and
        (q_6)
        (q_3)
        (not 
          (q_3s))
      )
    )
  (:action o_sync_q_4s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_4s))
    :effect
      (and
        (q_6)
        (q_3)
        (not 
          (q_4s))
      )
    )
  (:action o_sync_q_5s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_5s))
    :effect
      (and
        (q_2s)
        (q_4s)
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
(not 
        (q_6s))    )
  (:action o_sync_q_7s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_7s))
    :effect
      (and
        (not 
          (q_7s))
        (not 
          (f_ok))
      )
    )
)