{ inputs, ... }: {

  flake.nixosModules.mainUser =

# ================================================
  { lib, config, pkgs, ... }:
  
  let
    cfgm = config.mainUser;
  in
  {
    #  Main user module
    options.mainUser = {
      enable = lib.mkEnableOption "Enable mainUser module";

      userName = lib.mkOption {
        default = "unrezz";
      };

    };

    # Main user config
    config = lib.mkIf cfgm.enable {
      users.users.${cfgm.userName} = {
        isNormalUser = true;
        initialPassword = "1234";
        description = "${cfgm.userName}";
        shell = pkgs.zsh;
        extraGroups = [ "networkmanager" "wheel" "dialout" ];
      };
    };
  };

# ================================================
  flake.nixosModules.altUser =

# ================================================
  { lib, config, pkgs, ... }:
  
  let
    cfga = config.altUser;
  in
  {

    # Alt user module
    options.altUser = {
      enable = lib.mkEnableOption "Enable altUser module";

      userName = lib.mkOption {
        default = "Kat";
      };

    };

    # Alt user config
    config = lib.mkIf cfga.enable {
      users.users.${cfga.userName} = {
        isNormalUser = true;
        initialPassword = "1234";
        description = "${cfga.userName}";
        shell = pkgs.zsh;
        extraGroups = [ "networkmanager" "wheel"];
      };
    };

  };
# ================================================
}
