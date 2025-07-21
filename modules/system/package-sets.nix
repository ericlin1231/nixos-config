{ pkgs }:
rec {
	fcitxPkgs = with pkgs; [
		fcitx5-gtk
		fcitx5-chewing
	];

	fontPkgs = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		nerd-fonts.jetbrains-mono
	];

	toolPkgs = with pkgs; [
		gh gnupg tree
		curl cloc typst
		pinentry

		gdb gnumake
		gcc clang
		cppcheck valgrind
		qemu
		deno

		verilator surfer
	];

	windowsPkgs = with pkgs; [
		waybar eww swww
		alacritty rofi-wayland
		dunst libnotify
		networkmanagerapplet
		hyprsunset pavucontrol
	];

	officePkgs = with pkgs; [
		brave discord-ptb obsidian
		libreoffice-qt hunspell
		anki-bin anki-sync-server
	];

	systemPkgs = toolPkgs ++ windowsPkgs ++ officePkgs;
}
