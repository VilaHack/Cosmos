{ pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot = {
    loader.systemd-boot.enable = true;

    kernelPackages = pkgs.linuxPackages_latest;
    initrd.availableKernelModules = [
      "ata_piix"
      "uhci_hcd"
      "virtio_pci"
      "virtio_scsi"
      "sd_mod"
      "sr_mod"
    ];
  };
}
