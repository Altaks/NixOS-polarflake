{ config, pkgs, lib, ... } : {

  imports = [
    ./android.nix
    ./c-cpp.nix
    ./db.nix
    ./debugging.nix
    ./documentation.nix
    ./embedded.nix
    ./flutter.nix
    ./grammars.nix
    ./java.nix
    ./javascript.nix
    ./php.nix
    ./python.nix
    ./rust.nix
    ./swift.nix
    ./testing.nix
  ];

}