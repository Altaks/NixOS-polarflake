{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    gperftools # Google performance tools - https://gperftools.github.io/gperftools/cpuprofile.html
  ];
}