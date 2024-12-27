{ config, pkgs, lib, ... } : {

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      enableCryptodisk = true;
      theme = "/home/altaks/.dotfiles/grub-theme";
      enable = true;
      extraEntries = ''
      menuentry "BIOS / UEFI (Motherboard configuration)" {
        fwsetup
      }

      menuentry "Shutdown" {
        insmod halt
        halt
      }

      menuentry "Restart" {
        insmod reboot
        reboot
      }
      '';
    };
  };

  time.hardwareClockInLocalTime = true;

  # Enable numlock on system boot
  systemd.services.numLockOnTty = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      # /run/current-system/sw/bin/setleds -D +num < "$tty";
      ExecStart = lib.mkForce (pkgs.writeShellScript "numLockOnTty" ''
        for tty in /dev/tty{1..6}; do
            ${pkgs.kbd}/bin/setleds -D +num < "$tty";
        done
      '');
    };
  };
}