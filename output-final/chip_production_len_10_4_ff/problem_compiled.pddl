(define (problem problem)

  (:domain 'domain-problem')
  (:objects s0_handler_cleaning_0 - state s1_handler_film_deposition_0 - state s2_handler_resist_coating_0 - state s3_handler_exposure_0 - state s4_handler_development_0 - state s5_handler_etching_0 - state s6_handler_impurities_implantation_0 - state s7_handler_activation_0 - state s8_handler_resist_stripping_0 - state s9_handler_assembly_0 - state)
  (:init 
    (current_state_0 s0_handler_cleaning_0)
    (current_state_1 s1_handler_film_deposition_0)
    (current_state_2 s2_handler_resist_coating_0)
    (current_state_3 s3_handler_exposure_0)
    (current_state_4 s4_handler_development_0)
    (current_state_5 s5_handler_etching_0)
    (current_state_6 s6_handler_impurities_implantation_0)
    (current_state_7 s7_handler_activation_0)
    (current_state_8 s8_handler_resist_stripping_0)
    (current_state_9 s9_handler_assembly_0)
    (startsymb)
    (q_1)
    (f_copy)
    (f_ok)
  )
  (:goal (and (current_state_0 s0_handler_cleaning_0)  (current_state_1 s1_handler_film_deposition_0)  (current_state_2 s2_handler_resist_coating_0)  (current_state_3 s3_handler_exposure_0)  (current_state_4 s4_handler_development_0)  (current_state_5 s5_handler_etching_0)  (current_state_6 s6_handler_impurities_implantation_0)  (current_state_7 s7_handler_activation_0)  (current_state_8 s8_handler_resist_stripping_0)  (current_state_9 s9_handler_assembly_0) 
    (not 
      (q_133))
    (q_1d)
    (q_122d)
    (q_2d)
    (q_3d)
    (q_4d)
    (q_130d)
    (q_5d)
    (q_115d)
    (q_6d)
    (q_113d)
    (q_7d)
    (q_116d)
    (q_8d)
    (q_118d)
    (q_9d)
    (q_117d)
    (q_10d)
    (q_114d)
    (q_11d)
    (q_121d)
    (q_12d)
    (q_112d)
    (q_13d)
    (q_14d)
    (q_15d)
    (q_126d)
    (q_16d)
    (q_119d)
    (q_17d)
    (q_113d)
    (q_18d)
    (q_116d)
    (q_19d)
    (q_118d)
    (q_20d)
    (q_117d)
    (q_21d)
    (q_114d)
    (q_22d)
    (q_121d)
    (q_23d)
    (q_112d)
    (q_24d)
    (q_25d)
    (q_26d)
    (q_124d)
    (q_27d)
    (q_119d)
    (q_28d)
    (q_115d)
    (q_29d)
    (q_116d)
    (q_30d)
    (q_118d)
    (q_31d)
    (q_117d)
    (q_32d)
    (q_114d)
    (q_33d)
    (q_121d)
    (q_34d)
    (q_112d)
    (q_35d)
    (q_36d)
    (q_37d)
    (q_127d)
    (q_38d)
    (q_119d)
    (q_39d)
    (q_115d)
    (q_40d)
    (q_113d)
    (q_41d)
    (q_118d)
    (q_42d)
    (q_117d)
    (q_43d)
    (q_114d)
    (q_44d)
    (q_121d)
    (q_45d)
    (q_112d)
    (q_46d)
    (q_47d)
    (q_48d)
    (q_129d)
    (q_49d)
    (q_119d)
    (q_50d)
    (q_115d)
    (q_51d)
    (q_113d)
    (q_52d)
    (q_116d)
    (q_53d)
    (q_117d)
    (q_54d)
    (q_114d)
    (q_55d)
    (q_121d)
    (q_56d)
    (q_112d)
    (q_57d)
    (q_58d)
    (q_59d)
    (q_128d)
    (q_60d)
    (q_119d)
    (q_61d)
    (q_115d)
    (q_62d)
    (q_113d)
    (q_63d)
    (q_116d)
    (q_64d)
    (q_118d)
    (q_65d)
    (q_114d)
    (q_66d)
    (q_121d)
    (q_67d)
    (q_112d)
    (q_68d)
    (q_69d)
    (q_70d)
    (q_125d)
    (q_71d)
    (q_119d)
    (q_72d)
    (q_115d)
    (q_73d)
    (q_113d)
    (q_74d)
    (q_116d)
    (q_75d)
    (q_118d)
    (q_76d)
    (q_117d)
    (q_77d)
    (q_121d)
    (q_78d)
    (q_112d)
    (q_79d)
    (q_80d)
    (q_81d)
    (q_132d)
    (q_82d)
    (q_119d)
    (q_83d)
    (q_115d)
    (q_84d)
    (q_113d)
    (q_85d)
    (q_116d)
    (q_86d)
    (q_118d)
    (q_87d)
    (q_117d)
    (q_88d)
    (q_114d)
    (q_89d)
    (q_112d)
    (q_90d)
    (q_91d)
    (q_92d)
    (q_123d)
    (q_93d)
    (q_119d)
    (q_94d)
    (q_115d)
    (q_95d)
    (q_113d)
    (q_96d)
    (q_116d)
    (q_97d)
    (q_118d)
    (q_98d)
    (q_117d)
    (q_99d)
    (q_114d)
    (q_100d)
    (q_121d)
    (q_101d)
    (q_102d)
    (q_103d)
    (q_131d)
    (q_104d)
    (q_119d)
    (q_105d)
    (q_115d)
    (q_106d)
    (q_113d)
    (q_107d)
    (q_116d)
    (q_108d)
    (q_118d)
    (q_109d)
    (q_117d)
    (q_110d)
    (q_114d)
    (q_111d)
    (q_121d)
    (q_112d)
    (q_120d)
    (q_120d)
    (q_120d)
    (q_120d)
    (q_120d)
    (q_120d)
    (q_120d)
    (q_120d)
    (q_120d)))

)