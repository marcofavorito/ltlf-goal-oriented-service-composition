(define (problem service-problem)
    (:domain composition)
    (:init
    (current_state_0 s0_a0)
    (current_state_1 s1_b0)
    (current_state_2 s2_c0)
    )
    (:goal (and
            (and clean (next (until clean (or (and water (next pluck)) (and pluck (next water))))) (always (or water pluck clean empty)) (always (or (not water) (and (not pluck) (not clean) (not empty)))) (always (or (not pluck) (and (not water) (not clean) (not empty)))) (always (or (not clean) (and (not water) (not pluck) (not empty)))) (always (or (not empty) (and (not water) (not pluck) (not clean)))))
       (or
           (current_state_0 s0_a0)
       )
       (or
           (current_state_1 s1_b0)
       )
       (or
           (current_state_2 s2_c0)
       )
)))