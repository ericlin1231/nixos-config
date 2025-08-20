{ pkgs, ... }:

{
  environment.sessionVariables = {
    LD_LIBRARY_PATH = [
      "${pkgs.stdenv.cc.cc.lib}/lib"
      "/run/opengl-driver/lib:${pkgs.vulkan-loader}/lib"
    ];
  };
}
