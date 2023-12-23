(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s0_handler_cleaning_broken - state
    s1_handler_film_deposition_0 - state
    s1_handler_film_deposition_broken - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (cleaning)
    (film_deposition)
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
        (not (film_deposition))
        (not (repair))
    )
)
(:action film_deposition_1_handler_film_deposition_0
    :precondition (current_state_1 s1_handler_film_deposition_0)
    :effect (and
        (oneof
            (current_state_1 s1_handler_film_deposition_0)
            (and (not (current_state_1 s1_handler_film_deposition_0)) (current_state_1 s1_handler_film_deposition_broken))
         )
        (film_deposition)
        (not (cleaning))
        (not (repair))
    )
)
(:action repair_0_handler_cleaning_broken
    :precondition (current_state_0 s0_handler_cleaning_broken)
    :effect (and
            (and (not (current_state_0 s0_handler_cleaning_broken)) (current_state_0 s0_handler_cleaning_0))
        (repair)
        (not (cleaning))
        (not (film_deposition))
    )
)
(:action repair_1_handler_film_deposition_broken
    :precondition (current_state_1 s1_handler_film_deposition_broken)
    :effect (and
            (and (not (current_state_1 s1_handler_film_deposition_broken)) (current_state_1 s1_handler_film_deposition_0))
        (repair)
        (not (cleaning))
        (not (film_deposition))
    )
)
  )
