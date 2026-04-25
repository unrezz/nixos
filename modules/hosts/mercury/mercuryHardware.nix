{ inputs, ... }: {

  flake.nixosModules.mercuryHardware =
# ========================================
  { config, lib, pkgs, modulesPath, ... }:
  
  {
    imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];
  
    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];
  
    fileSystems."/" =
      { device = "/dev/disk/by-uuid/3bc2ac74-8f4d-4b1f-a569-b332613a0c2b";
        fsType = "ext4";
      };
  
    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/0828-0B88";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };
  
    swapDevices =
      [ { device = "/dev/disk/by-uuid/6a5d5629-4b24-485c-867b-169278d42ba3"; }
      ];
  
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

# ================================================
}
