{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    p7zip
    zip
    unzip
    ripunzip
    ripgrep
  ];
}