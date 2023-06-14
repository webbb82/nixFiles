{
description = "My awesome system config of the damned";

inputs = {
nixpkgs.url = "nixpkgs/nixos-20.09";
home-manager.url = "github:nix-community/home-manager/release-20.09";
home.manager.inputs.nixpkgs.follow = "nixpkgs";
};
 
 outputs = { nixpkgs, home-manager, ... }: 
let
   system = "x86_64-linux";

pkgs = import nixpkgs {
    inherit system;
    config = { allowUnfree = true;  };

};

lib = nixpkgs.lib;

in {
    nixosConfigurations = {
        nixos = lib.nixosSystem {
            inherit system;
    
    modules = [
        ./system/configuration.nix
    ];
   };
  };

};
}