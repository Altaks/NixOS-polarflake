{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    valgrind
    cutter
  ];
}