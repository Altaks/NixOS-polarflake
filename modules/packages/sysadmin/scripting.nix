{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    cron
    cronutils
    go-task
    just
  ];
}