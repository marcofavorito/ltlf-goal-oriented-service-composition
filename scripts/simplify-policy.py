#!/usr/bin/env python3
import argparse
import re
from pathlib import Path

import pydot


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dot-file', required=True, type=Path)
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    dot_file: Path = args.dot_file

    if not dot_file.exists() or not dot_file.is_file():
        raise ValueError(f'dot file does not exist: {dot_file}')

    graph = pydot.graph_from_dot_file(str(dot_file))[0]

    for node in graph.get_nodes():
        label = node.get("label")
        newlabel = re.sub("\(not (.*?)\), ", "", label)
        node.set("label", newlabel)

    graph.write(dot_file)
