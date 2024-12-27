{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Communicate
    slack
    teams-for-linux

    # Minetest client from team building purposes
    minetestclient
  ];
}