import dataclasses
import json
import pprint
import re
import sys
from enum import Enum
from pathlib import Path
from typing import Optional, Mapping, Any

import pandas as pd
# You need to add the following import at the beginning of your file
from pylatex import MultiColumn, NoEscape

from pylatex import Document, Tabular

from experiments.domains.chip_production import ALL_SYMBOLS as ALL_SYMBOLS_CHIP_PRODUCTION
from experiments.core import ActionMode, Heuristic
from experiments.domains.electric_motor import ALL_SYMBOLS as ALL_SYMBOLS_ELECTRIC_MOTOR

NA = "N/A"


@dataclasses.dataclass
class EncodingStats:
    alt_aut_translator_time: Optional[float]
    topddl_time: Optional[float]

    @property
    def total(self) -> float | None:
        if self.alt_aut_translator_time is not None and self.topddl_time is not None:
            return round(self.alt_aut_translator_time + self.topddl_time, 4)
        return None

    def pretty_print(self) -> str:
        return pprint.pformat(dataclasses.asdict(self))

    @classmethod
    def parse(cls, stdout: str) -> "EncodingStats":
        alt_aut_translator_time = None
        topddl_time = None

        lines = stdout.split("\n")
        for line in lines:
            if line.startswith("Translation CPU time:"):
                if m := re.search(r"Translation CPU time: +([0-9.]+), Number of Inferences: +([0-9]+)", line):
                    alt_aut_translator_time = float(m.group(1))
            elif line.startswith("ToPddl CPU time:"):
                if m := re.search("ToPddl CPU time: +([0-9.]+), Number of Inferences: +([0-9]+)", line):
                    topddl_time = float(m.group(1))

        return EncodingStats(alt_aut_translator_time, topddl_time)


@dataclasses.dataclass
class PlanningStats:
    translation_time: Optional[float]
    search_time: Optional[float]
    node_expansion: Optional[int]
    policy_size: Optional[int]

    @property
    def total(self) -> float | None:
        if self.translation_time is not None and self.search_time is not None:
            return round(self.translation_time + self.search_time, 4)
        return None

    def pretty_print(self) -> str:
        return pprint.pformat(dataclasses.asdict(self))

    @classmethod
    def parse(cls, stdout: str) -> "PlanningStats":
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

        return PlanningStats(translation_time, search_time, node_expansion, policy_size)


class ExpType(Enum):
    ELECTRIC_MOTOR_NONDET = "electric_motor_nondet"
    CHIP_PRODUCTION_DET = "chip_production_det"
    CHIP_PRODUCTION_NONDET = "chip_production_nondet"
    CHIP_PRODUCTION_NONDET_UNSOLVABLE = "chip_production_nondet_unsolvable"

    def names(self):
        match self:
            case self.ELECTRIC_MOTOR_NONDET:
                return [
                    f"electric_motor_nondet_{i}"
                    for i in range(0, len(ALL_SYMBOLS_ELECTRIC_MOTOR) + 1)
                ]
            case self.CHIP_PRODUCTION_DET:
                return [
                    f"chip_production_len_{i}"
                    for i in range(1, len(ALL_SYMBOLS_CHIP_PRODUCTION) + 1)
                ]
            case self.CHIP_PRODUCTION_NONDET:
                return [
                    f"chip_production_nondet_len_{i}"
                    for i in range(1, len(ALL_SYMBOLS_CHIP_PRODUCTION) + 1)
                ]
            case self.CHIP_PRODUCTION_NONDET_UNSOLVABLE:
                return [
                    f"chip_production_nondet_unsolvable_len_{i}"
                    for i in range(1, len(ALL_SYMBOLS_CHIP_PRODUCTION) + 1)
                ]

    def labels(self):
        match self:
            case self.ELECTRIC_MOTOR_NONDET:
                return [f"e{i}" for i in range(0, len(ALL_SYMBOLS_ELECTRIC_MOTOR) + 1)]
            case self.CHIP_PRODUCTION_DET:
                return [f"c{i}" for i in range(1, len(ALL_SYMBOLS_CHIP_PRODUCTION) + 1)]
            case self.CHIP_PRODUCTION_NONDET:
                return [f"cn{i}" for i in range(1, len(ALL_SYMBOLS_CHIP_PRODUCTION) + 1)]
            case self.CHIP_PRODUCTION_NONDET_UNSOLVABLE:
                return [f"cu{i}" for i in range(1, len(ALL_SYMBOLS_CHIP_PRODUCTION) + 1)]

    def title(self):
        match self:
            case self.ELECTRIC_MOTOR_NONDET:
                return "Electric motor scenario"
            case self.CHIP_PRODUCTION_DET:
                return "Chip Production scenario (deterministic)"
            case self.CHIP_PRODUCTION_NONDET:
                return "Chip Production scenario (nondeterministic)"
            case self.CHIP_PRODUCTION_NONDET_UNSOLVABLE:
                return "Chip Production scenario (unsolvable)"


