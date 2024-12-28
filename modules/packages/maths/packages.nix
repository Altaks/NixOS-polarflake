{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Scilab
    scilab-bin
    
    # Grapher
    zegrapher
  ];
}