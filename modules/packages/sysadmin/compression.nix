{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    p7zip
  ];
}