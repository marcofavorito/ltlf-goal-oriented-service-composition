(define (problem problem)

  (:domain 'domain-problem')
  (:objects s0_a0 - state s0_a1 - state s1_b0 - state s1_b1 - state s1_b2 - state s2_c0 - state s2_c1 - state)
  (:init 
    (current_state_0 s0_a0)
    (current_state_1 s1_b0)
    (current_state_2 s2_c0)
    (startsymb)
    (q_1)
    (f_copy)
    (f_ok)
  )
  (:goal (and (current_state_0 s0_a0)  (current_state_1 s1_b0)  (current_state_2 s2_c0) 
    (not 
      (q_15))
    (q_1d)
    (q_12d)
    (q_2d)
    (q_3d)
    (q_14d)
    (q_4d)
    (q_5d)
    (q_6d)
    (or
      (and
        (q_8d)
        (q_13d)
        (q_9d)
        (q_11d))
      (and
        (q_7d)
        (q_11d)
        (q_10d)
        (q_13d)))))

)