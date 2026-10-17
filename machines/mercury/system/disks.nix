{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/9BF9-315C";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/fbf48658-6544-4ea4-81e4-f51f3afff3f4";
      fsType = "ext4";
    };
  };
}
