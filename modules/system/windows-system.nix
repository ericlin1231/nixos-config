{ pkgs,  ... }:

{
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
		package = pkgs.kdePackages.sddm;
		extraPackages = [ pkgs.sddm-astronaut ];
		theme = "sddm-astronaut-theme";
		settings.Theme.Current = "sddm-astronaut-theme";
	};

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
