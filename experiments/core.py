import dataclasses
import json
from enum import Enum
from pathlib import Path
from typing import Sequence, Optional

from pylogics.parsers import parse_ltl

from ltlf_goal_oriented_service_composition.rewrite_formula import rewrite
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.to_pddl import services_to_pddl, _START_SYMB


class Heuristic(Enum):
    HMAX = "hmax"
    FF = "ff"


class ActionMode(Enum):
    MODE_1 = "1"
    MODE_2 = "2"
    MODE_3 = "3"
    MODE_4 = "4"


@dataclasses.dataclass
class RunArgs:
    domain_filepath: Path
    problem_filepath: Path
    service_accepting_condition_filepath: Path
    action_mode: ActionMode
    heuristic: Heuristic
    planner_args: Sequence[str]
    timeout: Optional[float] = None

    def tolist(self):
        return [
            self.domain_filepath,
            self.problem_filepath,
            self.service_accepting_condition_filepath,
            self.action_mode,
            self.heuristic,
            self.planner_args,
            self.timeout
        ]

    def savejson(self, output: Path):
        obj = dict(
            heuristic=self.heuristic.value,
            action_mode=self.action_mode.value,
            planner_args=self.planner_args,
            timeout=self.timeout
        )
        with open(output, "w") as f:
            json.dump(obj, f)


@dataclasses.dataclass
class Result:
    stdout: str
    stderr: str
    total: float
    returncode: int
    timed_out: bool
    exception: Exception | None = None

    def summary(self):
        return f"{self.total=}\n{self.returncode=}\n{self.timed_out=}"


def composition_problem_to_pddl(services: Sequence[Service], goal_formula: str) -> tuple[str, str]:
    formula_str = f"{_START_SYMB} & X[!]({goal_formula})"
    formula = parse_ltl(formula_str)
    formula_pddl = rewrite(formula)

    domain, problem = services_to_pddl(services, formula_pddl)
    return domain, problem
