{ pkgs }: rec {
  fcitxPkgs = with pkgs; [ fcitx5-gtk fcitx5-chewing ];

  fontPkgs = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    source-han-sans
    nerd-fonts.jetbrains-mono
  ];

  toolPkgs = with pkgs; [
    # General Tools
    home-manager
    gh
    gnupg
    tree
    curl
    cloc
    pinentry
    openssl
    awscli

    # Programming
    gdb
    gnumake
    gcc
    clang
    cppcheck
    valgrind
    qemu
    zig
    rustup
    deno
    uv
    python313

    # Formatter
    prettierd
    rustfmt
    black
    isort
    verible

    # VLSI Tools
    verilator
    surfer

    # Firmware
    vulkan-loader
  ];

  windowsPkgs = with pkgs; [
    waybar
    eww
    swww
    alacritty
    rofi-wayland
    dunst
    libnotify
    networkmanagerapplet
    hyprsunset
    pavucontrol
    sddm-astronaut
    kdePackages.qtmultimedia
  ];

  officePkgs = with pkgs; [
    brave
    bilibili
    discord-ptb
    obsidian
    libreoffice-qt
    hunspell
    anki-bin
    anki-sync-server
    kdePackages.okular
    typst
    usbimager
    usbutils
    gnome-disk-utility
  ];

  systemPkgs = toolPkgs ++ officePkgs ++ windowsPkgs;
}
