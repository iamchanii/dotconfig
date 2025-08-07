{ pkgs, inputs, ... }:

let
  home = inputs.home-manager.users.iamchanii;
in
{
  system.primaryUser = "ette";

  homebrew.casks = import ../../casks.nix ++ [];

  homebrew.taps = import ../../taps.nix ++ [];

  homebrew.brews = import ../../brews.nix ++ ["withgraphite/tap/graphite"];
}
