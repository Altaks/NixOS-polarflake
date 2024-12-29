{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    baobab  # GNOME disk usage visualizer
    gparted # Gparted - https://gparted.org/
  ];
}