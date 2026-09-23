{
  systemd.network = {
    enable = true;

    networks = {
      "helium" = {
        name = "ens18";
        address = [ "10.1.0.2/16" ];
        gateway = [ "10.1.0.1" ];
        dns = [ "9.9.9.9" ];
      };
    };
  };

  boot.initrd.systemd.network.enable = true;

  networking = {
    hostName = "helium";
    useDHCP = false;
    useNetworkd = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [
      ];
    };
  };
}
