{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    postman
    insomnia
    k6
  ];
}