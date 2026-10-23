{
  systemd.network.networks."internal".address = [ "10.1.0.5/16" ];

  networking = {
    hostName = "jupiter";

    firewall.allowedTCPPorts = [
      27017 # MongoDB
    ];
  };
}
