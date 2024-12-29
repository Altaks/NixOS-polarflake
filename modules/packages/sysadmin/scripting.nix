{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    cron          # Cron - https://crontab.guru/
    cronutils
    go-task       # Taskfiles - https://taskfile.dev/
    just          # Justfiles - https://github.com/casey/just
  ];
}