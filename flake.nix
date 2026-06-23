{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    opencode = {
      url = "github:anomalyco/opencode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agent-skills-nix = {
      url = "github:Kyure-A/agent-skills-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-system-graphics = {
      url = "github:soupglasses/nix-system-graphics";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pam-shim = {
      url = "github:Cu3PO42/pam_shim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #Agent skill repos
    anthropic-skills = {
      url = "github:anthropics/skills";
      flake = false;
    };
    caveman = {
      url = "github:JuliusBrussee/caveman";
      flake = false;
    };
    vercel-skills-cli = {
      url = "github:vercel-labs/skills";
      flake = false;
    };

    nixpkgs-patcher = {
      url = "github:gepbird/nixpkgs-patcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #    nixpkgs-patch-493590 = {
    #      url = "https://github.com/NixOS/nixpkgs/pull/493590.patch";
    #      flake = false;
    #    };
  };

  outputs =
    inputs@{
      nixpkgs,
      system-manager,
      nix-system-graphics,
      home-manager,
      catppuccin,
      dms,
      dms-plugin-registry,
      agent-skills-nix,
      nixpkgs-patcher,
      helium,
      pam-shim,
      ...
    }:
    let
      system = "x86_64-linux";
      patchedNixpkgs = nixpkgs-patcher.lib.patchNixpkgs { inherit inputs system; };
      pkgs = import patchedNixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [
          helium.overlays.default
          inputs.nur.overlays.default
        ];
      };
    in
    {
      nixosConfigurations.niflheim = import "${patchedNixpkgs}/nixos/lib/eval-config.nix" {
        inherit system;
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
          ./core/printing.nix
          ./core/obs.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          dms.nixosModules.dank-material-shell
          dms-plugin-registry.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit inputs;
              };
              users.matt.imports = [
                ./home-manager/home.nix
                ./home-manager/desktop.nix
                catppuccin.homeModules.catppuccin
                dms.homeModules.dank-material-shell
                dms-plugin-registry.homeModules.default
                helium.homeModules.default
                agent-skills-nix.homeManagerModules.default
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
            {
              home = {
                username = builtins.getEnv "USER";
              };
            }
            ./home-manager/home.nix
            ./home-manager/laptop.nix
            ./home-manager/modules/nixcfg.nix
            helium.homeModules.default
            catppuccin.homeModules.catppuccin
            agent-skills-nix.homeManagerModules.default
            dms.homeModules.dank-material-shell
            dms-plugin-registry.homeModules.default
            pam-shim.homeModules.default
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
            ./home-manager/modules/nixcfg.nix
            catppuccin.homeModules.catppuccin
            agent-skills-nix.homeManagerModules.default
          ];
        };
      };
      systemConfigs.workLaptop = system-manager.lib.makeSystemConfig {
        modules = [
          nix-system-graphics.systemModules.default
          {
            config = {
              nixpkgs.hostPlatform = system;
              system-manager.allowAnyDistro = true;
              system-graphics.enable = true;
            };
          }
        ];
      };
    };
}
