"""Represent a target service."""
from pylogics.syntax.base import Formula
from pythomata.core import DFA, StateType, SymbolType, TransitionType, Rendering
from sympy import Symbol
from sympy.logic.boolalg import And, BooleanFunction, BooleanTrue, Or, Not
from typing import AbstractSet, Optional


def fail_transition(formula: Formula):
    return (isinstance(formula, And) and
            (all(isinstance(arg, Not) for arg in formula.args) or sum(isinstance(arg, Symbol) for arg in formula.args) > 1))


def guard_to_symbol(prop_formula: BooleanFunction) -> set[str]:
    """From guard to symbol."""
    if isinstance(prop_formula, Symbol):
        return {str(prop_formula)}
    elif isinstance(prop_formula, And):
        symbol_args = [arg for arg in prop_formula.args if isinstance(arg, Symbol)]
        assert len(symbol_args) == 1
        return {str(symbol_args[0])}
    elif isinstance(prop_formula, Or):
        operands_as_symbols = [
            symb for arg in prop_formula.args for symb in guard_to_symbol(arg)
        ]
        operands_as_symbols = list(filter(lambda x: x is not None, operands_as_symbols))
        assert len(operands_as_symbols) > 0
        return set(operands_as_symbols)
    elif isinstance(prop_formula, BooleanTrue):
        return set()
    # None case
    return None


def _find_failure_state(dfa: DFA):
    """Find failure state, if any."""
    for state in dfa.states:
        if state in dfa.accepting_states:
            continue
        transitions = dfa.get_transitions_from(state)
        if len(transitions) == 1:
            t = list(transitions)[0]
            start, guard, end = t
            if start == end and isinstance(guard, BooleanTrue):
                # non-accepting, self-loop with true
                return start
        else:
            # check all transitions lead to the same state
            if all(next_state == state for _, _, next_state in transitions):
                return state
    return None


class DeclareAutomaton(DFA, Rendering):

    def __init__(self, wrapped: DFA, alphabet: set[str]) -> None:
        super().__init__()
        self._wrapped = wrapped

        self._alphabet = alphabet

        self._failure_state = _find_failure_state(self._wrapped)
        self._transition_function = self._build_transition_function()

    @property
    def alphabet(self) -> AbstractSet[str]:
        return self._alphabet

    @property
    def states(self):
        return self._wrapped.states

    @property
    def initial_state(self):
        return self._wrapped.initial_state

    @property
    def accepting_states(self):
        return self._wrapped.accepting_states

    def get_successor(
            self, state: StateType, symbol: SymbolType
    ) -> Optional[StateType]:
        """
        Get the (unique) successor.

        If not defined, return None.
        """
        return self._transition_function[state][symbol]

    def get_transitions_from(self, state: StateType) -> AbstractSet[TransitionType]:
        result = set()
        for action, next_state in self._transition_function[state].items():
            result.add((state, action, next_state))
        return result

    def _build_transition_function(self):
        result = {}
        state_that_can_go_to_failure = set()
        for state in self._wrapped.states:
            result[state] = {}
            for _, guard, next_state in self._wrapped.get_transitions_from(state):
                if next_state == self._failure_state:
                    state_that_can_go_to_failure.add(state)
                    continue
                else:
                    newguards = guard_to_symbol(guard)
                    assert newguards is not None, guard
                    if len(newguards) == 0:
                        for action in self._alphabet:
                            result[state][action] = next_state
                    else:
                        for newguard in newguards:
                            result[state][newguard] = next_state
        # add failing transitions
        for state in state_that_can_go_to_failure:
            successful_actions = set(result[state])
            failing_actions = self._alphabet - successful_actions
            for failing_action in failing_actions:
                result[state][failing_action] = self._failure_state
        return result
