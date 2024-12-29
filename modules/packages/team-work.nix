{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Communicate
    slack               # Slack - https://slack.com/signin#/signin
    teams-for-linux     # Teams - https://www.microsoft.com/en-us/microsoft-teams/log-in

    # Minetest client from team building purposes - https://www.luanti.org/
    minetestclient

    # Prism Launcher / MultiMC alternative for Minecraft related teamwork - https://prismlauncher.org/
    prismlauncher

    # One Drive - https://nixos.wiki/wiki/OneDrive
    onedrive
  ];
}