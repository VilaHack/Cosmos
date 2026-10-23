{
  # Swagger-ui is not packaged for NixOS because it's a simple static website.
  #
  # Deploying it with nginx is trivial:
  # https://swagger.io/docs/open-source-tools/swagger-ui/usage/installation/#plain-old-htmlcssjs-standalone
  #
  # To download from github (replace <GIT_TAG>):
  # curl -Lo swagger-ui.tar.gz https://github.com/swagger-api/swagger-ui/archive/refs/tags/<GIT_TAG>
  services.nginx.virtualHosts."docs.api.vilahack.com" = {
    root = "/var/www/swagger-ui"; # nginx will look for swagger-ui on this directory.
    listen = [
      {
        addr = "10.1.0.3";
        port = 81;
      }
    ];
  };
}
