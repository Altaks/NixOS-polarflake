{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
  
    # Proton VPN - https://protonvpn.com/
    protonvpn-gui
    protonvpn-cli
  ];
}