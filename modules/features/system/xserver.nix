{ inputs, ... }: {

  flake.nixosModules.xserver =
# ================================================
  { config, ... }:
  
  {
  
    # xserver thing that I don't understand.
    services.xserver = {
      videoDrivers = ["amdgpu"];
      xkb = {
        layout = "es";
        variant = "";
      };
    };
  
  };
# ================================================
}
