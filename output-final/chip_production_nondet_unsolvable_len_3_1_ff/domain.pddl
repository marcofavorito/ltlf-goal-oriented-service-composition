(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s1_handler_film_deposition_0 - state
    s2_handler_resist_coating_0 - state
    s2_handler_resist_coating_broken - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (current_state_2 ?s - state)
    (cleaning)
    (film_deposition)
    (resist_coating)
    (startsymb)
  )
(:action cleaning_0_handler_cleaning_0
    :precondition (current_state_0 s0_handler_cleaning_0)
    :effect (and
            (current_state_0 s0_handler_cleaning_0)
        (cleaning)
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action film_deposition_1_handler_film_deposition_0
    :precondition (current_state_1 s1_handler_film_deposition_0)
    :effect (and
            (current_state_1 s1_handler_film_deposition_0)
        (film_deposition)
        (not (cleaning))
        (not (resist_coating))
    )
)
(:action resist_coating_2_handler_resist_coating_0
    :precondition (current_state_2 s2_handler_resist_coating_0)
    :effect (and
        (oneof
            (current_state_2 s2_handler_resist_coating_0)
            (and (not (current_state_2 s2_handler_resist_coating_0)) (current_state_2 s2_handler_resist_coating_broken))
         )
        (resist_coating)
        (not (cleaning))
        (not (film_deposition))
    )
)
  )
