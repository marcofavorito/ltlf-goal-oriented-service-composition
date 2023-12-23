(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s0_handler_cleaning_broken - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (cleaning)
    (repair)
    (startsymb)
  )
(:action cleaning_0_handler_cleaning_0
    :precondition (current_state_0 s0_handler_cleaning_0)
    :effect (and
        (oneof
            (current_state_0 s0_handler_cleaning_0)
            (and (not (current_state_0 s0_handler_cleaning_0)) (current_state_0 s0_handler_cleaning_broken))
         )
        (cleaning)
        (not (repair))
    )
)
(:action repair_0_handler_cleaning_broken
    :precondition (current_state_0 s0_handler_cleaning_broken)
    :effect (and
            (and (not (current_state_0 s0_handler_cleaning_broken)) (current_state_0 s0_handler_cleaning_0))
        (repair)
        (not (cleaning))
    )
)
  )
