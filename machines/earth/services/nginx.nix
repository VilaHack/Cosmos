{
  services.nginx.virtualHosts."vilahack.com" = {
    root = "/var/www/mail_assets";
    listen = [{
      addr = "10.1.0.3";
      port = 82;
    }];
  };
}
