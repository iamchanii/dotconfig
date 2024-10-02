{ pkgs, self, ... }:

{
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # System preferences: Keyboard Settings
  system.defaults.NSGlobalDomain.KeyRepeat = 2; # 키 반복 속도: 빠르게
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15; # 반복 지연 시간: 짧게

  environment.systemPackages =
    [ 
      pkgs.vim
      pkgs.neovim
      pkgs.nodejs_22
      pkgs.pnpm
      pkgs.cargo
    ];
  
  environment.shellAliases = {
    vim = "nvim";
    "update-system" = "darwin-rebuild switch --flake ~/.config/nix-darwin#iamchanii";
  };

  # Homebrew
  homebrew = {
    enable = true;

    brews = [
      "starship"
      "gh"
      "pinentry"
    ];

    casks = [
      "wezterm"
      "arc"
      "raycast"
      "rectangle"
    ];
  };
}
