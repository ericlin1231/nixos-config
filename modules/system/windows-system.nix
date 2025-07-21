{ config, pkgs, ...}:

{
	services.desktopManager.plasma6.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;

	programs.hyprland.enable = true;

	environment.sessionVariables = {
		WLR_NO_HARDWARE_CURSORS = "1";
		NIXOS_OZONE_WL = "1";
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
