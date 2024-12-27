{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
  
    # VPN
    protonvpn-gui
    protonvpn-cli
  ];
}