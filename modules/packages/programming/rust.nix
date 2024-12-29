{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Rust related tools - https://www.rust-lang.org/
    rustup
  ];
}