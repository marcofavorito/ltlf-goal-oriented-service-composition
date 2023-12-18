import argparse
import shutil
from pathlib import Path

from experiments.plotting.utils import TableGenerator, AllResultDirs


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--input-dir", type=str, required=True)
    parser.add_argument("--output-dir", type=str, default="output-plots")
    return parser.parse_args()


def main():
    arguments = parse_args()
    input_dir: Path = Path(arguments.input_dir)
    if not input_dir.exists():
        raise ValueError("Input directory does not exist")

    output_dir: Path = Path(arguments.output_dir)
    shutil.rmtree(output_dir, ignore_errors=True)
    output_dir.mkdir(parents=True, exist_ok=False)

    all_results = AllResultDirs(input_dir)
    for name, (encoding_stats, planning_stats) in all_results.stats_by_name().items():
        print(name, encoding_stats.pretty_print(), planning_stats.pretty_print())
    print([result.experiment_name for result in all_results.result_dirs_by_id.values()])

    table, doc = TableGenerator(all_results).generate()
    (output_dir / "table.tex").write_text(table.dumps())
    doc.generate_pdf('multi_level_header_table', clean_tex=False)


if __name__ == '__main__':
    main()
