import dataclasses
import json
import pprint
import re
from pathlib import Path
from typing import Optional, Mapping, Set

# You need to add the following import at the beginning of your file
from pylatex import MultiColumn, Command, NoEscape

from pylatex import Document, Section, Tabular

from experiments.core import ActionMode, Heuristic

NA = "N/A"


@dataclasses.dataclass
class Stats:
    translation_time: Optional[float]
    search_time: Optional[float]
    node_expansion: Optional[int]
    policy_size: Optional[int]

    def pretty_print(self) -> str:
        return pprint.pformat(dataclasses.asdict(self))


def _parse_stdout(stdout: str) -> Stats:
    translation_time = None
    search_time = None
    node_expansion = None
    policy_size = None

    lines = stdout.split("\n")
    for line in lines:
        if line.startswith("Done! ["):
            if m := re.search(r"Done! \[([0-9.]+)s CPU, ([0-9.]+)s wall-clock]", line):
                translation_time = float(m.group(2))
        elif line.startswith("Time needed: "):
            if m := re.search("Time needed: +([0-9.]+) seconds\.", line):
                search_time = float(m.group(1))
        elif line.startswith("Number of node expansions: "):
            if m := re.search("Number of node expansions: +([0-9]+)", line):
                node_expansion = int(m.group(1))
        elif line.startswith("Policy entries:"):
            if m := re.search("Policy entries: +([0-9]+)", line):
                policy_size = int(m.group(1))

    return Stats(translation_time, search_time, node_expansion, policy_size)


class ResultDir:

    def __init__(self, dirpath: Path) -> None:
        self.domain_path: Path = dirpath / "domain.pddl"
        self.problem_path: Path = dirpath / "problem.pddl"
        self.domain_compiled_path: Path = dirpath / "domain_compiled.pddl"
        self.problem_compiled_path: Path = dirpath / "problem_compiled.pddl"
        self.sas_file: Path = dirpath / "output.sas"
        self.stderr_file: Path = dirpath / "stderr.txt"
        self.stdout_file: Path = dirpath / "stdout.txt"
        self.summary_file: Path = dirpath / "summary.txt"
        self.args_file: Path = dirpath / "args.json"

        self.stdout = self.stdout_file.read_text()
        self.stderr = self.stderr_file.read_text()
        self.summary_file = self.summary_file.read_text()
        self.args = json.loads(Path(self.args_file).read_text())

        self.timeout = self.args["timeout"]
        self.heuristic = Heuristic(self.args["heuristic"])
        self.action_mode = ActionMode(self.args["action_mode"])
        self.experiment_name = dirpath.name
        self.experiment_type = self._extract_experiment_type(dirpath, self.action_mode, self.heuristic)

        self.stats = _parse_stdout(self.stdout)

    def _extract_experiment_type(self, dirpath: Path, action_mode: ActionMode, heuristic: Heuristic) -> str:
        return dirpath.name.replace(action_mode.value, "").replace(heuristic.value, "").replace("__", "")


class AllResultDirs:

    def __init__(self, output_path: Path) -> None:
        self._output_path = output_path

        self.result_dirs_by_id = {}
        for dirpath in output_path.iterdir():
            if dirpath.is_dir():
                result_dir = ResultDir(dirpath)
                self.result_dirs_by_id[dirpath.name] = result_dir

    def stats_by_name(self) -> Mapping[str, Stats]:
        result = {}
        for result_id, result_dir in self.result_dirs_by_id.items():
            result[result_id] = result_dir.stats
        return result

    def by_experiment_type(self) -> Mapping[str, Mapping[str, ResultDir]]:
        result = {}
        for result_dir in self.result_dirs_by_id.values():
            result.setdefault(result_dir.experiment_type, {})[result_dir.experiment_name] = result_dir
        return result


def stats_as_row(stats: Stats):
    statsrow = [stats.translation_time, stats.search_time, stats.node_expansion, stats.policy_size]
    statsrow = [el if el is not None else "---" for el in statsrow]
    return statsrow


def empty_row():
    return ["---"] * 4


def make_font_size(text: str, font_command: str):
    return NoEscape(rf"\{font_command}{{{text}}}")


def make_small(text: str):
    return make_font_size(text, "small")



