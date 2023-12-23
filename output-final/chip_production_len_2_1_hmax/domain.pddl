(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s1_handler_film_deposition_0 - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (cleaning)
    (film_deposition)
    (startsymb)
  )
(:action cleaning_0_handler_cleaning_0
    :precondition (current_state_0 s0_handler_cleaning_0)
    :effect (and
            (current_state_0 s0_handler_cleaning_0)
        (cleaning)
        (not (film_deposition))
    )
)
(:action film_deposition_1_handler_film_deposition_0
    :precondition (current_state_1 s1_handler_film_deposition_0)
    :effect (and
            (current_state_1 s1_handler_film_deposition_0)
        (film_deposition)
        (not (cleaning))
    )
)
  )
