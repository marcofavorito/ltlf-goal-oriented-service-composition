(define (domain 'domain-problem')
  (:types
    state - NO_TYPE
    action - NO_TYPE
  )

  (:predicates
    (current_state_0 ?x0 - state)
    (clean)
    (empty)
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
  )
  (:action clean_0_a0
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_a0)
        (f_ok)
        (f_world))
    :effect
      (and
        (oneof (current_state_0 s0_a0) (and (not (current_state_0 s0_a0)) (current_state_0 s0_a1)))
        (clean)
        (f_copy)
        (not 
          (empty))
        (not 
          (f_world))
      )
    )
  (:action empty_0_a1
    :parameters ()
    :precondition 
      (and
        (current_state_0 s0_a1)
        (f_ok)
        (f_world))
    :effect
      (and
        (and
          (not 
            (current_state_0 s0_a1))
          (current_state_0 s0_a0))
        (empty)
        (f_copy)
        (not 
          (clean))
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
          (q_6s)))
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
        (clean)
        (f_sync)
        (f_ok)
        (q_1s))
    :effect
      (and
        (when
          (and
            (q_1s)
            (clean)
            (q_3d)
            (q_4d))
          (q_1d))
        (not 
          (q_1s))
      )
    )
  (:action o_sync_q_2s
    :parameters ()
    :precondition 
      (and
        (startsymb)
        (f_sync)
        (f_ok)
        (q_2s))
    :effect
      (and
        (when
          (and
            (q_2s)
            (startsymb)
            (q_4d))
          (q_2d))
        (not 
          (q_2s))
      )
    )
  (:action o_sync_q_3s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_3s))
    :effect
      (and
        (q_5)
        (q_1)
        (when
          (q_4d)
          (q_3d))
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
        (q_2s)
        (q_3s)
        (q_4d)
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
(not 
        (q_5s))    )
  (:action o_sync_q_6s
    :parameters ()
    :precondition 
      (and
        (f_sync)
        (f_ok)
        (q_6s))
    :effect
      (and
        (not 
          (q_6s))
        (not 
          (f_ok))
      )
    )
)