```
     __     __  ____ __
 ___/ /__  / /_/ _(_) /__ ___
/ _  / _ \/ __/ _/ / / -_|_-<
\_,_/\___/\__/_//_/_/\__/___/
```

# @lewxdev/dotfiles

This repository consists of infrequently updated personal configurations,
dotfiles, and scripts for a macOS-based environment. It provides a lightweight
cli as an executable shell script that walks through a configurable installation
process.

Although I cannot guarantee it will work for you, feel free to build on and
learn from this setup. If you have any questions or suggestions, please open an
issue.

## Usage

When installing, run the following command:

```shell
curl -fsSL https://raw.github.com/lewxdev/dotfiles/main/install.zsh | zsh
```

You can optionally provide environment variables to the installation script to
further customize the process:

- `NO_INSTALL=1` - skips installing dependencies.
- `NO_LINK=1` - skips linking configuration files.

---

&copy; 2024-Present, released under the [MIT License](LICENSE.md) and is
maintained by [@lewxdev](https://github.com/lewxdev).