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
    amdgpu_top

    # Programming
    ghostty
    gdb
    gnumake
    gcc
    clang
    lld
    libllvm
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
    gamescope
    bilibili
    discord-ptb
    obsidian
    libreoffice-qt
    hunspell
    anki-bin
    anki-sync-server
    kdePackages.okular
    typst
  ];

  systemPkgs = toolPkgs ++ officePkgs ++ windowsPkgs;
}
