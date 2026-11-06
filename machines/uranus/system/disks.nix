{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/TODO";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/TODO";
      fsType = "ext4";
    };
  };
}