class ResultDir:

    def __init__(self, dirpath: Path) -> None:
        self.domain_path: Path = dirpath / "domain.pddl"
        self.problem_path: Path = dirpath / "problem.pddl"
        self.domain_compiled_path: Path = dirpath / "domain_compiled.pddl"
        self.problem_compiled_path: Path = dirpath / "problem_compiled.pddl"
        self.sas_file: Path = dirpath / "output.sas"
        self.encoding_stderr_file: Path = dirpath / "encoding_stderr.txt"
        self.encoding_stdout_file: Path = dirpath / "encoding_stdout.txt"
        self.encoding_summary_file: Path = dirpath / "encoding_summary.txt"
        self.planning_stderr_file: Path = dirpath / "planning_stderr.txt"
        self.planning_stdout_file: Path = dirpath / "planning_stdout.txt"
        self.planning_summary_file: Path = dirpath / "planning_summary.txt"
        self.args_file: Path = dirpath / "args.json"

        self.encoding_stdout = self.encoding_stdout_file.read_text()
        self.encoding_stderr = self.encoding_stderr_file.read_text()
        self.encoding_summary_file = self.encoding_summary_file.read_text()
        self.planning_stdout = self.planning_stdout_file.read_text()
        self.planning_stderr = self.planning_stderr_file.read_text()
        self.planning_summary_file = self.planning_summary_file.read_text()
        self.args = json.loads(Path(self.args_file).read_text())

        self.timeout = self.args["timeout"]
        self.heuristic = Heuristic(self.args["heuristic"])
        self.action_mode = ActionMode(self.args["action_mode"])
        self.experiment_name = dirpath.name
        self.experiment_type = self._extract_experiment_type(dirpath, self.action_mode, self.heuristic)

        self.encoding_stats = EncodingStats.parse(self.encoding_stdout)
        self.planning_stats = PlanningStats.parse(self.planning_stdout)

    def _extract_experiment_type(self, dirpath: Path, action_mode: ActionMode, heuristic: Heuristic) -> str:
        conf_suffix = f"_{action_mode.value}_{heuristic.value}"
        return dirpath.name.replace(conf_suffix, "")


class AllResultDirs:

    def __init__(self, output_path: Path) -> None:
        self._output_path = output_path

        self.result_dirs_by_id = {}
        for dirpath in output_path.iterdir():
            if dirpath.is_dir():
                try:
                    result_dir = ResultDir(dirpath)
                    self.result_dirs_by_id[dirpath.name] = result_dir
                except:
                    print(f"Could not parse {dirpath}")
                    continue

    def stats_by_name(self) -> Mapping[str, tuple[EncodingStats, PlanningStats]]:
        result = {}
        for result_id, result_dir in self.result_dirs_by_id.items():
            result[result_id] = (result_dir.encoding_stats, result_dir.planning_stats)
        return result

    def by_experiment_type(self) -> Mapping[str, Mapping[str, ResultDir]]:
        result = {}
        for result_dir in self.result_dirs_by_id.values():
            result.setdefault(result_dir.experiment_type, {})[result_dir.experiment_name] = result_dir
        return result

    def get_dataframe(self, exptype: ExpType) -> pd.DataFrame:
        df = pd.DataFrame(columns=["label", "encoding", "heuristic", "TT", "PT", "NE", "PS"])

        expnames = exptype.names()
        explabels = exptype.labels()

        for idx, (expname, explabel) in enumerate(zip(expnames, explabels)):
            for action_mode in ActionMode:
                for heuristic in heuristic_list():
                    result_dirpath = self._output_path / f"{expname}_{action_mode.value}_{heuristic.value}"
                    row_prefix = [expname, action_mode.value, heuristic.value]
                    if result_dirpath.exists():
                        subdir = ResultDir(result_dirpath)
                        df.loc[len(df)] = row_prefix + stats_as_row(subdir.encoding_stats, subdir.planning_stats, 2000)
                    else:
                        df.loc[len(df)] = row_prefix + [float("nan")] * 4

        return df


