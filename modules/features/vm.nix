{ inputs, ... }: {

  flake.nixosModules.vm =

# ================================================
  { config, pkgs, ... }:
  
  {
  
  # Enable dconf (System Management tool).
    programs = {
      dconf.enable = true;
      virt-manager.enable = true;
    };
  
  # Add user to libvirtd group.
    users = {
      groups.libvirtd.members = [ "unrezz" ];
      users.unrezz.extraGroups = [ "libvirtd" ];
    };
  
  # Install necesary packages.
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      adwaita-icon-theme
  
      # virtio-win
      # win-spice
    ];
  
  # Management of virtualization services.
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          # ovmf = {
          #   enable = true;
            # packages = [ pkgs.OVMMFull.fd ];
          # };
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
  
  };

# ================================================
}
