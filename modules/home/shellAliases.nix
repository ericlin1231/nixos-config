{ ... }:

{
  home.shellAliases = {
    v = "nvim";
    l = "nnn -e";
    c = "clear";
    sv = "sudo -E nvim";
    nixup = "sudo nixos-rebuild switch --flake ~/workspace/.conf";
    tree = ''
      tree \
      -I __pycache__ -I tsconfig* -I eslint* -I vite* \
      --gitignore --dirsfirst
    '';
  };
}
