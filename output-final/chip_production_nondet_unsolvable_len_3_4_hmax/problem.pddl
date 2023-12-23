(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_handler_cleaning_0)
    (current_state_1 s1_handler_film_deposition_0)
    (current_state_2 s2_handler_resist_coating_0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (next (eventually (and cleaning (not film_deposition) (not resist_coating) (eventually (and film_deposition (not cleaning) (not resist_coating) (eventually (and resist_coating (not cleaning) (not film_deposition)))))))))
            )
    )
)
