{ ... }:

{
  programs.brave = {
    enable = true;
    extraArgs = [
      "--disable-gpu"
      "--disable-seccomp-filter-sandbox"
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };
}
