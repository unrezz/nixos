{ inputs, ... }: {

  flake.nixosModules.style =
# ================================================

  { pkgs, ... }:
  
  {
    # stylix = { 
    #   enable = true;
    #   image = ../../img/wallhaven-4.png;
    #   base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    # };
  
    environment.systemPackages = with pkgs; [
      # Theme switcher. (doesn't get along home-manager)
      nwg-look
      # Gtk themes.
      omni-gtk-theme
      rose-pine-gtk-theme
      lavanda-gtk-theme
      # Icon themes.
      nordzy-icon-theme
      arashi
      rose-pine-icon-theme
      # Cursor themes.
      # bibata-cursors
      rose-pine-cursor
    ];
  
  };
# ================================================
}
