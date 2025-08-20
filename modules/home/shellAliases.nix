{ ... }:

{
  home.shellAliases = {
    v = "nvim";
    l = "ls";
    c = "clear";
    sv = "sudo -E nvim";
    nixup-laptop = "sudo nixos-rebuild switch --flake /etc/nixos#laptop";
    nixup-desktop = "sudo nixos-rebuild switch --flake /etc/nixos#desktop";
    homeup = "home-manager switch --flake /etc/nixos#eric";
    tree = ''
      tree \
      -I __pycache__ -I tsconfig* -I eslint* -I vite* \
      --gitignore --dirsfirst
    '';
  };
}
