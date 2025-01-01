{ inputs, config, lib, pkgs, ... }: { 

    # Configure XDG to support GNOME and GTK correctly
    # Fixes screen sharing issues, see https://wiki.archlinux.org/title/XDG_Desktop_Portal#List_of_backends_and_interfaces
    xdg = {
        portal = {
            enable = true;

            # Add the needed portals for the current configuration
            extraPortals = with pkgs; [
                xdg-desktop-portal-gnome
                xdg-desktop-portal-gtk
            ];
        };
    };
}