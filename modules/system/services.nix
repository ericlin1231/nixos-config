{ pkgs, ... }:

{
  services.printing.enable = true;
  services.blueman.enable = true;
  services.flatpak.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.udev.extraRules = ''
    ATTR{idVendor}=="0403", ATTR{idProduct}=="6015", MODE="0666"
  '';
}
