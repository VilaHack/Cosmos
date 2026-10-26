{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/B3D1-1733";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/6d3fbf65-dd11-445e-a083-e332019c0753";
      fsType = "ext4";
    };
  };
}
