{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = [
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