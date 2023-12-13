#!/usr/bin/env python3
import argparse
from pathlib import Path

from experiments.utils import simplify_dot_policy


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dot-file', required=True, type=Path)
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    dot_file: Path = args.dot_file

    if not dot_file.exists() or not dot_file.is_file():
        raise ValueError(f'dot file does not exist: {dot_file}')

    simplify_dot_policy(dot_file)
