# Development Environment Configurations #
**@[lewxdev](https://github.com/lewxdev)'s dotfiles**

Contains an infrequently updated repository of configuration dotfiles for programs and environments on a macOS based system. An initializing shell script installs all necessary dependencies on a new or recently refreshed system.

The following implementation is comprised solely of personal preferences.

## Installation / Usage ##

The following command will clone the dotfiles repository to the home directory and run the installation script:

```shell
cd && git clone https://github.com/lewxdev/dotfiles.git && cd dotfiles && ./install.zsh
```

Provided no arguments, the installation script will run through the setup process in its entirety. However, for testing or tweaking after the initial installation process, arguments can be provided for specifying which procedure are run.

## Procedures ##
### Homebrew installation `--brew` ###
Installs [Homebrew](https://brew.sh/) (if necessary) or performs a `brew update`
### Homebrew formulae installation `--brew-formulae` ###
Installs formulae from [a provided list](install.zsh#L11)
### Homebrew casks installation `--brew-casks` ###
Installs casks from [a provided list](install.zsh#L16)
### Homebrew cask drivers installation `--brew-casks` ###
Installs cask drivers from [a provided list](install.zsh#L29)
### Visual Studio Code extensions installation `--vscode-extensions` ###
Installs VS Code extensions from [a provided list](install.zsh#L34)
### Oh My Zsh installation `--omz` ###
Installs [Oh My Zsh](https://ohmyz.sh/) (if necessary) or upgrades its repo
### Oh My Zsh plugins installation `--omz-plugins` ###
Installs select plugins for omz. Currently only [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
### Create symbolic links `--symlinks` ###
Creates a symlink for all valid files in the repo (with special designator in its head)

## Smart Symlinks ##

Any valid file in the repository[^1] can generate a symlink as long as a valid designator is found. Essentially a comment in the head of the file which points to where to create the symbolic link. Consider the following example for a JavaScript file "application_config.js":

```js
// DEST:~/config/.application_config.js
```

[^1]: Files and folders with preceding "."—hidden/dotfiles, or any file in the "src" directory are ignored
