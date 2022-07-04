#!/usr/bin/env python3
from argparse import ArgumentParser, REMAINDER
from pathlib import Path

"""
`cdls` command
Produces a command for performing a `cd` and `ls` in sequence on the
given directory (with optional arguments to append to the `ls` command).
"""


def get_cdls(path: str, *args: str):
    real_path = Path(path)

    if real_path.is_dir():
        ls_args = " ".join((*args, "."))
        print(f"cd {real_path} && ls {ls_args}")
    else:
        raise SystemExit(f"Error: Unable to find path: \"{path}\"")


def get_cli_args():
    """Process the provided command-line arguments and return a valid
    Namespace for the CLI
    """

    parser = ArgumentParser(description="Performs a `cd` / `ls` sequence")

    parser.add_argument(
        "path",
        help="The relative or absolute path of the directory to navigate to"
    )

    parser.add_argument(
        "arguments",
        help="Arguments to pass directly to the subsequent `ls` command",
        nargs=REMAINDER
    )

    return parser.parse_args()


if __name__ == "__main__":
    ns = get_cli_args()
    get_cdls(ns.path, *ns.arguments)
