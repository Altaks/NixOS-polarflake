{ inputs, config, pkgs, lib, ... } : {

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
    gnome-tweaks
    gnome-shell-extensions
    gnome-extension-manager
    gnome-extensions-cli
  ];

}