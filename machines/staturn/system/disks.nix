{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/C339-909D";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/" = {
      device = "/dev/disk/by-uuid/ee46cd0e-7b6b-4305-9e63-b0112e61c99e";
      fsType = "ext4";
    };
  };
}
