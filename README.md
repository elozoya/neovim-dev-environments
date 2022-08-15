# neovim-dev-environments

Dev environments for multiple programming languages using Docker.
These dev environments are only for editing source code with neovim.

Containers have:

- nvim installed
- programming language tools for development
- some vim scripts available to be sourced

Containers does not have:

- any shell (bash/zsh/fish) configuration
- any nvim configuration

One recommended way to add any configuration to the container is using docker volumes.
The examples folder contains some scripts to achieve container configuration.

# Available environments

- Plain
- PHP (8.1, 8.0, 7.4)
- Go (1.19, 1.18.5)

# How to install

See [INSTALL.md](INSTALL.md).
See [INSTALL_EXAMPLES.md](INSTALL_EXAMPLES.md).

Notes
=====

I tested this project using:

- Ubuntu 20.04
- Docker version 20.10.17, build 100c701
- Using the GNOME Terminal with nerd fonts.

## License

This project is licensed under [MIT license](http://opensource.org/licenses/MIT).
