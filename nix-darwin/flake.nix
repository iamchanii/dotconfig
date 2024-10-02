{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
    let
      user = "iamchanii";
    in
    {
      darwinConfigurations.${user} = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
        ];
      };

      darwinPackages = self.darwinConfigurations.${user}.pkgs;
    };
}
