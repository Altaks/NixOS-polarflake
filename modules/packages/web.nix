{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    
    # Web browsers
    inputs.zen-browser.packages."${pkgs.system}".default
    vivaldi
    chromium

    # Internet interaction
    wget
    curl 
    motrix
  ];

  # Install firefox the Nix way i guess
  programs.firefox.enable = true;
}