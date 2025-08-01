{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = [ pkgs.sddm-astronaut ];
    theme = "sddm-astronaut-theme";
    settings.Theme.Current = "sddm-astronaut-theme";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
