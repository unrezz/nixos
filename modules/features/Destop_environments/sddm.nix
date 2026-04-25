{ inputs, ... }: {

  flake.nixosModules.sddm =

# ================================================
  { pkgs, config, lib, ... }:
  
  {
    services.displayManager.sddm = {
      enable = lib.mkDefault true;
      wayland.enable = true;
      package = lib.mkDefault pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
  
      extraPackages = with pkgs; [
        sddm-astronaut
        # kdePackages.qtvirtualkeyboard
        kdePackages.qtmultimedia
        kdePackages.qtsvg
      ];
    };
  
    environment.systemPackages = with pkgs; [ sddm-astronaut ];
  
  };

# ================================================
}
