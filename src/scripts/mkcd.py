#!/usr/bin/env python3
from argparse import ArgumentParser, REMAINDER

"""
`mkcd` command
Produces a command for performing a `mkdir` and `cd` in sequence on the
given directory. (with optional arguments to append to the `mkdir` command)
"""


def get_mkcd(dirname: str, *args: str):
    mkdir_args = " ".join((*args, dirname))
    print(f"mkdir {mkdir_args} && cd {dirname}")


def get_cli_args():
    """Process the provided command-line arguments and return a valid
    Namespace for the CLI
    """

    parser = ArgumentParser(description="Performs a `mkdir` / `cd` sequence")

    parser.add_argument(
        "dirname",
        help="The name of the directory to create/move to"
    )

    parser.add_argument(
        "arguments",
        help="Arguments to pass directly to the subsequent `ls` command",
        nargs=REMAINDER
    )

    return parser.parse_args()


if __name__ == "__main__":
    ns = get_cli_args()
    get_mkcd(ns.dirname, *ns.arguments)
