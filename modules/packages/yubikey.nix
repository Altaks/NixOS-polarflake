{ inputs, config, lib, pkgs, ... }: { 

    # Enable yubikey related services
    # Website       : https://www.yubico.com/
    # on NixOS      : https://nixos.wiki/wiki/Yubikey
    services.udev.packages = [ pkgs.yubikey-personalization ];
    services.pcscd.enable = true;

    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };

    security.pam.services = {
        login.u2fAuth = true;
        sudo.u2fAuth = true;
    };

    # Install yubikey related utilities
    environment.systemPackages = with pkgs; [
        yubico-pam
        yubikey-manager
    ];
}