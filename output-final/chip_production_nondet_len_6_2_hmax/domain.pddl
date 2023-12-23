(define (domain composition)
  (:requirements :strips :typing :non-deterministic :conditional-effects)
  (:types state action)
  (:constants
    s0_handler_cleaning_0 - state
    s0_handler_cleaning_broken - state
    s1_handler_film_deposition_0 - state
    s1_handler_film_deposition_broken - state
    s2_handler_resist_coating_0 - state
    s2_handler_resist_coating_broken - state
    s3_handler_exposure_0 - state
    s3_handler_exposure_broken - state
    s4_handler_development_0 - state
    s4_handler_development_broken - state
    s5_handler_etching_0 - state
    s5_handler_etching_broken - state
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
    (repair)
    (resist_coating)
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
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (repair))
        (not (resist_coating))
    )
)
(:action development_4_handler_development_0
    :precondition (current_state_4 s4_handler_development_0)
    :effect (and
        (oneof
            (current_state_4 s4_handler_development_0)
            (and (not (current_state_4 s4_handler_development_0)) (current_state_4 s4_handler_development_broken))
         )
        (development)
        (not (cleaning))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (repair))
        (not (resist_coating))
    )
)
(:action etching_5_handler_etching_0
    :precondition (current_state_5 s5_handler_etching_0)
    :effect (and
        (oneof
            (current_state_5 s5_handler_etching_0)
            (and (not (current_state_5 s5_handler_etching_0)) (current_state_5 s5_handler_etching_broken))
         )
        (etching)
        (not (cleaning))
        (not (development))
        (not (exposure))
        (not (film_deposition))
        (not (repair))
        (not (resist_coating))
    )
)
(:action exposure_3_handler_exposure_0
    :precondition (current_state_3 s3_handler_exposure_0)
    :effect (and
        (oneof
            (current_state_3 s3_handler_exposure_0)
            (and (not (current_state_3 s3_handler_exposure_0)) (current_state_3 s3_handler_exposure_broken))
         )
        (exposure)
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (film_deposition))
        (not (repair))
        (not (resist_coating))
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
        (not (development))
        (not (etching))
        (not (exposure))
        (not (repair))
        (not (resist_coating))
    )
)
(:action repair_0_handler_cleaning_broken
    :precondition (current_state_0 s0_handler_cleaning_broken)
    :effect (and
            (and (not (current_state_0 s0_handler_cleaning_broken)) (current_state_0 s0_handler_cleaning_0))
        (repair)
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action repair_1_handler_film_deposition_broken
    :precondition (current_state_1 s1_handler_film_deposition_broken)
    :effect (and
            (and (not (current_state_1 s1_handler_film_deposition_broken)) (current_state_1 s1_handler_film_deposition_0))
        (repair)
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action repair_2_handler_resist_coating_broken
    :precondition (current_state_2 s2_handler_resist_coating_broken)
    :effect (and
            (and (not (current_state_2 s2_handler_resist_coating_broken)) (current_state_2 s2_handler_resist_coating_0))
        (repair)
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action repair_3_handler_exposure_broken
    :precondition (current_state_3 s3_handler_exposure_broken)
    :effect (and
            (and (not (current_state_3 s3_handler_exposure_broken)) (current_state_3 s3_handler_exposure_0))
        (repair)
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action repair_4_handler_development_broken
    :precondition (current_state_4 s4_handler_development_broken)
    :effect (and
            (and (not (current_state_4 s4_handler_development_broken)) (current_state_4 s4_handler_development_0))
        (repair)
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (resist_coating))
    )
)
(:action repair_5_handler_etching_broken
    :precondition (current_state_5 s5_handler_etching_broken)
    :effect (and
            (and (not (current_state_5 s5_handler_etching_broken)) (current_state_5 s5_handler_etching_0))
        (repair)
        (not (cleaning))
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
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
        (not (development))
        (not (etching))
        (not (exposure))
        (not (film_deposition))
        (not (repair))
    )
)
  )
