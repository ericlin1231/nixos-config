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
		gh gnupg tree
		curl cloc typst
		pinentry poppler_utils

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
		sddm-astronaut
		kdePackages.qtmultimedia
	];

	officePkgs = with pkgs; [
		brave discord-ptb obsidian
		libreoffice-qt hunspell
		anki-bin anki-sync-server
		kdePackages.okular
	];

	systemPkgs = toolPkgs
			   ++ officePkgs
			   ++ windowsPkgs;
}
