{
  systemd.network.networks = {
    "internal".address = [ "10.1.0.8/16" ];

    "upc_intranet" = {
      name = "ens19";
      address = [ "10.5.157.24/28" ];
      gateway = [ "10.5.157.30" ];
      dns = [ "9.9.9.9" ];
    };
  };

  networking = {
    hostName = "neptune";
  };
}
