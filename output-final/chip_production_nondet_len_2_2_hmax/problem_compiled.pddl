(define (problem problem)

  (:domain 'domain-problem')
  (:objects s0_handler_cleaning_0 - state s0_handler_cleaning_broken - state s1_handler_film_deposition_0 - state s1_handler_film_deposition_broken - state)
  (:init 
    (current_state_0 s0_handler_cleaning_0)
    (current_state_1 s1_handler_film_deposition_0)
    (startsymb)
    (q_1)
    (f_copy)
    (f_ok)
  )
  (:goal (and (f_goal) (current_state_0 s0_handler_cleaning_0)  (current_state_1 s1_handler_film_deposition_0) ))

)