{
  description = "nixmaker derives all NixOS hosts from a flake and compresses the resulting files";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "nixmaker";
          src = self;

          buildInputs = with pkgs; [ jq ];

          patchPhase = ''
            ${pkgs.patsh}/bin/patsh --force ./nixmaker
          '';

          installPhase = ''
            mkdir -p $out/bin
            mkdir -p $out/share
            install -Dm555 nixmaker $out/bin/
            install -Dm444 LICENSE $out/share/
            install -Dm444 README.md $out/share/
          '';
        };
      }
    );
}
