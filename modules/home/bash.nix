{ ... }:

{
  programs.bash = {
    enable = true;
    initExtra = "
      export PATH=$HOME/.local/bin:$PATH
      eval $(starship init bash)
      cd ~/workspace
    ";
  };
}
