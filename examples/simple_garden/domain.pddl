(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_x0 - state
    s0_x1 - state
    clean - action
    water - action
  startsymb - action
  )
  (:predicates
    (current_state_0 ?s - state)
    (last_action ?a - action)
  )
(:action clean_0_x0
    :precondition (current_state_0 s0_x0)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_x0)) (current_state_0 s0_x1))
         )
        (last_action clean)
        (not (last_action water))
    )
)
(:action clean_0_x1
    :precondition (current_state_0 s0_x1)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_x1)) (current_state_0 s0_sink))
         )
        (last_action clean)
        (not (last_action water))
    )
)
(:action water_0_x0
    :precondition (current_state_0 s0_x0)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_x0)) (current_state_0 s0_sink))
         )
        (last_action water)
        (not (last_action clean))
    )
)
(:action water_0_x1
    :precondition (current_state_0 s0_x1)
    :effect (and
        (oneof
            (and (not (current_state_0 s0_x1)) (current_state_0 s0_x0))
         )
        (last_action water)
        (not (last_action clean))
    )
)
  )
