{ pkgs, inputs, ... }:

let
  home = inputs.home-manager.users.iamchanii;
in
{
  homebrew.casks = import ../casks.nix ++ [
    "slack"
    "google-chrome"
    "1password"
    "orbstack"
  ];
}
