{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/";

  outputs = { self, nixpkgs, flake-utils, poetry2nix }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        system = "x86_64-linux";
      in {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.pdf2svg ];
          shellHook = "echo 'use flake .'> ./.envrc && direnv allow";
        };
      });
}
