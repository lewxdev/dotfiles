```
     __     __  ____ __
 ___/ /__  / /_/ _(_) /__ ___
/ _  / _ \/ __/ _/ / / -_|_-<
\_,_/\___/\__/_//_/_/\__/___/
```

# @lewxdev/dotfiles

This repository consists of infrequently updated personal configurations,
dotfiles, and scripts for a macOS-based environment. It provides the following:

- a CLI as a [single-file executable](https://bun.sh/docs/bundler/executables)
  that walks through a configurable installation process
- a one-time installation script that adds the `dotfiles` CLI to the PATH

Although I cannot guarantee it will work for you, feel free to build on and
learn from this setup. If you have any questions or suggestions, please open an
issue.

## Usage

When installing for the first time, run the following command:

```shell
curl -fsSL https://raw.githubusercontent.com/lewxdev/dotfiles/main/install.zsh | zsh
```

After installation, you can run the `dotfiles` CLI to manage your dotfiles:

```shell
dotfiles --help
```

## Development

```shell
# install dependencies
bun install
```

```shell
# invoke the CLI
bun start
```

```shell
# build the executable
bun run build
```

```shell
# update CLI installation
# note: this may prompt you for your password
bun run update
```
