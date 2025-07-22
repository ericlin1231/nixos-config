{ ... }:

{
	services.printing.enable = true;
	services.blueman.enable = true;
	services.flatpak.enable = true;

	security.pam.services.sddm.enable = true;

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};
}
