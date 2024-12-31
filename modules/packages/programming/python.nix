{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [

    # Python 3.12.7
    (python312.withPackages (python-pkgs: [
      python-pkgs.pandas        # Pandas - https://pandas.pydata.org/
      python-pkgs.numpy         # NumPy  - https://numpy.org/
      python-pkgs.requests
      python-pkgs.pillow        # Pillow     - https://pillow.readthedocs.io/en/stable/handbook/tutorial.html
      python-pkgs.matplotlib    # MatPlotLib - https://matplotlib.org/
      python-pkgs.matplotx
      python-pkgs.opencv-python # OpenCV - https://opencv.org/
      python-pkgs.flask         # Flask  - https://flask.palletsprojects.com/en/stable/
      python-pkgs.redis         # Redis driver - https://redis.io/docs/latest/develop/clients/redis-py/
      python-pkgs.graphviz      # GraphViz     - https://graphviz.readthedocs.io/en/stable/manual.html
      python-pkgs.pip
      python-pkgs.virtualenv
    ]))

    # PipX - https://pipx.pypa.io/latest/installation/
    pipx

    # Anaconda Conda package manager - https://anaconda.org/anaconda/conda
    conda
  ];
}