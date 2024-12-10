{ user }:
{ config, pkgs, lib, ... }:

{
  home.stateVersion = "24.11";

  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        switch = "darwin-rebuild switch --flake ~/.config/nix#${user}";
      };
      initExtra = (builtins.readFile ./dotfiles/zshrc);
      profileExtra = lib.optionalString (config.home.sessionPath != [ ]) ''
        export PATH="$PATH''${PATH:+:}${lib.concatStringsSep ":" config.home.sessionPath}"
      '';
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    home-manager = {
      enable = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    gh = {
      enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    ripgrep = {
      enable = true;
    };
  };

  home.packages =
    with pkgs; [ 
      nodejs_22
      pnpm
      yarn-berry
      cargo
      pinentry_mac
      lazygit
    ];

  home.sessionPath = [
    "/opt/homebrew/bin"
  ];

  home.file = {
    ".spr.yml" = { source = ./dotfiles/spr_yml; };
  };
}
