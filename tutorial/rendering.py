"""This module contains rendering functionalities."""
from collections.abc import Callable

import graphviz
from graphviz import Digraph

from ltlf_goal_oriented_service_composition.dfa_utils import guard_to_symbol, _find_failure_state, DeclareAutomaton
from ltlf_goal_oriented_service_composition.services import Service
from ltlf_goal_oriented_service_composition.types import Action, State


def service_to_graphviz(
    service: Service,
    state2str: Callable[[State], str] = str,
    action2str: Callable[[Action], str] = str,
) -> Digraph:
    """Transform a service into a graphviz.Digraph object.
    :param service: the service object
    :param state2str: a callable that transforms states into strings
    :param action2str: a callable that transforms actions into strings
    :return: the graphviz.Digraph object
    """
    graph = Digraph(format="svg")
    graph.node("fake", style="invisible")
    graph.attr(rankdir="LR")

    for state in service.states:
        shape = "doublecircle" if state in service.final_states else "circle"
        if state == service.initial_state:
            graph.node(state2str(state), root="true", shape=shape)
        else:
            graph.node(state2str(state), shape=shape)
    graph.edge("fake", state2str(service.initial_state), style="bold")

    for start, outgoing in service.transition_function.items():
        for action, next_states in outgoing.items():
            for next_state in next_states:
                label = f"{action2str(action)}"
                graph.edge(
                    state2str(start),
                    state2str(next_state),
                    label=label,
                )

    return graph


def declare_dfa_to_graphviz(dfa: DeclareAutomaton):
    failure_state = _find_failure_state(dfa)
    graph = graphviz.Digraph(format="svg")
    graph.node("fake", style="invisible")
    for state in dfa.states:
        if state == dfa.initial_state:
            if state in dfa.accepting_states:
                graph.node(str(state), root="true", shape="doublecircle")
            else:
                graph.node(str(state), root="true")
        elif state in dfa.accepting_states:
            graph.node(str(state), shape="doublecircle")
        else:
            graph.node(str(state))

    graph.edge("fake", str(dfa.initial_state), style="bold")

    for (start, guard, end) in dfa.get_transitions():
        if end == failure_state:
            continue
        newguards = guard_to_symbol(guard)
        assert newguards is not None
        if len(newguards) == 0:
            for action in dfa.alphabet:
                graph.edge(str(start), str(end), label=str(action))
        else:
            for newguard in newguards:
                graph.edge(str(start), str(end), label=str(newguard))

    return graph
