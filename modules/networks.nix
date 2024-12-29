{ inputs, config, lib, pkgs, ... }: { 
  
  # Defines your hostname
  networking.hostName = "%%%hostname%%%";
  
  # Pick only one of the below networking options.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Restrict incoming request to HTTP, HTTPS and SSH ports
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 22 ];

  # Install a WiFi Hotspot utility to use your computer as a repeater
  environment.systemPackages = with pkgs; [
    linux-wifi-hotspot
  ];
}