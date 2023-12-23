(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (cleaning)
    (startsymb)
  )
(:action cleaning_0_handler_cleaning_0
    :precondition (current_state_0 s0_handler_cleaning_0)
    :effect (and
            (current_state_0 s0_handler_cleaning_0)
        (cleaning)
    )
)
  )
