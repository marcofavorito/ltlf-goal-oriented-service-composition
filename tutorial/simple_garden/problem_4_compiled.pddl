(define (problem problem)

  (:domain 'domain-problem')
  (:objects s0_a0 - state s0_a1 - state)
  (:init 
    (current_state_0 s0_a0)
    (startsymb)
    (q_1)
    (f_copy)
    (f_ok)
  )
  (:goal (and (current_state_0 s0_a0) 
    (not 
      (q_5))
    (q_1d)
    (q_3d)
    (q_2d)
    (q_4d)))

)