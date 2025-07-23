{ ... }:

{
	home.shellAliases = {
		v = "nvim";
		l = "ls -al";
		c = "clear";
		sv = "sudo -E nvim";
		nixup = "sudo nixos-rebuild switch --flake ~/workspace/.conf";
	};
}
