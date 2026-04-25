{ self, inputs, ... }:  {

  perSystem = { pkgs, ... }: {
    packages.noctalia-shell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
# after finishing customizing the shell, run the next command:
# $ nix run nixpkgs#noctalia-shell \
#       ipc call state all > ~/nixos/modules/features/noctalia.json 
      settings = {};
      # (builtins.fromJSON
      #   (builtins.readFile ./noctalia.json)).settings;
    };
  };
}
