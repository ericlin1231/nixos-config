{ config, pkgs, lib, ... }:

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

  fileSystems."/" = {
    device = lib.mkForce "/dev/disk/by-uuid/c42b1024-e403-4aa4-bea9-bf578a24f035";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = lib.mkForce "/dev/disk/by-uuid/C661-2757";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        gfxmodeEfi = lib.mkForce "3200x2000";
        configurationLimit = 5;
        copyKernels = false;
      };
    };
    kernelPackages = pkgs.linuxPackages;
  };

  networking = {
    hostName = "eric";
    networkmanager.enable = true;
  };

  hardware = {
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
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

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
