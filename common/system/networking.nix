{ config, lib, ... }:

{
  systemd.network = {
    enable = true;

    networks = {
      # mercury acts as a router so the internal network is defined differently
      "internal" = lib.mkIf (config.networking.hostName != "mercury") {
        name = "ens18";
        gateway = [ "10.1.0.1" ];
        dns = [ "9.9.9.9" ];
      };
    };
  };

  boot.initrd.systemd.network.enable = true;

  networking = {
    useDHCP = false;
    useNetworkd = true;

    firewall.enable = true;
  };
}
