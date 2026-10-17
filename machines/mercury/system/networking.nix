{
  systemd.network.networks = {
    "public" = {
      name = "ens18";
      address = [ "147.83.13.7/27" ];
      gateway = [ "147.83.13.30" ];
      dns = [ "9.9.9.9" ];
    };

    "internal" = {
      name = "ens19";
      address = [ "10.1.0.1/16" ];
    };
  };

  networking = {
    hostName = "mercury";

    nat = {
      enable = true;
      externalInterface = "ens18";
      internalInterfaces = [
        "ens19"
      ];
    };

    firewall = {
      # This machine acts as the reverse proxy for all the web services. Open HTTP and HTTPs ports
      allowedTCPPorts = [
        80
        443
      ];

      # Wireguard listen port
      allowedUDPPorts = [ 51820 ];

      # Allow routing to the internal network from the VPN
      extraCommands = ''
        iptables -t nat -A POSTROUTING -o ens19 -j MASQUERADE
      '';
    };
  };

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
}
