{ inputs, self, ... }: {

  flake.nixosConfigurations.mercury = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mercury
    ];
  };
  
  # <=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=><=>
  flake.nixosModules.mercury =

  # ================================================================================================
  { config, pkgs, ... }:
  
  {
  # The following modules are the ones available:
  # apps, bootLoader / grub , connections, extra, fonts, gaming, i18n, mainUser, altUser, style, tty, vm, xserver, niri.
    imports =
      [
        self.nixosModules.apps
        self.nixosModules.appsJp
        self.nixosModules.devApps
        # self.nixosModules.bootLoader
        self.nixosModules.grub
        self.nixosModules.generalServices
        self.nixosModules.fonts
        self.nixosModules.gaming
        self.nixosModules.i18n
        self.nixosModules.mainUser
        self.nixosModules.altUser
        self.nixosModules.style
        self.nixosModules.tty
        self.nixosModules.vm
        self.nixosModules.xserver
        self.nixosModules.niri

        self.nixosModules.mercuryHardware # 「必要」
      ];

    # home manager download
    environment = {
      shells = [ pkgs.zsh ];
      systemPackages = [ pkgs.home-manager ];
    };

    # Hostname
    networking.hostName = "mercury";

    # Main user config
    mainUser.enable = true;
    mainUser.userName = "unrezz";

    # Alt user config
    altUser.enable = false;
    altUser.userName = "Undisturbed_Cataphractus";

    # Non Steam games
    # under development

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
  
    # Flatpak.
    services.flatpak.enable = false;
    # To finish setting up flatpak, you need to execute the following comand:
    # ~$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  
    # System version.
    system.stateVersion = "25.11"; # Avoid changing if unnecessary

    # Experimental features
    nix.settings.experimental-features = [ "nix-command" "flakes"  ];

  };

  # ================================================================================================
}
