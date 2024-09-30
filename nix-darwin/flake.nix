{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.vim
	        pkgs.neovim
          pkgs.nodejs_22
          pkgs.pnpm
          pkgs.cargo
        ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      programs.zsh.interactiveShellInit = ''
        alias vim=nvim
      '';

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.defaults.NSGlobalDomain.KeyRepeat = 2; # 키 반복 속도: 빠르게
      system.defaults.NSGlobalDomain.InitialKeyRepeat = 15; # 반복 지연 시간: 짧게

      # Homebrew
      homebrew.enable = true;

      homebrew.brews = [
        "starship"
        "gh"
      ];

      homebrew.casks = [
        "wezterm"
        "arc"
        "raycast"
        "rectangle"
      ];
    };
  in
  {
    darwinConfigurations."iamchanii" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    darwinPackages = self.darwinConfigurations."iamchanii".pkgs;
  };
}
