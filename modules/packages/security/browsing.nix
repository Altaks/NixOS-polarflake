{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    tor         # Connecting to Tor - https://www.torproject.org/
    tor-browser
  ];
}