{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Android development
    android-studio
    android-tools
  ];

  programs.adb.enable = true;
  programs.nix-ld.enable = true;

  services.udev.packages = [
    pkgs.android-udev-rules
  ];
}