{ inputs, ... }: {

  flake.nixosModules.generalServices =
# ================================================
  { config, ... }:
  
  {
  
  # Bluetooth.
    hardware.bluetooth.enable = true;

  # Battery and profiles
    services = {
      power-profiles-daemon.enable = true;
      upower.enable = true;
    };
  
  # Network
    networking.networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  };
# ================================================
}
