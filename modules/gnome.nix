{ inputs, config, pkgs, lib, ... } : {

  # Install Gnome extensions
  environment.systemPackages = with pkgs; [

    gnomeExtensions.blur-my-shell
    gnomeExtensions.applications-menu
    gnomeExtensions.caffeine
    gnomeExtensions.gtk4-desktop-icons-ng-ding
    gnomeExtensions.tiling-assistant
    gnomeExtensions.vitals
    gnomeExtensions.places-status-indicator
    gnomeExtensions.user-themes
    gnomeExtensions.hide-activities-button
    gnomeExtensions.control-blur-effect-on-lock-screen
    gnomeExtensions.customize-clock-on-lock-screen
    gnomeExtensions.unlock-dialog-background
    gnomeExtensions.extension-list
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
    gnomeExtensions.quick-settings-audio-panel
    gnome-tweaks
    gnome-shell-extensions
    gnome-extension-manager
    gnome-extensions-cli

    # Requirements for Vitals to work properly according to Arch Linux requirement for Vitals extension
    lm_sensors
    libgtop
  ];

  # Make sure Gnome keeps the settings between relogins/reboots
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

}