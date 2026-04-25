{ inputs, ... }: {

  flake.nixosModules.fonts = 

# ================================================
  { config, pkgs, ... }:
  
  {

    console.font = "Nerd-fonts.Agave";

    fonts.packages = with pkgs; [
      nerd-fonts.agave
      nerd-fonts.commit-mono
      nerd-fonts.iosevka
      takao
    ];

    fonts.fontconfig.defaultFonts = {
      monospace = [
        "Agave Nerd Font Mono"
        "IPAGothic"
      ];

      sansSerif = [
        "Agave Nerd Font"
        "IPAPGothic"
      ];

      serif = [
        "Agave Nerd Font"
        "IPAPMincho"
      ];
    };

  };

# ================================================
}
