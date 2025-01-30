{ pkgs, ... }: {
  channel = "stable-24.05"; # or "unstable"
  
  packages = [
    (pkgs.python311.withPackages(ps: with ps; [
      simple-term-menu
      numpy
      requests
    ]))
    pkgs.python311Packages.pip
  ];
  
  env = {
    PYTHONPATH = "${pkgs.python311}/lib/python3.11/site-packages";
  };
  
  idx = {
    extensions = [
      "ms-python.debugpy"
      "ms-python.python"
      "ms-toolsai.jupyter"
      "esbenp.prettier-vscode"
    ];
    
    previews = {
      enable = true;
      previews = {};
    };
    
    workspace = {
      onCreate = {
        default.openFiles = [ "main.py" ];
      };
      onStart = {
        default.runTasks = [ "echo 'Welcome to the Python workspace!'" ];
      };
    };
  };
}
