{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Raspberry Pi imager - https://www.raspberrypi.com/software/
    rpi-imager

    # Flashing USB sticks - https://unetbootin.github.io/
    unetbootin
  ];
}