{
  services = {
    grafana = {
      enable = true;
      settings = {
        security.secret_key = "SW2YcwTIb9zpOOhoPsMm";
        server = {
          http_addr = "10.1.0.6";
          http_port = 8005;
          enable_gzip = true;
        };
      };
    };
  };
}
