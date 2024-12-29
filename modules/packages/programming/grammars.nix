{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Language developement related tools
    flex      # Lexical analyzer - https://github.com/westes/flex
    bison     # Parser generator - https://www.gnu.org/software/bison/
    libgcc
  ];
}