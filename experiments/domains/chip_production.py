from typing import Sequence, Callable


# all the atomic actions for the task
CLEANING = "cleaning"
FILM_DEPOSITION = "film_deposition"
RESIST_COATING = "resist_coating"
EXPOSURE = "exposure"
DEVELOPMENT = "development"
ETCHING = "etching"
IMPURITIES_IMPLANTATION = "impurities_implantation"
ACTIVATION = "activation"
RESIST_STRIPPING = "resist_stripping"
ASSEMBLY = "assembly"
TESTING ="testing"
PACKAGING = "packaging"


ALL_SYMBOLS = [
    CLEANING,
    FILM_DEPOSITION,
    RESIST_COATING,
    EXPOSURE,
    DEVELOPMENT,
    ETCHING,
    IMPURITIES_IMPLANTATION,
    ACTIVATION,
    RESIST_STRIPPING,
    ASSEMBLY,
    TESTING,
    PACKAGING
]


def get_goal_fn(current_symbols: Sequence[str]) -> Callable:
    def build_goal():
        assert len(current_symbols) >= 1
        all_but_one = lambda s: f"{s} & " + " & ".join([f"!{other}" for other in current_symbols if other != s])
        if len(current_symbols) > 1:
            formula_str = f"F({all_but_one(current_symbols[0])}"
        else:
            formula_str = f"F({current_symbols[0]}"
        nb_open_brackets = 1
        for symbol in current_symbols[1:]:
            formula_str += f" & F({all_but_one(symbol)}"
            nb_open_brackets += 1
        formula_str += ")" * nb_open_brackets
        return formula_str
    return build_goal
