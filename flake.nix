{
  description = "CMake utility toolbox";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        jrl-cmakemodules = pkgs.stdenv.mkDerivation (
          finalAttrs: {
            name = "jrl-cmakemdules";
            src = pkgs.nix-gitignore.gitignoreSource [ ./.nixignore ] ./.;
            nativeBuildInputs = [ pkgs.cmake ];
          }
        );
      in
      {
        packages.default = jrl-cmakemodules;
        devShells.default = pkgs.mkShell { inputsFrom = [ jrl-cmakemodules ]; };
      }
    );
}
