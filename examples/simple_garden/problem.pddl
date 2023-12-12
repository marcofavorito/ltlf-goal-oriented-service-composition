(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_x0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (next (and clean (next water))))
       (or
           (current_state_0 s0_x0)
           (current_state_0 s0_x1)
       )
)))