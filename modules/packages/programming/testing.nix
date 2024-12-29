{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    postman   # Web request client - https://www.postman.com/
    insomnia  # Web request client - https://insomnia.rest/
    k6        # Web stress test    - https://k6.io/
  ];
}