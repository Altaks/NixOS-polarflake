{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    postman   # Web request client - https://www.postman.com/
    insomnia  # Web request client - https://insomnia.rest/
  ];
}