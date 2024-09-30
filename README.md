# Dotconfig

My personal `.config`

## Requirements

1. [Homebrew](https://brew.sh/)
2. [Nix](https://nix.dev/manual/nix/2.24/installation/installing-binary)

## Getting Started

Clone this repository into `~/.config`.

```
$ git clone https://github.com/iamchanii/dotconfig ~/.config
```

Install nix-darwin. Follow the command below:

```
# Ref: https://github.com/LnL7/nix-darwin?tab=readme-ov-file#step-2-installing-nix-darwin
$ nix run nix-darwin -- switch --flake ~/.config/nix-darwin#iamchanii
```
