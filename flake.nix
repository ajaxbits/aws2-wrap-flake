{
  description = "aws2-wrap flake";

  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
    nixpkgs.follows = "dream2nix/nixpkgs";
  };

  outputs = inputs @ {
    dream2nix,
    nixpkgs,
    ...
  }: let
    system = "aarch64-darwin";
  in {
    packages.${system}.default = dream2nix.lib.evalModules {
      packageSets.nixpkgs = inputs.dream2nix.inputs.nixpkgs.legacyPackages.${system};
      modules = [
        ./default.nix
        {
          paths = {
            projectRoot = ./.;
            projectRootFile = "flake.nix";
            package = ./.;
          };
        }
      ];
    };
  };
}
