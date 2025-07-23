{ pkgs }:
rec {
	fcitxPkgs = with pkgs; [
		fcitx5-gtk
		fcitx5-chewing
	];

	fontPkgs = with pkgs; [
		noto-fonts
		noto-fonts-emoji
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		source-han-sans
		nerd-fonts.roboto-mono
		nerd-fonts.jetbrains-mono
	];

	toolPkgs = with pkgs; [
		# General Tools
		gh gnupg tree
		curl cloc
		pinentry

		# System Programming
		gdb gnumake
		gcc clang
		cppcheck valgrind
		qemu

		# Full-Stack
		deno

		# Formatter
		prettierd rustfmt

		# VLSI Tools
		verilator surfer
	];

	windowsPkgs = with pkgs; [
		waybar eww swww
		alacritty rofi-wayland
		dunst libnotify
		networkmanagerapplet
		hyprsunset pavucontrol
		sddm-astronaut
		kdePackages.qtmultimedia
	];

	officePkgs = with pkgs; [
		brave discord-ptb obsidian
		libreoffice-qt hunspell
		anki-bin anki-sync-server
		kdePackages.okular typst
	];

	systemPkgs = toolPkgs
			   ++ officePkgs
			   ++ windowsPkgs;
}
