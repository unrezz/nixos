{ inputs, ... }: {

  flake.nixosModules.tty =

# ================================================
  { config, pkgs, ... }: {

    # Deactivate the nano package.
    programs.nano.enable = false;

    # Installs and makes zsh the deafault shell.
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
    environment.shells = [ pkgs.zsh ];

    # Packages to install.
    environment.systemPackages = with pkgs; [
      kitty
      zsh
      neovim
      git
      yazi
      btop
      bat
      tree
      termusic
      yt-dlp
      fastfetch
    ];
  };

# ================================================
}
