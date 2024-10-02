{ user }:
{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # home.file.".zshrc".source = ./dotfiles/zshrc;

  programs.zsh = {
    enable = true;
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/.config/nix#${user}";
      vim = "nvim";
    };
  };

  programs.home-manager.enable = true;

  home.packages =
    [ 
      pkgs.vim
      pkgs.neovim
      pkgs.nodejs_22
      pkgs.pnpm
      pkgs.cargo
    ];
}
