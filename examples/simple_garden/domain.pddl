(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_a0 - state
    s0_a1 - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (clean)
    (empty)
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
    )
)
(:action empty_0_a1
    :precondition (current_state_0 s0_a1)
    :effect (and
            (and (not (current_state_0 s0_a1)) (current_state_0 s0_a0))
        (empty)
        (not (clean))
    )
)
  )
