{ pkgs, ... }:

{
  # System preferences: Keyboard Settings
  system.defaults.NSGlobalDomain.KeyRepeat = 2; # 키 반복 속도: 빠르게
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15; # 반복 지연 시간: 짧게
  
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
