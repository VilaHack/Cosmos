{
  services = {
    grafana = {
      enable = true;
      settings.server = {
        http_addr = "127.0.0.1";
        http_port = 8005;
        enable_gzip = true;
      };
    };
  };
}
