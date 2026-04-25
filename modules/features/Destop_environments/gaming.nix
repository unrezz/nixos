{ inputs, ... }: {

  flake.nixosModules.gaming =

# ================================================
  { config, pkgs, ... }: {
  
    programs = {

      steam = {
        enable = true;
        gamescopeSession.enable = true;
      };

      gamemode.enable = true;

    };
    
    environment = {

      sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOL_PATHS = 
          "$HOME/.steam/root/compatibilitytools.d/";
      };

      systemPackages = with pkgs; [
        mangohud
        protonup-ng
      ];
    };
  };

# ================================================
}
