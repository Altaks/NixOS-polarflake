{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    
    # DB tool
    sqlite
    
    # SQLPlus client and Oracle related libs
    oracle-instantclient
  ];
}