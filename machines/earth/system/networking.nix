{
  systemd.network.networks."internal".address = [ "10.1.0.3/16" ];

  networking = {
    hostName = "earth";

    firewall.allowedTCPPorts = [
      80 # Homer
      8002 # Kanboard
      8065 # Mattermost
      81 # Swagger
    ];
  };
}
