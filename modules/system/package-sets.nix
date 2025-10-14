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
    wget
    gdown
    gzip
    usbutils
    picocom
    ghostty
    gdb
    gnumake
  ];

  programPkgs = with pkgs; [
    gcc
    clang
    lld
    libllvm
    zig
    rustup
    uv
    python313
    deno
    nodejs_20
  ];

  debugPkgs = with pkgs; [
    gdb
    cppcheck
    valgrind
  ];

  libPkgs = with pkgs; [
    libllvm
    zlib
    libevent
    json_c
  ];

  vmPkgs = with pkgs; [
    qemu
  ];

  formatterPkgs = with pkgs; [
    prettierd
    rustfmt
    black
    isort
    verible
  ];

  vlsiPkgs = with pkgs; [
    verilator
    surfer
    trellis
  ];

  driverPkgs = with pkgs; [
    vulkan-loader
  ];

  windowsPkgs = with pkgs; [
    networkmanagerapplet
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
    rustdesk
    screen
  ];

  systemPkgs = toolPkgs ++ programPkgs ++ debugPkgs ++ vmPkgs ++ libPkgs ++
  vlsiPkgs ++ driverPkgs ++ formatterPkgs ++ officePkgs ++ windowsPkgs;
}
