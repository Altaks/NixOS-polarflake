{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    (python312.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.numpy
      python-pkgs.requests
      python-pkgs.pillow
      python-pkgs.matplotlib
      python-pkgs.matplotx
      python-pkgs.opencv-python
      python-pkgs.flask
      python-pkgs.redis
      python-pkgs.graphviz
    ]))
  ];
}