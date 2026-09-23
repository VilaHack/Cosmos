{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/1C5E-2975";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/95c0ef52-41a8-4c85-8a74-afa6c06cd7f7";
      fsType = "ext4";
    };
  };
}
