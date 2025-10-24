{ pkgs, ... }:

{
  environment.sessionVariables = {
    KWIN_X11 = "0";
    NIXOS_OZONE_WL = "1";
    STEAM_DISABLE_BROWSER= "1";
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    REQUESTS_CA_BUNDLE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    LD_LIBRARY_PATH = [
      "${pkgs.stdenv.cc.cc.lib}/lib"
      "/run/opengl-driver/lib:${pkgs.vulkan-loader}/lib"
    ];
  };
}
