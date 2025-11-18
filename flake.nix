{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL = {
      url = "github:nikore/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/hyprland";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs@{ self, nixpkgs, nixGL, home-manager, zen-browser, hyprland
    , catppuccin, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
          allowFreePredicate = (_: true);
        };
        overlays = [ inputs.nur.overlays.default ];
      };
    in {
      nixosConfigurations.niflheim = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/niflheim/configuration.nix
          ./core/bootloader.nix
          ./core/usb.nix
          ./core/internationalisation.nix
          ./core/fonts.nix
          ./core/virtualisation.nix
          ./core/bluetooth.nix
          ./core/ui.nix
          ./core/packages.nix
          ./core/gaming.nix
          ./core/user.nix
          ./core/nix.nix
          ./core/audio.nix
          ./core/display-manager.nix
          ./core/yubikey.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs; };
              users.matt.imports = [
                ./home-manager/home.nix
                ./home-manager/desktop.nix
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
      homeConfigurations = {
        workLaptop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };

          modules = [
            { home = { username = builtins.getEnv "USER"; }; }
            ./home-manager/home.nix
            ./home-manager/laptop.nix
          ];
        };

        shellOnly = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };

          modules = [
            { home = { username = builtins.getEnv "USER"; }; }
            ./home-manager/home.nix
          ];
        };
      };
    };
}
