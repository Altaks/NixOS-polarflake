{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Open any media
    vlc
    
    # Spotify because i need it
    spotify
    spotify-tray
  ];
}