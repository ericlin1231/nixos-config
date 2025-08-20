{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window = {
        padding = {
          x = 20;
          y = 20;
        };
        decorations = "None";
      };
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        size = 16;
      };
    };
  };
}
