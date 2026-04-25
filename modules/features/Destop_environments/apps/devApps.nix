{ inputs, ... }: {

  flake.nixosModules.devApps =
# =================================================
  { config, pkgs, ... }:
  
    {
      environment.systemPackages = with pkgs; [

        # Development
        vscodium              # Code editor
        rpi-imager            # Raspberry Pi img installer
        arduino-ide           # Arduino IDE
        python3
    ];
  };

# =================================================
}
