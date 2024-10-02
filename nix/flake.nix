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
      mkDarwinSystem = { user }:
        nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {inherit self; user = user;};
          modules = [
            ./darwin.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.verbose = true;
              home-manager.users.${user} = import ./home.nix;
            }
          ];
        };
    in
    {
      darwinConfigurations.iamchanii = mkDarwinSystem {
        user = "iamchanii";
      };

      darwinConfigurations.ette= mkDarwinSystem {
        user = "ette";
      };
    };
}
