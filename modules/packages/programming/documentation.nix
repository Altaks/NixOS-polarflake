{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Document generator
    doxygen
    # Python documentation generator
    sphinx
  ];
}