{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    
    # BitWarden Desktop - https://bitwarden.com/fr-fr/
    bitwarden-desktop
  ];
}