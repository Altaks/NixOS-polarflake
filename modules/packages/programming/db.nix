{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # SQLite - https://www.sqlite.org/index.html
    sqlite
    
    # SQLPlus client and Oracle related libs - https://docs.oracle.com/en/database/oracle/oracle-database/19/sqpug/SQL-Plus-quick-start.html
    oracle-instantclient
  ];
}