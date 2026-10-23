{
  services.nginx = {
    enable = true;

    virtualHosts."vilahack.com" = {
      root = "/var/www/landing";
    };
  };
}