def stats_as_row(encoding_stats: EncodingStats, planning_stats: PlanningStats, default: Any = "---"):
    total_enc_time = encoding_stats.total
    statsrow = [total_enc_time, planning_stats.total, planning_stats.node_expansion, planning_stats.policy_size]
    statsrow = [el if el is not None else default for el in statsrow]
    return statsrow


def empty_row():
    return ["---"] * 4


def make_font_size(text: str, font_command: str):
    return NoEscape(rf"\{font_command}{{{text}}}")


def make_small(text: str):
    return make_font_size(text, "small")


@dataclasses.dataclass
class PlanningConfig:
    action_mode: ActionMode
    heuristic: Heuristic

    def __str__(self):
        return f"{self.action_mode.value}_{self.heuristic.value}"

    @classmethod
    def action_mode_label(self, action_mode):
        if action_mode == ActionMode.MODE_1:
            return "Simple"
        elif action_mode == ActionMode.MODE_2:
            return "OSA"
        elif action_mode == ActionMode.MODE_3:
            return "PG"
        elif action_mode == ActionMode.MODE_4:
            return "OSA+PG"
        raise ValueError

    @classmethod
    def heuristic_label(self, h: Heuristic):
        if h == Heuristic.HMAX:
            return "$h_{\max}$"
        elif h == Heuristic.FF:
            return "$h_{\\mathsf{ff}}$"
        raise ValueError

    def to_label(self):
        am_label = self.action_mode_label(self.action_mode)
        h_label = self.heuristic_label(self.heuristic)
        return f"{am_label}+{h_label}"


def heuristic_list():
    # return [Heuristic.HMAX]
    return list(Heuristic)


