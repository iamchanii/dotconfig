{ pkgs, inputs, ... }:

let
  home = inputs.home-manager.users.iamchanii;
in
{
  homebrew.casks = import ../casks.nix ++ [];

  homebrew.taps = import ../taps.nix ++ ["tailcallhq/tailcall"];

  homebrew.brews = import ../brews.nix ++ ["tailcall"];
}
