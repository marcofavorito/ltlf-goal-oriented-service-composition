import argparse
import shutil
from pathlib import Path

import numpy as np
from matplotlib import pyplot as plt, patches
import matplotlib.lines as mlines

from experiments.core import ActionMode, Heuristic
from experiments.plotting.utils import ExpType, AllResultDirs, PlanningConfig
import matplotlib as mpl


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--input-dir", type=str, required=True)
    parser.add_argument("--output-dir", type=str, default="output-plots")
    return parser.parse_args()


def action_mode_to_color(mode: ActionMode):
    match mode:
        case ActionMode.MODE_1:
            return 'red'
        case ActionMode.MODE_2:
            return 'blue'
        case ActionMode.MODE_3:
            return 'green'
        case ActionMode.MODE_4:
            return 'orange'


def action_mode_to_marker(mode: ActionMode):
    match mode:
        case ActionMode.MODE_1:
            return 'o'
        case ActionMode.MODE_2:
            return 'X'
        case ActionMode.MODE_3:
            return '*'
        case ActionMode.MODE_4:
            return 'P'


def main():
    arguments = parse_args()
    input_dir: Path = Path(arguments.input_dir)
    if not input_dir.exists():
        raise ValueError("Input directory does not exist")

    output_dir: Path = Path(arguments.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Enable LaTeX integration
    mpl.rcParams['text.usetex'] = True
    mpl.rcParams['font.family'] = 'serif'
    mpl.rcParams['font.serif'] = 'Times New Roman'

    # Optional: Set specific parameters for figure size, font size, etc.
    mpl.rcParams['figure.figsize'] = (6, 5)
    mpl.rcParams['font.size'] = 10

    all_results = AllResultDirs(input_dir)
    for exptype in ExpType:
        df = all_results.get_dataframe(exptype)

        # Create a new figure
        fig, ax = plt.subplots()

        # Heuristic legend
        legend_hmax = mlines.Line2D([], [], color='black', linestyle="solid", label=PlanningConfig.heuristic_label(Heuristic.HMAX))
        legend_ff = mlines.Line2D([], [],color='black', linestyle="dotted", label=PlanningConfig.heuristic_label(Heuristic.FF))
        heuristic_legend = ax.legend(handles=[legend_hmax, legend_ff], loc='upper left', title='Heuristic')
        ax.add_artist(heuristic_legend)

        # Encoding legend
        legend_simple = mlines.Line2D([], [], color=action_mode_to_color(ActionMode.MODE_1), marker=action_mode_to_marker(ActionMode.MODE_1), markeredgecolor="black", markeredgewidth=0.25, linestyle="solid", label='Simple')
        legend_osa = mlines.Line2D([], [], color=action_mode_to_color(ActionMode.MODE_2), marker=action_mode_to_marker(ActionMode.MODE_2), markeredgecolor="black", markeredgewidth=0.25, linestyle="solid", label='OSA')
        legend_pg = mlines.Line2D([], [], color=action_mode_to_color(ActionMode.MODE_3), marker=action_mode_to_marker(ActionMode.MODE_3), markeredgecolor="black", markeredgewidth=0.25, linestyle="solid", label='PG')
        legend_osapluspg = mlines.Line2D([], [], color=action_mode_to_color(ActionMode.MODE_4), marker=action_mode_to_marker(ActionMode.MODE_4), markeredgecolor="black", markeredgewidth=0.25, linestyle="solid", label='OSA+PG')
        encoding_legend = ax.legend(handles=[legend_simple, legend_osa, legend_pg, legend_osapluspg], loc='upper left', title='Encoding', bbox_to_anchor=(0, 0.825))
        ax.add_artist(encoding_legend)

        for action_mode in ActionMode:
            color = action_mode_to_color(action_mode)
            marker = action_mode_to_marker(action_mode)
            df_enc = df[df.encoding == action_mode.value]
            df_enc_no_nan = df_enc.fillna(value=1500.0)
            y_hmax = df_enc_no_nan[df_enc_no_nan.heuristic == "hmax"]
            y_ff = df_enc_no_nan[df_enc_no_nan.heuristic == "ff"]
            x_axis = np.arange(0, y_hmax.shape[0])
            plt.plot(x_axis, y_hmax["PT"], label=PlanningConfig.heuristic_label(Heuristic.HMAX), linestyle="solid", marker=marker, markeredgecolor="black", markeredgewidth=0.25, color=color)
            plt.plot(x_axis, y_ff["PT"], label=PlanningConfig.heuristic_label(Heuristic.FF), linestyle="dotted", marker=marker, markeredgecolor="black", markeredgewidth=0.25, color=color)
            plt.xlabel("\#breakable services" if exptype == exptype.ELECTRIC_MOTOR_NONDET else "length of formula")
            plt.ylabel("Planning Time (PT)")

        plt.ylim(0, 1000.0)
        plt.xticks(ticks=x_axis.tolist(), labels=exptype.labels(), rotation=15)
        plt.title(exptype.title())

        plt.savefig(output_dir / f"{exptype.value}.pdf")


if __name__ == '__main__':
    main()