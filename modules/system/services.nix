{ pkgs, ... }:

{
  services.printing.enable = true;
  services.blueman.enable = true;
  services.flatpak.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
