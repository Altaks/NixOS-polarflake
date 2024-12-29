{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Memory debugging & profiling - https://valgrind.org/
    valgrind

    # Decompiler - https://cutter.re/
    cutter
  ];
}