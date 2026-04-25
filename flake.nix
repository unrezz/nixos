{
  inputs = {
# • Nix packages.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
# • Flake parts.
    flake-parts.url = "github:hercules-ci/flake-parts";

# • Import tree.
    import-tree.url = "github:vic/import-tree";

# • Stylix.
#     stylix.url = "github:danth/stylix";

# • Wrapper modules.
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake
      { inherit inputs; }
      (inputs.import-tree ./modules);
}
