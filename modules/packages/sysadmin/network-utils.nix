{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Network tools
    inetutils

    wireshark    # Network sniffer     - https://www.wireshark.org/
    proxychains  # Proxy wrapper       - https://github.com/haad/proxychains
    dig          # DNS digger          - https://en.wikipedia.org/wiki/Dig_(command)
    tcpdump      # TCP listener        - https://www.tcpdump.org/
    dhcpdump     # DHCP packets dumper - https://linux.die.net/man/1/dhcpdump
  ];
}