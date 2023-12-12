(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_x0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (next clean))
    (eventually (and
           (current_state_0 s0_x0)
 (not (next (true) ))))
)))