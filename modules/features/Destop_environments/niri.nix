{ inputs, self, ... }: {

  flake.nixosModules.niri = { pkgs, lib, ... }: {

    imports = [
      self.nixosModules.sddm
      self.nixosModules.apps
    ];

    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

  };

# =================================================================================================
  perSystem = { pkgs, config, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;

      # Configuration =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
      settings = let
        noctaliaExe = lib.getExe self'.packages.noctalia-shell;
      in {

        gestures.hot-corners.top-right = null;

        # Random config ---------------------------------------------------------------------------
        spawn-at-startup = [ noctaliaExe ];

        prefer-no-csd = null;

        screenshot-path = "~/画像/Screenshots/Screenshot_from_%Y-%m-%d_%H-%M-%S.png";

        window-rule.open-maximized = true;

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        # inputs config ---------------------------------------------------------------------------
        input = {
          focus-follows-mouse = null;
          # warp-mouse-to-focus = null;

          keyboard = {
            track-layout = "global";

            repeat-delay = 600;
            repeat-rate = 25;
            
            xkb = {
              layout = "gb,es,ru";
              options = "grp:alt_shift_toggle"; #"grp:alt_shift_toggle,caps:escape";
            };
          };

          touchpad = {
            tap = null;
            dwt = null;
          };

          mouse.accel-profile = "flat";
        };

        # Layout config ---------------------------------------------------------------------------
        layout = {
          gaps = 4;
          # always-center-single-column = null;
          background-color = "#222244";

          focus-ring = {
            off = null; # I like it, but it disables transparency
          };

          border = {
            off = null;
          };

          shadow.off = null;

          insert-hint.off = null;
        };

        # Binds -----------------------------------------------------------------------------------
        binds = {

          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;

          # Noctalia Shell keybinds
          "Mod+A".spawn-sh =        "${noctaliaExe} ipc call controlCenter toggle ";
          "Mod+Space".spawn-sh =    "${noctaliaExe} ipc call launcher toggle";
          "Ctrl+Shift+L".spawn-sh = "${noctaliaExe} ipc call lockScreen lock";
          "Mod+Shift+2".spawn-sh =  "${noctaliaExe} ipc call brightness decrease";
          "Mod+Shift+3".spawn-sh =  "${noctaliaExe} ipc call brightness increase";

          "Mod+Shift+1".spawn-sh = noctaliaExe;

          "Mod+U".show-hotkey-overlay = null;

          "Mod+Shift+A".switch-layout = "next";

          "Mod+S".screenshot = null;
          "Mod+Shift+S".screenshot-screen = null;
          "Mod+E".screenshot-window = null;

          "Mod+Q".close-window = null;
          "Mod+Shift+M".quit = null;

          "Mod+F".maximize-column = null;
          "Mod+Shift+D".fullscreen-window = null;
          "Mod+D".toggle-windowed-fullscreen = null;
          "Mod+Shift+V".toggle-window-floating = null;
          "Mod+V".switch-focus-between-floating-and-tiling = null;
          "Mod+C".center-column = null;

          "Mod+W".toggle-overview = null;

          "Mod+H".focus-column-left = null;
          "Mod+L".focus-column-right = null;
          "Mod+K".focus-workspace-up = null;
          "Mod+J".focus-workspace-down = null;
          # "Mod+K".focus-window-up = null;
          # "Mod+J".focus-window-down = null;

          "Mod+Ctrl+H".move-column-left = null;
          "Mod+Ctrl+L".move-column-right = null;
          "Mod+Ctrl+K".move-column-to-workspace-up = null;
          "Mod+Ctrl+J".move-column-to-workspace-down = null;

          # "Mod+V".spawn-sh = ''${config.pkgs.alsa-utils}/bin/amixer sset Capture toggle'';

          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";

          "Mod+Shift+H".set-column-width = "-5%";
          "Mod+Shift+L".set-column-width = "+5%";
          "Mod+Shift+J".set-window-height = "+5%";
          "Mod+Shift+K".set-window-height = "-5%";

          # "Mod+Ctrl+S".spawn-sh = ''${lib.getExe config.pkgs.grim} -l 0 - | ${config.pkgs.wl-clipboard}/bin/wl-copy'';
          #
          # "Mod+Shift+E".spawn-sh = ''${config.pkgs.wl-clipboard}/bin/wl-paste | ${lib.getExe config.pkgs.swappy} -f -'';
          #
          # "Mod+Shift+S".spawn-sh = lib.getExe (config.pkgs.writeShellApplication {
          #   name = "screenshot";
          #   text = ''
          #     ${lib.getExe config.pkgs.grim} -g "$(${lib.getExe config.pkgs.slurp} -w 0)" - \
          #     | ${config.pkgs.wl-clipboard}/bin/wl-copy
          #   '';
          # });

          # "Mod+R".spawn-sh = self.mkWhichKeyExe config.pkgs [
          #   {
          #     key = "b";
          #     desc = "Bluetooth";
          #     cmd = "${noctaliaExe} ipc call bluetooth togglePanel";
          #   }
          #   {
          #     key = "w";
          #     desc = "Wifi";
          #     cmd = "${noctaliaExe} ipc call wifi togglePanel";
          #   }
          #   {
          #     key = "l";
          #     desc = "Librewolf web browser";
          #     cmd = "librewolf";
          #   }
          #   {
          #     key = "d";
          #     desc = "Discord";
          #     cmd = "vesktop";
          #   }
          #   {
          #     key = "m";
          #     desc = "Youtube Music";
          #     cmd = "pear-desktop";
          #   }
          #   {
          #     key = "s";
          #     desc = "Pavucontrol";
          #     cmd = "${lib.getExe pkgs.pavucontrol}";
          #   }
          # ];
        };

      };

    };
  };

# =================================================================================================
}
