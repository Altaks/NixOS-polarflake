{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Raspberry Pi imager
    rpi-imager
  ];
}