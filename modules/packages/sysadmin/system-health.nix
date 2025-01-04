{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    inotify-info   # INotify Info - https://github.com/mikesart/inotify-info
    btop           # Better Top   - https://github.com/aristocratos/btop
    gnome-logs     # Systemd logs - https://wiki.gnome.org/Apps(2f)Logs.html
  ];
}