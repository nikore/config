{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ...}: let 
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
        allowFreePredicate = (_: true);
      };
    };
  in {
    homeConfigurations = {
      desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
          {
            home = {
              username = builtins.getEnv "USER";
            };
          }
          ./home-manager/home.nix
          ./home-manager/desktop.nix
        ];        
      };

      workLaptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
          {
            home = {
              username = builtins.getEnv "USER";
            };
          }
          ./home-manager/home.nix
          ./home-manager/laptop.nix
        ];
      };

      shellOnly = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };

        modules = [
          {
            home = {
              username = builtins.getEnv "USER";
            };
          }
          ./home-manager/home.nix
        ];
      };
    };
  };
}
