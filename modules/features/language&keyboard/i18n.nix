{ inputs, ... }: {

  flake.nixosModules.i18n =
# ================================================
  { config, pkgs, ... }:
  
  {
  # Time zone.
    time.timeZone = "America/Mexico_City";

    console.keyMap = "uk";

  # Select internationalisation properties.
    i18n = {

      defaultLocale = "es_MX.UTF-8";

      extraLocaleSettings = {
        LANG = "ja_JP.UTF-8";
        # LANG = "en_US.UTF-8";
        LC_ADDRESS = "es_MX.UTF-8";
        LC_IDENTIFICATION = "es_MX.UTF-8";
        LC_MEASUREMENT = "es_MX.UTF-8";
        LC_MONETARY = "es_MX.UTF-8";
        LC_NAME = "es_MX.UTF-8";
        LC_NUMERIC = "es_MX.UTF-8";
        LC_PAPER = "es_MX.UTF-8";
        LC_TELEPHONE = "es_MX.UTF-8";
        LC_TIEM = "es_MX.UTF-8";
      };

      inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
        ];
      };
    };

  };
# ================================================
}
