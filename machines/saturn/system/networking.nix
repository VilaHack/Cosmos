{
  systemd.network.networks."internal".address = [ "10.1.0.5/16" ];

  networking = {
    hostName = "boron";

    firewall.allowedTCPPorts = [
      27017
    ];
  };
}
