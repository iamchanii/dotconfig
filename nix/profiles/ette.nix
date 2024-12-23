{ pkgs, inputs, ... }:

let
  home = inputs.home-manager.users.ette;
in
{
  homebrew.casks = import ../casks.nix ++ [];
}
