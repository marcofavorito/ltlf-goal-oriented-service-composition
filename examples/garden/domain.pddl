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
    clean - action
    empty - action
    pluck - action
    water - action
    startaction - action
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (current_state_2 ?s - state)
    (last_action ?a - action)
  )
(:action clean_0_a0
    :precondition (current_state_0 s0_a0)
    :effect (and
        (oneof
            (current_state_0 s0_a0)
            (and (not (current_state_0 s0_a0)) (current_state_0 s0_a1))
         )
        (last_action clean)
        (not (last_action empty))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action clean_0_a1
    :precondition (current_state_0 s0_a1)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_a1)) (current_state_0 s0_sink))
         )
        (last_action clean)
        (not (last_action empty))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action clean_1_b0
    :precondition (current_state_1 s1_b0)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b0)) (current_state_1 s1_sink))
         )
        (last_action clean)
        (not (last_action empty))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action clean_1_b1
    :precondition (current_state_1 s1_b1)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b1)) (current_state_1 s1_sink))
         )
        (last_action clean)
        (not (last_action empty))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action clean_1_b2
    :precondition (current_state_1 s1_b2)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b2)) (current_state_1 s1_sink))
         )
        (last_action clean)
        (not (last_action empty))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action clean_2_c0
    :precondition (current_state_2 s2_c0)
    :effect (and
        (oneof
            (and (not (current_state_2 s2_c0)) (current_state_2 s2_sink))
         )
        (last_action clean)
        (not (last_action empty))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action clean_2_c1
    :precondition (current_state_2 s2_c1)
    :effect (and
        (oneof
            (and (not (current_state_2 s2_c1)) (current_state_2 s2_sink))
         )
        (last_action clean)
        (not (last_action empty))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action empty_0_a0
    :precondition (current_state_0 s0_a0)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_a0)) (current_state_0 s0_sink))
         )
        (last_action empty)
        (not (last_action clean))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action empty_0_a1
    :precondition (current_state_0 s0_a1)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_a1)) (current_state_0 s0_a0))
         )
        (last_action empty)
        (not (last_action clean))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action empty_1_b0
    :precondition (current_state_1 s1_b0)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b0)) (current_state_1 s1_sink))
         )
        (last_action empty)
        (not (last_action clean))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action empty_1_b1
    :precondition (current_state_1 s1_b1)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b1)) (current_state_1 s1_b0))
         )
        (last_action empty)
        (not (last_action clean))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action empty_1_b2
    :precondition (current_state_1 s1_b2)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b2)) (current_state_1 s1_sink))
         )
        (last_action empty)
        (not (last_action clean))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action empty_2_c0
    :precondition (current_state_2 s2_c0)
    :effect (and
        (oneof
            (and (not (current_state_2 s2_c0)) (current_state_2 s2_sink))
         )
        (last_action empty)
        (not (last_action clean))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action empty_2_c1
    :precondition (current_state_2 s2_c1)
    :effect (and
        (oneof
            (and (not (current_state_2 s2_c1)) (current_state_2 s2_c0))
         )
        (last_action empty)
        (not (last_action clean))
        (not (last_action pluck))
        (not (last_action water))
    )
)
(:action pluck_0_a0
    :precondition (current_state_0 s0_a0)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_a0)) (current_state_0 s0_sink))
         )
        (last_action pluck)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action water))
    )
)
(:action pluck_0_a1
    :precondition (current_state_0 s0_a1)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_a1)) (current_state_0 s0_sink))
         )
        (last_action pluck)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action water))
    )
)
(:action pluck_1_b0
    :precondition (current_state_1 s1_b0)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b0)) (current_state_1 s1_b1))
            (and (not (current_state_1 s1_b0)) (current_state_1 s1_b2))
         )
        (last_action pluck)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action water))
    )
)
(:action pluck_1_b1
    :precondition (current_state_1 s1_b1)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b1)) (current_state_1 s1_sink))
         )
        (last_action pluck)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action water))
    )
)
(:action pluck_1_b2
    :precondition (current_state_1 s1_b2)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b2)) (current_state_1 s1_sink))
         )
        (last_action pluck)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action water))
    )
)
(:action pluck_2_c0
    :precondition (current_state_2 s2_c0)
    :effect (and
        (oneof
            (and (not (current_state_2 s2_c0)) (current_state_2 s2_c1))
         )
        (last_action pluck)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action water))
    )
)
(:action pluck_2_c1
    :precondition (current_state_2 s2_c1)
    :effect (and
        (oneof
            (and (not (current_state_2 s2_c1)) (current_state_2 s2_sink))
         )
        (last_action pluck)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action water))
    )
)
(:action water_0_a0
    :precondition (current_state_0 s0_a0)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_a0)) (current_state_0 s0_sink))
         )
        (last_action water)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action pluck))
    )
)
(:action water_0_a1
    :precondition (current_state_0 s0_a1)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_a1)) (current_state_0 s0_sink))
         )
        (last_action water)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action pluck))
    )
)
(:action water_1_b0
    :precondition (current_state_1 s1_b0)
    :effect (and
        (oneof
            (current_state_1 s1_b0)
         )
        (last_action water)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action pluck))
    )
)
(:action water_1_b1
    :precondition (current_state_1 s1_b1)
    :effect (and
        (oneof
            (current_state_1 s1_b1)
         )
        (last_action water)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action pluck))
    )
)
(:action water_1_b2
    :precondition (current_state_1 s1_b2)
    :effect (and
        (oneof
            (and (not (current_state_1 s1_b2)) (current_state_1 s1_sink))
         )
        (last_action water)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action pluck))
    )
)
(:action water_2_c0
    :precondition (current_state_2 s2_c0)
    :effect (and
        (oneof
            (and (not (current_state_2 s2_c0)) (current_state_2 s2_sink))
         )
        (last_action water)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action pluck))
    )
)
(:action water_2_c1
    :precondition (current_state_2 s2_c1)
    :effect (and
        (oneof
            (and (not (current_state_2 s2_c1)) (current_state_2 s2_sink))
         )
        (last_action water)
        (not (last_action clean))
        (not (last_action empty))
        (not (last_action pluck))
    )
)
  )
