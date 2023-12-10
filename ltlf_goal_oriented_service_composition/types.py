"""This module contains the main type definitions."""
from collections.abc import Hashable
from typing import Any, Mapping, AbstractSet

State = Hashable
Action = Any
TransitionFunction = dict[State, dict[Action, set[State]]]
TransitionMapping = Mapping[State, Mapping[Action, AbstractSet[State]]]