class TableGenerator:

    def __init__(self, all_results: AllResultDirs):
        self.all_results = all_results
        self.results_by_type = self.all_results.by_experiment_type()

        self.metrics_headers = ('TT', 'PT', 'EN', 'PS')
        self.non_pg_non_osa_hmax = "1_hmax"
        self.non_pg_non_osa_ff = "1_hmax"
        self.non_pg_osa_ff = "2_ff"
        self.non_pg_osa_hmax = "2_hmax"
        self.expcombs = [
            self.non_pg_non_osa_hmax,
            self.non_pg_non_osa_ff,
            self.non_pg_osa_ff,
            self.non_pg_osa_hmax,
        ]
        self.nb_metrics = len(self.metrics_headers)
        self.nb_configurations = len(self.expcombs)
        self.nb_columns = self.nb_metrics * self.nb_configurations + 1

        # 1 benchmark + 4 metrics times 4 planning configurations
        # table = Tabular('|c' * nb_metrics * nb_configurations + "|")
        self.table_config = '|c' * self.nb_columns + "|"

    def generate(self) -> Tabular:
        geometry_options = {
            "margin": "1in",
            "includeheadfoot": True
        }
        doc = Document(geometry_options=geometry_options)

        with doc.create(Tabular(self.table_config)) as table:
            self._handle_garden(table)
            self._handle_electric_motor(table)
            self._handle_chip_production(table)

        doc.generate_pdf('multi_level_header_table', clean_tex=False)
        return table

    def _add_subheaders(self, table: Tabular):
        rows = []
        for comb in self.expcombs:
            row = MultiColumn(self.nb_configurations, align='|c|', data=make_small(f"{comb.replace('_','')}"))
            rows.append(row)
        table.add_row(tuple([""] + rows))
        table.add_hline()

        # add metrics
        table.add_row([""] + list(map(make_small, self.metrics_headers)) * self.nb_configurations)
        table.add_hline()

    def _handle_garden(self, table: Tabular):
        exptype = "garden"
        exptype_results = self.results_by_type[exptype]

        table.add_row([MultiColumn(self.nb_columns, align='c', data=NoEscape(r"\textbf{Garden Bots System}"))])
        table.add_hline()

        self._add_subheaders(table)

        stats_row = []
        for comb in self.expcombs:
            expname = f"{exptype}_{comb}"
            resultdir = exptype_results[expname]
            stats_row.extend(stats_as_row(resultdir.stats))
        table.add_row(["i0"] + list(map(make_small, stats_row)))
        table.add_hline()

    def _handle_electric_motor(self, table: Tabular):
        exptypes = [
            "electric_motor",
            "electric_motor_nondet_unsolvable",
            "electric_motor_nondet",
        ]

        table.add_row([MultiColumn(self.nb_columns, align='c', data=NoEscape(r"\textbf{Electric Motor scenario}"))])
        table.add_hline()

        explabels = ["e0", "eu", "en"]
        for label, exptype in zip(explabels, exptypes):
            results = self.results_by_type[exptype]
            stats_row = []
            for comb in self.expcombs:
                expname = f"{exptype}_{comb}"
                resultdir = results[expname]
                stats_row.extend(stats_as_row(resultdir.stats))

            if "unsolvable" in exptype:
                for idx in range(2, self.nb_columns-1, self.nb_metrics):
                    stats_row[idx] = NA
                    stats_row[idx+1] = NA

            table.add_row([label] + list(map(make_small, stats_row)))
            table.add_hline()

    def _handle_chip_production(self, table: Tabular):
        exptypes = [
            f"chip_production_len_{i}"
            for i in range(1, 10)
        ]

        table.add_row([MultiColumn(self.nb_columns, align='c', data=NoEscape(r"\textbf{Chip Production scenario}"))])
        table.add_hline()

        for idx, exptype in enumerate(exptypes):
            if exptype not in self.results_by_type:
                break
            results = self.results_by_type[exptype]
            stats_row = []
            for comb in self.expcombs:
                expname = f"{exptype}_{comb}"
                if expname in results:
                    resultdir = results[expname]
                    stats_row.extend(stats_as_row(resultdir.stats))
                else:
                    stats_row.extend(empty_row())

            table.add_row([f"c{idx + 1}"] + list(map(make_small, stats_row)))
            table.add_hline()
