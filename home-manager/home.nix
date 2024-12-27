{ config, pkgs, ... }:
{
  home.username = "altaks";
  home.homeDirectory = "/home/altaks";

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.fastfetch
    (
      pkgs.discord.override {
        withVencord = true;
      }
    )
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        enabled-extensions = [
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.caffeine.extensionUuid
          pkgs.gnomeExtensions.gtk4-desktop-icons-ng-ding.extensionUuid
          pkgs.gnomeExtensions.tiling-assistant.extensionUuid
          pkgs.gnomeExtensions.vitals.extensionUuid
          pkgs.gnomeExtensions.places-status-indicator.extensionUuid
          pkgs.gnomeExtensions.user-themes.extensionUuid
          pkgs.gnomeExtensions.hide-activities-button.extensionUuid
          pkgs.gnomeExtensions.control-blur-effect-on-lock-screen.extensionUuid
          pkgs.gnomeExtensions.customize-clock-on-lock-screen.extensionUuid
          pkgs.gnomeExtensions.unlock-dialog-background.extensionUuid
          pkgs.gnomeExtensions.extension-list.extensionUuid
        ];
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
      };
  
    };
  };

  programs.bash.enable = true;

  programs.bash = {
    shellAliases = {
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=tty";
      cleart = "clear && fastfetch";
      dce = "docker compose exec";
      dcu = "docker compose up";
      dcub = "docker compose up --build";
    };
    bashrcExtra = ''
      eval "$(oh-my-posh init bash --config ~/.dotfiles/oh-my-posh/config.json)"
      
      if command -v fzf-share >/dev/null; then
        source "$(fzf-share)/key-bindings.bash"
        source "$(fzf-share)/completion.bash"
      fi
    
      if [[ $(tput lines) -ge 43 && $(tput cols) -ge 92 ]]; then
	      fastfetch
      fi

      export LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib";
      
      flutter_sdk=$(readlink -f $(which flutter) | awk '{sub(/\/flutter$/,"")}1')
      export PATH="$flutter_sdk:$PATH";
      
      export ANDROID_HOME="/home/altaks/Android/Sdk";
      export CHROME_EXECUTABLE="$(which chromium)"; 
    '';
  };

  programs.oh-my-posh.enableBashIntegration = true;

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.fzf.enable = true;

  home.sessionVariables = {
    BROWSER = "zen";
  };

  home.file = {
    # ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/hypr;
    # ".config/tofi".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/tofi;
    # ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/waybar;
    ".config/fastfetch".source = config.lib.file.mkOutOfStoreSymlink /home/altaks/.dotfiles/fastfetch;
    ".config/oh-my-posh".source = config.lib.file.mkOutOfStoreSymlink /home/altaks/.dotfiles/oh-my-posh;
    # ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink /home/tinsuki/.dotfiles/kitty;
  };

  programs.home-manager.enable=true;
}