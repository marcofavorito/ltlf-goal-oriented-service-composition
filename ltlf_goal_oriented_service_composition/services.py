"""This module contains the implementation of the service abstraction."""
from typing import AbstractSet
from copy import copy

from ltlf_goal_oriented_service_composition.types import State, Action, TransitionFunction, TransitionMapping

_SINK = "sink"


class Service:
    """A service."""

    def __init__(
        self,
        states: set[State],
        actions: set[Action],
        final_states: set[State],
        initial_state: State,
        transition_function: TransitionFunction,
    ):
        """Initialize the service.
        Both states and action must be of an hashable type.
        :param states: the set of states
        :param actions: the set of actions
        :param final_states: the final states
        :param initial_state: the initial state
        :param transition_function: the transition function
        """
        self._states = copy(states)
        self._actions = copy(actions)
        self._final_states = copy(final_states)
        self._initial_state = copy(initial_state)
        self._transition_function = transition_function
        self.__post_init__()
        # self._complete()

    @property
    def states(self) -> AbstractSet:
        return self._states

    @property
    def actions(self) -> AbstractSet:
        return self._actions

    @property
    def final_states(self) -> AbstractSet:
        return self._final_states

    @property
    def initial_state(self) -> State:
        return self._initial_state

    @property
    def transition_function(self) -> TransitionMapping:
        return self._transition_function

    def _complete(self):
        """Complete the transition function in such a way that it is a total function."""
        result = {}
        failure_state = "sink"
        assert failure_state not in self._states
        failure_state_used = False
        for state in self._states:
            result[state] = {}
            for action in self._actions:
                next_states = self._transition_function[state].get(action, set())
                if len(next_states) == 0:
                    next_states = {failure_state}
                    failure_state_used = True
                result[state][action] = next_states

        if failure_state_used:
            result[failure_state] = {action: {failure_state} for action in self._actions}
            self._states.add(failure_state)
        self._transition_function = result

    def __post_init__(self):
        """Do post-initialization checks."""
        self._check_number_of_states_at_least_one()
        self._check_number_of_actions_at_least_one()
        self._check_number_of_final_states_at_least_one()
        self._check_initial_state_in_states()
        self._check_all_final_states_in_states()
        self._check_transition_consistency()

    def _check_number_of_states_at_least_one(self):
        """Check that the number of states is at least one."""
        assert len(self._states) > 0, "must have at least one state"

    def _check_number_of_actions_at_least_one(self):
        assert len(self._actions) > 0, "must have at least one action"
        """Check that the number of actions is at least one."""

    def _check_number_of_final_states_at_least_one(self):
        """Check that the number of final states is at least one."""
        assert len(self._final_states) > 0, "must have at least one final state"

    def _check_initial_state_in_states(self):
        """Check that the initial state is in the set of states.."""
        assert (
            self._initial_state in self._states
        ), "initial state not in the set of states"

    def _check_all_final_states_in_states(self):
        """Check that all the final states are in the set of states."""
        final_states_not_in_states = {
            final_state for final_state in self._final_states if final_state not in self._states
        }
        assert (
            len(final_states_not_in_states) == 0
        ), f"the following final states are not in the set of states: {final_states_not_in_states}"

    def _check_transition_consistency(self):
        """Check consistency of transition function.
        In particular:
        - check that every state is contained in the set of states.
        - check that every action is contained in the set of actions.
        """
        for start_state, transitions_by_action in self._transition_function.items():
            assert (
                start_state in self._states
            ), f"state {start_state} is not in the set of states"
            assert start_state != _SINK, f"'{_SINK}' is a reserved state value"
            for action, next_states in transitions_by_action.items():
                assert (
                    action in self._actions
                ), f"action {action} is not in the set of actions"
                for next_state in next_states:
                    assert (
                        next_state in self._states
                    ), f"state {next_state} is not in the set of states"
