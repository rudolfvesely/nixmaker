{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations =
      builtins.listToAttrs
        (map
          (name:
            {
              inherit name;
              value = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                  ./configuration.nix
                  { config.networking.hostName = name; }
                ];
              };
            })
          [ "first" "second" "third" ]);
  };
}
