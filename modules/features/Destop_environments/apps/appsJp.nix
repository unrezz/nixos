{ inputs, ... }: {

  flake.nixosModules.appsJp =
# =================================================
  { config, pkgs, ... }:
  
    {
      environment.systemPackages = with pkgs; [
        
        mullvad-browser       # Internet browser

        obs-studio            # Video recorder
        appimage-run          # Autoexplanatory, needed to run ".AppImage" and ".ISO" apps
        anki                  # Flash cards
    ];
  };

# =================================================
}
