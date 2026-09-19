{ config, ... }:

{
  security.acme = {
    acceptTerms = true;
    defaults.email = "acme@vilahack.com";

    certs."vilahack.com" = {
      group = config.services.nginx.group;

      dnsProvider = "cloudflare";
      environmentFile = "/etc/acme/cloudflare";

      extraDomainNames = [
        # Internal tools
        "chat.vilahack.com"
        "docs.api.vilahack.com"
        "hub.vilahack.com"
        "kanban.vilahack.com"
      ];
    };
  };
}
