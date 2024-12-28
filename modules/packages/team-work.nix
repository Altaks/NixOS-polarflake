{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Communicate
    slack
    teams-for-linux

    # Minetest client from team building purposes
    minetestclient

    # Prism Launcher / MultiMC alternative
    prismlauncher

    # One Drive - https://nixos.wiki/wiki/OneDrive
    onedrive
  ];
}