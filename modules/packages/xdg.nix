{ inputs, config, lib, pkgs, ... }: { 

    xdg = {
        portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-gnome
                xdg-desktop-portal-gtk
            ];
        };
    };
}