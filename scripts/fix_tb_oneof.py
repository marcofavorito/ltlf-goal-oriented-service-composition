#!/usr/bin/env python3
import argparse
import re
from pathlib import Path


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--domain-file', required=True, type=Path)
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    domain_file: Path = args.domain_file

    if not domain_file.exists() or not domain_file.is_file():
        raise ValueError(f'Domain file does not exist: {domain_file}')

    domain_pddl = domain_file.read_text()


    domain_pddl = re.sub("([A-Za-z_0-9]+)\(", r"(\1 ", domain_pddl)
    domain_pddl = re.sub(",", " ", domain_pddl)
    domain_pddl = re.sub("([A-Za-z_0-9\?]+)=\((.*?)\)", "(= $1 $2)", domain_pddl)

    domain_file.write_text(domain_pddl)
