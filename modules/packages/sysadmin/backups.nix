{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [

    # Backup tool - https://apps.gnome.org/en/DejaDup/
    deja-dup
  ];
}