{
  systemd.network = {
    enable = true;

    networks = {
      "beryllium" = {
        name = "ens18";
        address = [ "10.1.0.4/16" ];
        gateway = [ "10.1.0.1" ];
        dns = [ "9.9.9.9" ];
      };
    };
  };

  boot.initrd.systemd.network.enable = true;

  networking = {
    hostName = "beryllium";
    useDHCP = false;
    useNetworkd = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [
        8001
      ];
    };
  };
}
