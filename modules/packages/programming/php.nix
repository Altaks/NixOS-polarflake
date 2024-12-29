{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = [
    
    # NixOS PHP Installation with XDebug enabled - https://wiki.nixos.org/wiki/PHP
    (pkgs.php.buildEnv {
      extensions = ({ enabled, all }: enabled ++ (with all; [
        xdebug
      ]));
      extraConfig = ''
        xdebug.mode=debug
      '';
    })
  ];
}