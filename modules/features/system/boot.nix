{ inputs, ... }: {

  flake.nixosModules.bootLoader =

  # ================================================
  { config, pkgs, ... }: {

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

  };

  # ================================================
  flake.nixosModules.grub =
  
  # ================================================
  { config, pkgs, ... }: {
    boot.loader = {

      efi.canTouchEfiVariables = true;

      timeout = 6;

      grub = {
        enable = true;
        device = "nodev";
        # device = "/dev/disk/by-uuid/EDD3-63CF";
        efiSupport = true;
        useOSProber = true;
        # splashImage = ../img/grub.jpg;
      };
    };

  };

# ================================================
}
