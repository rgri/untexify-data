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
          #TODO: Package tex2svg (github:yannikschaelte/tex2svg) and declare it here
          #BUG: 1d0f74df-8115-4a4c-998d-ae13caad50ef
          packages = [ pkgs.pdf2svg pkgs.inkscape ];
          shellHook = ''
            export PATH=$PATH:~/bin
          '';
        };
      });
}
