import contextlib
import inspect
import os
import re
import shutil
import signal
import time
from collections import deque
from copy import copy
from pathlib import Path
from typing import Generator

import psutil
import pydot

CURPATH = Path(inspect.getfile(inspect.currentframe())).resolve()
ROOT_PATH = CURPATH.parent.parent


@contextlib.contextmanager
def cd(path: os.PathLike) -> Generator:
    """Change working directory temporarily."""
    old_path = Path.cwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(str(old_path))


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
            is_edge_a_sync_move = current_edge.get("label").startswith('\"o_') or current_edge.get("label").startswith(
                'o_')
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
                is_edge_a_sync_move = _current_edge.get("label").startswith('\"o_') or _current_edge.get(
                    "label").startswith('o_')

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


def simplify_dot_policy(input_dot_file: Path) -> pydot.Dot:
    graph = pydot.graph_from_dot_file(str(input_dot_file))[0]

    # remove "not" predicates
    for node in graph.get_nodes():
        label = node.get("label")
        label = re.sub("\(not (.*?)\),? ", "", label)
        node.set("label", label)

    # remove auxiliary actions
    graph = remove_auxiliary_actions(graph)
    return graph


def copy_if_src_exists(src: Path, dest: Path) -> None:
    if src.exists():
        shutil.copy(src, dest)


def find_child_pids(pid, pids=None):
    if pids is None:
        pids = []
    try:
        parent = psutil.Process(pid)
    except psutil.NoSuchProcess:
        return pids
    children = parent.children(recursive=True)
    for child in children:
        pids.append(child.pid)
        find_child_pids(child.pid, pids)
    return pids


def terminate_process_tree(pid, timeout=5):
    child_pids = find_child_pids(pid)
    for child_pid in reversed(child_pids):
        try:
            os.kill(child_pid, signal.SIGTERM)
        except ProcessLookupError:
            pass
    time.sleep(timeout)
    for child_pid in child_pids:
        try:
            os.kill(child_pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
