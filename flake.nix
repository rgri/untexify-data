{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/";

  outputs = { self, nixpkgs, flake-utils }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        system = "x86_64-linux";
      in {
        devShells.default = pkgs.mkShell {

          LD_LIBRARY_PATH = nixpkgs.lib.makeLibraryPath [
            pkgs.gcc-unwrapped.lib
            pkgs.libglvnd
            pkgs.glib
            # Only necessary for transform.py
            pkgs.zlib
          ];
          #TODO: Package tex2svg (github:yannikschaelte/tex2svg) and declare it here
          #BUG: 1d0f74df-8115-4a4c-998d-ae13caad50ef
          packages = [ pkgs.pdf2svg pkgs.inkscape pkgs.aws-crt-cpp ];
          shellHook = ''
            export PATH=$PATH:~/bin
          '';
        };
      });
}
