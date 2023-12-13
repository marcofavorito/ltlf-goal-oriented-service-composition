#!/usr/bin/env python3
import argparse
import re
from collections import deque
from copy import copy
from pathlib import Path

import pydot



def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dot-file', required=True, type=Path)
    return parser.parse_args()


def remove_auxiliary_actions(graph: pydot.Dot):
    nodes_by_id = {}
    for node in graph.get_nodes():
        nodes_by_id[node.get_name()] = node

    # node-to-edges index
    edges_by_node_id = {}
    for edge in graph.get_edges():
        src_node_id = edge.get_source()
        dest_node_id = edge.get_destination()
        if src_node_id not in edges_by_node_id:
            edges_by_node_id[src_node_id] = {}
        edges_by_node_id[src_node_id].setdefault(edge, set()).add(dest_node_id)

    newgraph = pydot.Dot()
    initial_node_id = "0"
    queue = deque()
    queue.append(initial_node_id)
    visited = set()

    old_to_new_goal_states = {}

    while len(queue) > 0:
        current_node_id = queue.popleft()
        visited.add(current_node_id)

        current_edges = edges_by_node_id.get(current_node_id, {})
        newgraph.add_node(nodes_by_id[current_node_id])

        for current_edge in current_edges.keys():
            is_edge_a_sync_move = current_edge.get("label").startswith('\"o_') or current_edge.get("label").startswith('o_')
            _current_edge = current_edge
            _current_node_id = current_edge.get_destination()
            _next_edges = {current_edge}
            while is_edge_a_sync_move:
                # loop until we don't find a non-sync move
                _current_node_id = _current_edge.get_destination()
                _next_edges = set(edges_by_node_id.get(_current_node_id, {}).keys())
                if len(_next_edges) == 0:
                    # goal state
                    old_to_new_goal_states[_current_node_id] = current_node_id
                    break

                if len(_next_edges) > 1:
                    # surely or planning move
                    break
                # otherwise, continue the search
                _current_edge = list(_next_edges)[0]
                is_edge_a_sync_move = _current_edge.get("label").startswith('\"o_') or _current_edge.get("label").startswith('o_')

            for next_edge in _next_edges:
                next_dest_id = next_edge.get_destination()
                edge_dict = copy(next_edge.obj_dict)
                edge_dict['points'] = (current_node_id, next_dest_id)
                new_edge = pydot.Edge(nodes_by_id[current_node_id], nodes_by_id[next_dest_id], obj_dict=edge_dict)
                newgraph.add_edge(new_edge)
                queue.append(next_dest_id)

    init_subgraph = graph.get_subgraph("cluster_init")[0]
    init_subgraph.obj_dict["nodes"].pop('"\\n"')
    newgraph.add_subgraph(init_subgraph)

    for old_goal, new_goal in old_to_new_goal_states.items():
        subgraph = graph.get_subgraph(f"cluster_goal_{old_goal}")[0]
        subgraph.set_name(f"cluster_goal_{new_goal}")
        sg_old_node_dict = subgraph.obj_dict["nodes"][old_goal]
        sg_old_node_dict[0]['name'] = new_goal
        subgraph.obj_dict["nodes"][new_goal] = sg_old_node_dict
        subgraph.obj_dict["nodes"].pop(old_goal)
        subgraph.obj_dict["nodes"].pop('\"\\n\"')
        newgraph.add_subgraph(subgraph)
    return newgraph


if __name__ == '__main__':
    args = parse_args()
    dot_file: Path = args.dot_file

    if not dot_file.exists() or not dot_file.is_file():
        raise ValueError(f'dot file does not exist: {dot_file}')

    graph = pydot.graph_from_dot_file(str(dot_file))[0]

    # remove "not" predicates
    for node in graph.get_nodes():
        label = node.get("label")
        label = re.sub("\(not (.*?)\),? ", "", label)
        node.set("label", label)

    # remove auxiliary actions
    graph = remove_auxiliary_actions(graph)

    new_dot_file = dot_file.parent / "new_policy.dot"
    graph.write(new_dot_file)
