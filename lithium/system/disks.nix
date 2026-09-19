{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/5112-6DF3";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/5be5ee11-e3d7-4a76-82d3-56f17bf1ac76";
      fsType = "ext4";
    };
  };
}
