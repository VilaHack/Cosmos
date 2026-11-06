{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/9BCD-4C52";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/5ae5fefa-455d-4a37-a231-503a6728e0f0";
      fsType = "ext4";
    };
  };
}
