{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    gperftools # Google performance tools - https://gperftools.github.io/gperftools/cpuprofile.html
    k6         # Web stress test    - https://k6.io/
    hyperfine  # Command benchmarks - https://github.com/sharkdp/hyperfine
    unixbench  # System performance - https://github.com/kdlucas/byte-unixbench
    sysbench   # System performance - https://github.com/akopytov/sysbench
    glmark2    # OpenGL benchmark   - https://github.com/glmark2/glmark2
    stress-ng  # Make your PC cry.  - https://github.com/ColinIanKing/stress-ng
    sysprof    # System wide profiler - https://wiki.gnome.org/Apps/Sysprof
  ];
}