{ config, pkgs, ... }:

let
  pkgSets = import ./modules/system/package-sets.nix { inherit pkgs; };
  inherit (pkgSets) fcitxPkgs fontPkgs systemPkgs;
in
{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/windows-system.nix
    ./modules/system/sessionVariables.nix
    ./modules/system/services.nix
    ./modules/system/sounds.nix
    ./modules/system/steam.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
    };
    grub2-theme = {
      enable = true;
      theme = "stylish";
    };
  };

  networking = {
    hostName = "eric";
    networkmanager.enable = true;
  };

  hardware = {
    nvidia = {
      open = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Experimental = true;
    };
  };

  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    packages = fontPkgs;
  };
  environment.systemPackages = systemPkgs;
  programs.nix-ld.enable = true;
  virtualisation.docker.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  time.timeZone = "Asia/Taipei";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_TW.UTF-8";
    LC_IDENTIFICATION = "zh_TW.UTF-8";
    LC_MEASUREMENT = "zh_TW.UTF-8";
    LC_MONETARY = "zh_TW.UTF-8";
    LC_NAME = "zh_TW.UTF-8";
    LC_NUMERIC = "zh_TW.UTF-8";
    LC_PAPER = "zh_TW.UTF-8";
    LC_TELEPHONE = "zh_TW.UTF-8";
    LC_TIME = "zh_TW.UTF-8";
  };
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      addons = fcitxPkgs;
      waylandFrontend = true;
    };
  };

  users.users.eric = {
    isNormalUser = true;
    description = "eric";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.05";
}
