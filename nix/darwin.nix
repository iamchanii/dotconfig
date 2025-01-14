{ pkgs, self, user, ... }:

{
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

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
  
  # Homebrew
  homebrew = {
    enable = true;
    brews = import ./brews.nix;
    casks = import ./casks.nix;
    taps = import ./taps.nix;
    global = {
      brewfile = true;
      lockfiles = true;
    };
    onActivation = {
      upgrade = true;
    };
  };

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  home-manager.backupFileExtension = "backup";
}
