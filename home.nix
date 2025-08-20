{ pkgs, nixvim, ... }:

{
  home.username = "eric";
  home.homeDirectory = "/home/eric";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  imports = [
    ./modules/home/hyprland.nix
    ./modules/home/waybar.nix
    ./modules/home/git.nix
    ./modules/home/bash.nix
    ./modules/home/direnv.nix
    ./modules/home/nixvim.nix
    ./modules/home/alacritty.nix
    ./modules/home/starship.nix
    ./modules/home/shellAliases.nix
  ];
}
