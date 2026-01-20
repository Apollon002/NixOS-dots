{
  description = "Apollon002's NixOS";

  inputs = {
    # Nix-Packages (rolling release)
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home-Manager (rolling release)
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Firefox Addons
    firefoxAddons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefoxAddons.inputs.nixpkgs.follows = "nixpkgs";

    # Dank Material Shell
    dms.url = "github:AvengeMedia/DankMaterialShell";
    dms.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      # For x86_64 systems
      systemAMD = "x86_64-linux";
      pkgsAMD = import nixpkgs {
        system = systemAMD;
        config.allowUnfree = true;
      };
    in

    {
      ### SILVERMOON ###
      nixosConfigurations.silvermoon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = systemAMD;
        pkgs = pkgsAMD;
        modules = [
          # Entry points for @silvermoon
          ./hosts/silvermoon/default.nix
          # System-wide modules
          ./modules/system
        ];
      };
      homeConfigurations."jannik@silvermoon" = home-manager.lib.homeManagerConfiguration {
        # Home-Manager requires a "pkgs"-instance
        pkgs = pkgsAMD;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          # Import user settings
          ./users/jannik/silvermoon.nix
          # user-wide modules
          ./modules/user
        ];
      };
    };
}
