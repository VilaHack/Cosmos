{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/C346-7F49";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/5117a881-7c60-4650-9229-55d000658542";
      fsType = "ext4";
    };
  };
}
