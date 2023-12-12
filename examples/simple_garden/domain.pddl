(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_x0 - state
    s0_x1 - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (clean)
    (water)
    (startsymb)
  )
(:action clean_0_x0
    :precondition (current_state_0 s0_x0)
    :effect (and
            (and (not (current_state_0 s0_x0)) (current_state_0 s0_x1))
        (clean)
        (not (water))
    )
)
(:action clean_0_x1
    :precondition (current_state_0 s0_x1)
    :effect (and
            (and (not (current_state_0 s0_x1)) (current_state_0 s0_sink))
        (clean)
        (not (water))
    )
)
(:action water_0_x0
    :precondition (current_state_0 s0_x0)
    :effect (and
            (and (not (current_state_0 s0_x0)) (current_state_0 s0_sink))
        (water)
        (not (clean))
    )
)
(:action water_0_x1
    :precondition (current_state_0 s0_x1)
    :effect (and
            (and (not (current_state_0 s0_x1)) (current_state_0 s0_x0))
        (water)
        (not (clean))
    )
)
  )
