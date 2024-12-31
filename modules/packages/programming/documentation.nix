{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Document generator - https://www.doxygen.nl/index.html
    doxygen
    
    # Python documentation generator - https://www.sphinx-doc.org/en/master/
    sphinx
  ];
}