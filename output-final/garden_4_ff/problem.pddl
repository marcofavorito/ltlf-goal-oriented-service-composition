(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_a0)
    (current_state_1 s1_b0)
    (current_state_2 s2_c0)
    (startsymb)
    )
    (:goal (and
            (and startsymb (next (and clean (next (until clean (or (and water (next pluck)) (and pluck (next water))))))))
            )
    )
)
