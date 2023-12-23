(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s1_handler_film_deposition_0 - state
    s2_handler_resist_coating_0 - state
    s3_handler_exposure_0 - state
    s4_handler_development_0 - state
    s5_handler_etching_0 - state
  )
  (:predicates
    (current_state_0 ?s - state)
    (current_state_1 ?s - state)
    (current_state_2 ?s - state)
    (current_state_3 ?s - state)
    (current_state_4 ?s - state)
    (current_state_5 ?s - state)
    (cleaning)
    (development)
    (etching)
    (exposure)
    (film_deposition)
    (resist_coating)
    (startsymb)
  )
(:action cleaning_0_handler_cleaning_0
    :precondition (current_state_0 s0_handler_cleaning_0)
    :effect (and
            (current_state_0 s0_handler_cleaning_0)
        (cleaning)
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action development_4_handler_development_0
    :precondition (current_state_4 s4_handler_development_0)
    :effect (and
            (current_state_4 s4_handler_development_0)
        (development)
        (not (cleaning))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action etching_5_handler_etching_0
    :precondition (current_state_5 s5_handler_etching_0)
    :effect (and
            (current_state_5 s5_handler_etching_0)
        (etching)
        (not (cleaning))
        (not (development))
        (not (exposure))
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action exposure_3_handler_exposure_0
    :precondition (current_state_3 s3_handler_exposure_0)
    :effect (and
            (current_state_3 s3_handler_exposure_0)
        (exposure)
        (not (cleaning))
        (not (development))
        (not (etching))
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
        (not (development))
        (not (etching))
        (not (exposure))
        (not (resist_coating))
    )
)
(:action resist_coating_2_handler_resist_coating_0
    :precondition (current_state_2 s2_handler_resist_coating_0)
    :effect (and
            (current_state_2 s2_handler_resist_coating_0)
        (resist_coating)
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
    )
)
  )
