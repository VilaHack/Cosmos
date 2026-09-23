{
  systemd.network = {
    enable = true;

    networks = {
      "lithium" = {
        name = "ens18";
        address = [ "10.1.0.3/16" ];
        gateway = [ "10.1.0.1" ];
        dns = [ "9.9.9.9" ];
      };
    };
  };

  boot.initrd.systemd.network.enable = true;

  networking = {
    hostName = "lithium";
    useDHCP = false;
    useNetworkd = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [
        80 # Homer
        8002 # Kanboard
        8065 # Mattermost
        81 # Swagger
      ];
    };
  };
}
