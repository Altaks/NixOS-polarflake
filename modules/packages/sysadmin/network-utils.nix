{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Network tools
    inetutils
    wireshark
    proxychains
    dig
    tcpdump
    dhcpdump
  ];
}