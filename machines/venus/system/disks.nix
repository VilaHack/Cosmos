{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/F617-61F0";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/3ff09a99-482d-483b-baa2-58887457783e";
      fsType = "ext4";
    };
  };
}
