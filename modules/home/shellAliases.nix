{ ... }:

{
  home.shellAliases = {
    v = "nvim";
    l = "ls";
    c = "clear";
    sv = "sudo -E nvim";
    nixup = "sudo nixos-rebuild switch --flake ~/workspace/nixos-config";
    tree = ''
      tree \
      -I __pycache__ -I tsconfig* -I eslint* -I vite* \
      --gitignore --dirsfirst
    '';
  };
}