class TableGenerator:

    metrics_headers = ('TT', 'PT', 'EN', 'PS')
    expcombs = [
        PlanningConfig(am, h)
        for h in heuristic_list() for am in ActionMode
    ]
    nb_metrics = len(metrics_headers)
    nb_heuristics = len(heuristic_list())
    nb_configurations = len(expcombs)
    nb_columns = nb_metrics * len(ActionMode) + 1

    # 1 benchmark + 4 metrics times 4 planning configurations
    # table = Tabular('|c' * nb_metrics * nb_configurations + "|")
    table_config = '||c||' + ("|".join(['c'] * nb_metrics) + "||") * (nb_configurations // nb_heuristics)

    def __init__(self, all_results: AllResultDirs):
        self.all_results = all_results
        self.results_by_type = self.all_results.by_experiment_type()

    def _get_document(self) -> Document:
        geometry_options = {
            "margin": "0in",
            "includeheadfoot": True
        }
        doc = Document(documentclass="article", document_options=["landscape"], geometry_options=geometry_options)
        return doc

    def generate_electric_motor(self) -> tuple[Tabular, Document]:
        doc = self._get_document()
        with doc.create(Tabular(self.table_config)) as table:
            self._populate_table(ExpType.ELECTRIC_MOTOR_NONDET, table)
        return table, doc

    def generate_chip_production(self) -> tuple[Tabular, Document]:
        doc = self._get_document()
        with doc.create(Tabular(self.table_config)) as table:
            self._populate_table(ExpType.CHIP_PRODUCTION_DET, table)
        return table, doc

    def generate_chip_production_nondet(self) -> tuple[Tabular, Document]:
        doc = self._get_document()
        with doc.create(Tabular(self.table_config)) as table:
            self._populate_table(ExpType.CHIP_PRODUCTION_NONDET, table)
        return table, doc

    def generate_chip_production_nondet_unsolvable(self) -> tuple[Tabular, Document]:
        doc = self._get_document()
        with doc.create(Tabular(self.table_config)) as table:
            self._populate_table(ExpType.CHIP_PRODUCTION_NONDET_UNSOLVABLE, table)
        return table, doc

    def _add_subheaders(self, table: Tabular):
        rows = []
        for am in ActionMode:
            row = MultiColumn(self.nb_metrics, align='|c|', data=make_small(PlanningConfig.action_mode_label(am)))
            rows.append(row)
        table.add_row(tuple([""] + rows))
        table.add_hline()

        # add metrics
        table.add_row([""] + list(map(make_small, self.metrics_headers)) * len(ActionMode))
        table.add_hline()

    def _handle_garden(self, table: Tabular):
        exptype = "garden"
        exptype_results = self.results_by_type[exptype]

        table.add_row([MultiColumn(self.nb_columns, align='c', data=NoEscape(r"\textbf{Garden Bots System}"))])
        table.add_hline()

        self._add_subheaders(table)

        for heuristic in self._iter_over_h(table):
            stats_row = []
            for comb in self.expcombs:
                if comb.heuristic != heuristic:
                    continue
                expname = f"{exptype}_{comb}"
                resultdir = exptype_results[expname]
                stats_row.extend(stats_as_row(resultdir.encoding_stats, resultdir.planning_stats))

            self._make_min_bold(stats_row)
            table.add_row(["i0"] + list(map(make_small, stats_row)))
            table.add_hline()

    def _populate_table(self, exptype: ExpType, table: Tabular):
        exptypes = exptype.names()
        labels = exptype.labels()
        title = exptype.title()
        table.add_row([MultiColumn(self.nb_columns, align='c',data=NoEscape(rf"\textbf{{{title}}}"))])
        table.add_hline()
        self._add_subheaders(table)

        assert len(exptypes) == len(labels)
        for heuristic in self._iter_over_h(table):
            for idx, exptype in enumerate(exptypes):
                stats_row = []
                if exptype not in self.results_by_type:
                    break
                results = self.results_by_type[exptype]
                for comb in self.expcombs:
                    if comb.heuristic != heuristic:
                        continue
                    expname = f"{exptype}_{comb}"
                    if expname in results:
                        resultdir = results[expname]
                        stats_row.extend(stats_as_row(resultdir.encoding_stats, resultdir.planning_stats))
                    else:
                        stats_row.extend(empty_row())

                self._make_min_bold(stats_row)

                if "unsolvable" in exptypes[0]:
                    for element_id in range(2, self.nb_columns - 1, self.nb_metrics):
                        stats_row[element_id] = NA
                        stats_row[element_id + 1] = NA

                table.add_row([labels[idx]] + list(map(make_small, stats_row)))
                table.add_hline()

    def _iter_over_h(self, table: Tabular):
        hs = heuristic_list()
        if len(hs) == 1:
            # do nothing
            yield hs[0]
        else:
            for h in hs:
                table.add_row([MultiColumn(self.nb_columns, align='||c||',
                                           data=NoEscape(PlanningConfig.heuristic_label(h)))])
                table.add_hline()
                yield h

    def _make_min_bold(self, stats_row):
        for metric_id in range(0, self.nb_metrics):
            filtered_indexed_entries = list(enumerate(stats_row))[metric_id::self.nb_metrics]
            minidx, minel = min(filtered_indexed_entries,
                                key=lambda x: x[1] if isinstance(x[1], (float, int)) else float('inf'))
            if minel != float('inf'):
                stats_row[minidx] = f"\\textbf{{{minel}}}"
