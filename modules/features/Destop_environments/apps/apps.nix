{ inputs, ... }: {

  flake.nixosModules.apps =
# =================================================
  { config, pkgs, ... }:
  
    {
      environment.systemPackages = with pkgs; [
        
        # Internet browsers
        librewolf 
        firefox

        kitty                 # Terminal emulator
        nemo                  # File browser
        gthumb                # Image viewer
        haruna                # Video reproducer
        mpv                   # Video reproducer (Keyboard controled)
        pavucontrol           # Volume control
        wine                  # Windows application compatibility layer
        zathura               # Document reader
        # blender               # 3D/2D animator and editor
        proton-vpn            # VPN
        libreoffice-qt        # Office apps
        hardinfo2             # System benchmarks and hardware info
        onlyoffice-desktopeditors
        vesktop               # Discord but better

        # prismlauncher         # maincra


        libx11
        glib
        zlib
        libGL
        fontconfig
        freetype
        dbus
    ];
  };

# =================================================
}
