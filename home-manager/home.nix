{ inputs, config, lib, pkgs, ... }:
{
  home.username = "%%%username%%%";
  home.homeDirectory = "/home/%%%username%%%";

  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    # Fastfetch - https://github.com/fastfetch-cli/fastfetch
    pkgs.fastfetch

    # Discord w/ Vencord - https://vencord.dev/
    (
      pkgs.discord.override {
        withVencord = true;
      }
    )
  ];

  # Gnome configuration
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        
        # Enable installed extensions
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
          pkgs.gnomeExtensions.appindicator.extensionUuid
          pkgs.gnomeExtensions.dash-to-panel.extensionUuid
          pkgs.gnomeExtensions.quick-settings-audio-panel.extensionUuid
        ];
      };

      # Use Dark theme
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
      };

      # Dash to panel configuration
      "org/gnome/shell/extensions/dash-to-panel" = {
        appicon-margin = 8;
        appicon-padding = 4;
        available-monitors = [ 0 ];
        dot-color-dominant = true;
        dot-color-override = false;
        dot-position = "BOTTOM";
        dot-style-unfocused = "DOTS";
        focus-highlight-dominant = true;
        focus-highlight-opacity = 20;
        group-apps = true;
        hotkeys-overlay-combo = "TEMPORARILY";
        leftbox-padding = -1;
        panel-anchors = ''
          {"0":"MIDDLE"}
        '';
        panel-element-positions = ''
          {"0":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":false,"position":"stackedBR"},{"element":"systemMenu","visible":false,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
        '';
        panel-lengths = ''
          {"0":100}
        '';
        panel-sizes = ''
          {"0":40}
        '';
        primary-monitor = 0;
        secondarymenu-contains-showdetails = true;
        show-favorites-all-monitors = true;
        show-showdesktop-delay = 500;
        show-showdesktop-hover = true;
        status-icon-padding = -1;
        stockgs-force-hotcorner = false;
        stockgs-keep-dash = false;
        stockgs-keep-top-panel = true;
        stockgs-panelbtn-click-only = false;
        trans-use-custom-bg = false;
        trans-use-custom-opacity = true;
        trans-use-dynamic-opacity = false;
        tray-padding = -1;
        window-preview-title-position = "TOP";
      };

      # Vitals extension configuration
      "org/gnome/shell/extensions/vitals" = {
        hide-icons = false;
        hide-zeros = true;
        hot-sensors = [ "_processor_usage_" "_memory_allocated_" "_gpu#1_utilization_" "__network-rx_max__" "__network-tx_max__" "_network_public_ip_" "__temperature_avg__" ];
        icon-style = 1;
        include-static-gpu-info = true;
        include-static-info = true;
        menu-centered = false;
        position-in-panel = 0;
        show-battery = true;
        show-gpu = true;
        use-higher-precision = true;
      };
    };
  };

  programs.bash = {

    # Use bash
    enable = true;

    # Define Bash aliases
    shellAliases = {
      l = "ls -alh";
      ll = "ls -l";
      ls = "ls --color=tty";
      cleart = "clear && fastfetch";
      dce = "docker compose exec";
      dcu = "docker compose up";
      dcub = "docker compose up --build";
    };

    # Extra content for ~/.bashrc
    bashrcExtra = ''
      # Enable OyMyPosh with installede configuration
      eval "$(oh-my-posh init bash --config ~/.dotfiles/oh-my-posh/config.json)"
      
      # Enable FZF + keybinds + completion
      if command -v fzf-share >/dev/null; then
        source "$(fzf-share)/key-bindings.bash"
        source "$(fzf-share)/completion.bash"
      fi
    
      # Start fastfetch if the opened terminal is wide enough
      if [[ $(tput lines) -ge 43 && $(tput cols) -ge 92 ]]; then
	      fastfetch
      fi

      # Export paths
      export LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib";
      
      # Export flutter & flutter related path
      flutter_sdk=$(readlink -f $(which flutter) | awk '{sub(/\/flutter$/,"")}1')
      export PATH="$flutter_sdk:$PATH";
      export CHROME_EXECUTABLE="$(which chromium)"; 
      
      # Export Android related paths
      export ANDROID_HOME="/home/%%%username%%%/Android/Sdk";
    '';
  };

  # Make OhMyPosh integrated w/ bash
  programs.oh-my-posh.enableBashIntegration = true;

  # Make Zoxide available to bash
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  # Make FZF available to bash
  programs.fzf.enable = true;

  # System hardlinks for configurations
  home.file = {
    ".config/fastfetch".source = config.lib.file.mkOutOfStoreSymlink /home/%%%username%%%/.dotfiles/fastfetch;
    ".config/oh-my-posh".source = config.lib.file.mkOutOfStoreSymlink /home/%%%username%%%/.dotfiles/oh-my-posh;
  };

  programs.home-manager.enable=true;

  # Define default apps for opening files
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    # Web content
    "text/html" = "zen.desktop";
    "x-scheme-handler/http" = "zen.desktop";
    "x-scheme-handler/https" = "zen.desktop";
    "x-scheme-handler/about" = "zen.desktop";
    "x-scheme-handler/unknown" = "zen.desktop";

    # Images & GIFs
    "image/avif" = "loupe.desktop";
    "image/bmp" = "loupe.desktop";
    "image/gif" = "loupe.desktop";
    "image/vnd.microsoft.icon" = "loupe.desktop";
    "image/jpeg" = "loupe.desktop";
    "image/jpg" = "loupe.desktop";
    "image/png" = "loupe.desktop";
    "image/svg" = "loupe.desktop";
    "image/webp" = "loupe.desktop";

    # Ogg Vorbis and Theora (Xiph family)
    "application/ogg" = "vlc.desktop";
    "application/x-ogg" = "vlc.desktop";
    "audio/ogg" = "vlc.desktop";
    "audio/vorbis" = "vlc.desktop";
    "audio/x-vorbis" = "vlc.desktop";
    "audio/x-vorbis+ogg" = "vlc.desktop";
    "video/ogg" = "vlc.desktop";
    "video/x-ogm" = "vlc.desktop";
    "video/x-ogm+ogg" = "vlc.desktop";
    "video/x-theora+ogg" = "vlc.desktop";
    "video/x-theora" = "vlc.desktop";
    "audio/x-speex" = "vlc.desktop";
    "audio/opus" = "vlc.desktop";                   

    # FLAC lossless audio
    "application/x-flac" = "vlc.desktop";
    "audio/flac" = "vlc.desktop";
    "audio/x-flac" = "vlc.desktop";

    # Microsoft audio and video
    # ASF
    "audio/x-ms-asf" = "vlc.desktop";
    "audio/x-ms-asx" = "vlc.desktop";
    "audio/x-ms-wax" = "vlc.desktop";
    "audio/x-ms-wma" = "vlc.desktop";
    "video/x-ms-asf" = "vlc.desktop";
    "video/x-ms-asf-plugin" = "vlc.desktop";
    "video/x-ms-asx" = "vlc.desktop";
    "video/x-ms-wm" = "vlc.desktop";
    "video/x-ms-wmv" = "vlc.desktop";
    "video/x-ms-wmx" = "vlc.desktop";
    "video/x-ms-wvx" = "vlc.desktop";
    
    # AVI et al.
    "video/x-msvideo" = "vlc.desktop";
    "audio/x-pn-windows-acm" = "vlc.desktop";
    "video/divx" = "vlc.desktop";
    "video/msvideo" = "vlc.desktop";
    "video/vnd.divx" = "vlc.desktop";
    "video/avi" = "vlc.desktop";
    "video/x-avi" = "vlc.desktop";

    # Real audio and video
    "application/vnd.rn-realmedia" = "vlc.desktop";     # RM
    "application/vnd.rn-realmedia-vbr" = "vlc.desktop"; # RMVB
    "audio/vnd.rn-realaudio" = "vlc.desktop";
    "audio/x-pn-realaudio" = "vlc.desktop";
    "audio/x-pn-realaudio-plugin" = "vlc.desktop";
    "audio/x-real-audio" = "vlc.desktop";
    "audio/x-realaudio" = "vlc.desktop";
    "video/vnd.rn-realvideo" = "vlc.desktop";

    # MPEG related audio, video and transport
    # MPEG-2
    "audio/mpeg" = "vlc.desktop";                       # IANA-registered
    "audio/mpg" = "vlc.desktop";                        # IANA-registered
    "audio/mp1" = "vlc.desktop";
    "audio/mp2" = "vlc.desktop";
    "audio/mp3" = "vlc.desktop";
    "audio/x-mp1" = "vlc.desktop";
    "audio/x-mp2" = "vlc.desktop";
    "audio/x-mp3" = "vlc.desktop";
    "audio/x-mpeg" = "vlc.desktop";
    "audio/x-mpg" = "vlc.desktop";
    "video/mp2t" = "vlc.desktop";                       # TS
    "video/mpeg" = "vlc.desktop";
    "video/mpeg-system" = "vlc.desktop";
    "video/x-mpeg" = "vlc.desktop";
    "video/x-mpeg2" = "vlc.desktop";
    "video/x-mpeg-system" = "vlc.desktop";

    # MP4
    "application/mpeg4-iod" = "vlc.desktop";            # IANA-registered
    "application/mpeg4-muxcodetable" = "vlc.desktop";
    "application/x-extension-m4a" = "vlc.desktop";
    "application/x-extension-mp4" = "vlc.desktop";
    "audio/aac" = "vlc.desktop";
    "audio/m4a" = "vlc.desktop";
    "audio/mp4" = "vlc.desktop";                        # IANA-registered
    "audio/x-m4a" = "vlc.desktop";
    "audio/x-aac" = "vlc.desktop";
    "video/mp4" = "vlc.desktop";                        # IANA-registered
    "video/mp4v-es" = "vlc.desktop";
    "video/x-m4v" = "vlc.desktop";

    # Apple QuickTime (MOV)
    "application/x-quicktime-media-link" = "vlc.desktop";
    "application/x-quicktimeplayer" = "vlc.desktop";
    "video/quicktime" = "vlc.desktop";                  # IANA-registered

    # Matroska container format
    "application/x-matroska" = "vlc.desktop";
    "audio/x-matroska" = "vlc.desktop";
    "video/x-matroska" = "vlc.desktop";

    # WebM (Matroska + Vorbis/Opus + VP8/9)
    "video/webm" = "vlc.desktop";
    "audio/webm" = "vlc.desktop";

    # 3GPP related
    "audio/3gpp" = "vlc.desktop";                       # IANA-registered
    "audio/3gpp2" = "vlc.desktop";                      # IANA-registered
    "audio/AMR" = "vlc.desktop";                        # IANA-registered
    "audio/AMR-WB" = "vlc.desktop";                     # IANA-registered
    "video/3gp" = "vlc.desktop";
    "video/3gpp" = "vlc.desktop";
    "video/3gpp2" = "vlc.desktop";

    # URI scheme handlers (ie IP protocol support)
    "x-scheme-handler/mms" = "vlc.desktop";             # MMS
    "x-scheme-handler/mmsh" = "vlc.desktop";            # MMS over HTTP
    "x-scheme-handler/rtsp" = "vlc.desktop";            # RSTP
    "x-scheme-handler/rtp" = "vlc.desktop";
    "x-scheme-handler/rtmp" = "vlc.desktop";
    "x-scheme-handler/icy" = "vlc.desktop";             # Icecast
    "x-scheme-handler/icyx" = "vlc.desktop";            # Icecast

    # Linux desktop environment hooks for ISOs etc.
    "application/x-cd-image" = "vlc.desktop";
    "x-content/audio-player" = "vlc.desktop";

    # Playlists / text/xml list with URLs
    "application/ram" = "vlc.desktop";                  # Realaudio Metadata
    "application/xspf+xml" = "vlc.desktop";
    "audio/mpegurl" = "vlc.desktop";
    "audio/x-mpegurl" = "vlc.desktop";
    "audio/scpls" = "vlc.desktop";
    "audio/x-scpls" = "vlc.desktop";
    "text/google-video-pointer" = "vlc.desktop";
    "text/x-google-video-pointer" = "vlc.desktop";
    "video/vnd.mpegurl" = "vlc.desktop";                # IANA-registered
    "application/vnd.apple.mpegurl" = "vlc.desktop";    # HLS / M3U8
    "application/vnd.ms-asf" = "vlc.desktop";           # ZPL/WVX
    "application/vnd.ms-wpl" = "vlc.desktop";           # WPL
    "application/sdp" = "vlc.desktop";                  # SDP for RT*P

    # Digital Video
    "audio/dv" = "vlc.desktop";                         # IANA-registered
    "video/dv" = "vlc.desktop";                         # IANA-registered

    # IFF related formats
    "audio/x-aiff" = "vlc.desktop";
    "audio/x-pn-aiff" = "vlc.desktop";
    "video/x-anim" = "vlc.desktop";

    # NullSoft video
    "video/x-nsv" = "vlc.desktop";

    # Autodesk animation format
    "video/fli" = "vlc.desktop";
    "video/flv" = "vlc.desktop";
    "video/x-flc" = "vlc.desktop";
    "video/x-fli" = "vlc.desktop";
    "video/x-flv" = "vlc.desktop";

    # Audio sample formats
    "audio/wav" = "vlc.desktop";
    "audio/x-pn-au" = "vlc.desktop";
    "audio/x-pn-wav" = "vlc.desktop";
    "audio/x-wav" = "vlc.desktop";
    "audio/x-adpcm" = "vlc.desktop";                 # Same as IANA registered audio/32KADPCM?

    # Raw audio
    "audio/ac3" = "vlc.desktop";                     # IANA AC3
    "audio/eac3" = "vlc.desktop";                    # IANA E-AC3
    "audio/vnd.dts" = "vlc.desktop";                 # IANA DTS Audio
    "audio/vnd.dts.hd" = "vlc.desktop";              # IANA DTS-HD
    "audio/vnd.dolby.heaac.1" = "vlc.desktop";       # IANA Dolby HeAAC
    "audio/vnd.dolby.heaac.2" = "vlc.desktop";       # IANA Dolby HeAAC
    "audio/vnd.dolby.mlp" = "vlc.desktop";           # IANA MLP/TrueHD
    "audio/basic" = "vlc.desktop";                   # IANA mulaw
    "audio/midi" = "vlc.desktop";

    # Weird audio formats
    "audio/x-ape" = "vlc.desktop";
    "audio/x-gsm" = "vlc.desktop";
    "audio/x-musepack" = "vlc.desktop";
    "audio/x-tta" = "vlc.desktop";
    "audio/x-wavpack" = "vlc.desktop";
    "audio/x-shorten" = "vlc.desktop";

    # Adobe Flash player related
    "application/x-shockwave-flash" = "vlc.desktop";
    "application/x-flash-video" = "vlc.desktop";

    # SHOUTcast 2
    "misc/ultravox" = "vlc.desktop";

    # RealPix
    "image/vnd.rn-realpix" = "vlc.desktop";

    # Modplug / GME
    "audio/x-it" = "vlc.desktop";
    "audio/x-mod" = "vlc.desktop";
    "audio/x-s3m" = "vlc.desktop";
    "audio/x-xm" = "vlc.desktop";

    # From the totem desktop file in Debian.  These need more work.
    "application/mxf" = "vlc.desktop";                 # IANA-registered
    #application/smil               # IANA-registered
    #application/smil+xml           # IANA-registered
    #application/x-netshow-channel
    #application/x-shorten
    #application/x-smil
    #audio/prs.sid                  # IANA-registered
    #audio/x-sbc
    #audio/x-stm
    #image/x-pict
    #video/vivo
    #video/vnd.vivo                 # IANA-registered
    #video/x-flic
    #video/x-totem-stream
    #x-scheme-handler/net
    #x-scheme-handler/pnm
    #x-scheme-handler/uvox
    #
    #application/streamingmedia
    #application/x-streamingmedia
    #audio/rn-mpeg
    #audio/x-pn-windows-pcm
    #video/x-ms-afs
    #video/x-ms-wvxvideo

  };

  # Define Zen Browser as the system default browser
  home.sessionVariables.DEFAULT_BROWSER = "${inputs.zen-browser.packages."${pkgs.system}".default}/bin/zen";

  # Enable Numlock on session enter
  xsession.numlock.enable = true;
}