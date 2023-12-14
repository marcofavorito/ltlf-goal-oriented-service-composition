(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_a0 - state
    s0_a1 - state
    s1_b0 - state
    s1_b1 - state
    s1_b2 - state
    s2_c0 - state
    s2_c1 - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (current_state_2 ?s - state)
    (clean)
    (empty)
    (pluck)
    (water)
    (startsymb)
  )
(:action clean_0_a0
    :precondition (current_state_0 s0_a0)
    :effect (and
        (oneof
            (current_state_0 s0_a0)
            (and (not (current_state_0 s0_a0)) (current_state_0 s0_a1))
         )
        (clean)
        (not (empty))
        (not (pluck))
        (not (water))
    )
)
(:action empty_0_a1
    :precondition (current_state_0 s0_a1)
    :effect (and
            (and (not (current_state_0 s0_a1)) (current_state_0 s0_a0))
        (empty)
        (not (clean))
        (not (pluck))
        (not (water))
    )
)
(:action empty_1_b1
    :precondition (current_state_1 s1_b1)
    :effect (and
            (and (not (current_state_1 s1_b1)) (current_state_1 s1_b0))
        (empty)
        (not (clean))
        (not (pluck))
        (not (water))
    )
)
(:action empty_2_c1
    :precondition (current_state_2 s2_c1)
    :effect (and
            (and (not (current_state_2 s2_c1)) (current_state_2 s2_c0))
        (empty)
        (not (clean))
        (not (pluck))
        (not (water))
    )
)
(:action pluck_1_b0
    :precondition (current_state_1 s1_b0)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b0)) (current_state_1 s1_b1))
            (and (not (current_state_1 s1_b0)) (current_state_1 s1_b2))
         )
        (pluck)
        (not (clean))
        (not (empty))
        (not (water))
    )
)
(:action pluck_2_c0
    :precondition (current_state_2 s2_c0)
    :effect (and
            (and (not (current_state_2 s2_c0)) (current_state_2 s2_c1))
        (pluck)
        (not (clean))
        (not (empty))
        (not (water))
    )
)
(:action water_1_b0
    :precondition (current_state_1 s1_b0)
    :effect (and
            (current_state_1 s1_b0)
        (water)
        (not (clean))
        (not (empty))
        (not (pluck))
    )
)
(:action water_1_b1
    :precondition (current_state_1 s1_b1)
    :effect (and
            (current_state_1 s1_b1)
        (water)
        (not (clean))
        (not (empty))
        (not (pluck))
    )
)
  )
