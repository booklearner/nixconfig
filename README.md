# nixconfig

Personal nix configurations. 

Feel free to reach out to me on Matrix (`@booklearner:matrix.org`) if you have any questions and need any help setting up your own system.

## Getting Started

Install [nix](https://nixos.org/download.html), and add `nix` command and `flakes` to configuration:

```
# ~/.config/nix/nix.conf
experimental-features = nix-command flakes
```

Install [nix-darwin](https://github.com/LnL7/nix-darwin)

```
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
```

## Directory Structure

- `configs`: Static configuration files, for example git, vim, ssh, etc. configuration files.
- `hosts`: Each machine maintained by this nix flake setup has its own file in here, for example one for my laptop and (eventually) one for my remote server(s).
- `lib`: Any nix helper code used throughout this setup.
- `modules`: Specific nix configuration files, can be imported and shared across hosts. For example, setting up developer tools we want on every machine.
