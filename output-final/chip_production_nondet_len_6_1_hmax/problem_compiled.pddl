(define (problem problem)

  (:domain 'domain-problem')
  (:objects s0_handler_cleaning_0 - state s0_handler_cleaning_broken - state s1_handler_film_deposition_0 - state s1_handler_film_deposition_broken - state s2_handler_resist_coating_0 - state s2_handler_resist_coating_broken - state s3_handler_exposure_0 - state s3_handler_exposure_broken - state s4_handler_development_0 - state s4_handler_development_broken - state s5_handler_etching_0 - state s5_handler_etching_broken - state)
  (:init 
    (current_state_0 s0_handler_cleaning_0)
    (current_state_1 s1_handler_film_deposition_0)
    (current_state_2 s2_handler_resist_coating_0)
    (current_state_3 s3_handler_exposure_0)
    (current_state_4 s4_handler_development_0)
    (current_state_5 s5_handler_etching_0)
    (startsymb)
    (q_27)
    (f_copy)
    (f_ok)
  )
  (:goal (and (f_goal) (current_state_0 s0_handler_cleaning_0)  (current_state_1 s1_handler_film_deposition_0)  (current_state_2 s2_handler_resist_coating_0)  (current_state_3 s3_handler_exposure_0)  (current_state_4 s4_handler_development_0)  (current_state_5 s5_handler_etching_0) ))

)