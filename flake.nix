{
  description = "NixOS and Home Manager config for Eric";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:nix-community/nixvim";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
  };

  outputs =
    { self, nixpkgs, home-manager, flake-utils, nixvim, grub2-themes, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.eric = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          grub2-themes.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit nixvim; };
            home-manager.backupFileExtension = "backup";
            home-manager.users.eric = {
              imports = [ ./home.nix nixvim.homeManagerModules.nixvim ];
            };
          }
        ];
      };
    };
}
