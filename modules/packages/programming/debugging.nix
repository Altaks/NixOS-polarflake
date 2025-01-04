{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Memory debugging & profiling - https://valgrind.org/
    valgrind

    # Decompiler - https://cutter.re/
    cutter

    # GNOME Character Map - https://wiki.gnome.org/Apps(2f)Gucharmap.html
    gucharmap
  ];
}