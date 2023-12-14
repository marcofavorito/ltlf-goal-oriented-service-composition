(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_handler_cleaning_0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (next (eventually cleaning)))
    (eventually (and
           (current_state_0 s0_handler_cleaning_0)
        (not (next (true) ))))
)))