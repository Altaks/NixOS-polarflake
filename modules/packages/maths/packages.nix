{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Scilab - https://www.scilab.org/
    scilab-bin
    
    # ZeGrapher - https://zegrapher.com/en/
    zegrapher

    # Geogebra - https://www.geogebra.org/
    geogebra6
  ];
}