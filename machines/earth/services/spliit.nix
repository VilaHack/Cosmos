{ pkgs, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";

    containers = {
      # I know there's already a postgres instance in this machine but honestly I don't trust this app
      postgres = {
        image = "postgres:17.3";

        autoStart = true;

        environment = {
          POSTGRES_USER = "spliit";
          POSTGRES_PASSWORD = "spliit";
          POSTGRES_DB = "spliit";
        };

        volumes = [ "/var/lib/spliit/database/data:/var/lib/postgresql/data" ];
	    networks = [ "spliit" ];
      };

      spliit = {
        image = "ghcr.io/spliit-app/spliit:latest";

        autoStart = true;
        dependsOn = [ "postgres" ];

        environment = {
          POSTGRES_PRISMA_URL = "postgresql://spliit:spliit@postgres:5432/spliit";
          POSTGRES_URL_NON_POOLING = "postgresql://spliit:spliit@postgres:5432/spliit";
        };

        ports = [ "83:3000/tcp" ];

        volumes = [ "/var/lib/spliit/app/cache:/usr/app/.next/cache" ];
	networks = [ "spliit" ];
      };
    };
  };


  systemd = {
    tmpfiles.rules = [
      "d /var/lib/spliit/database/data 0755 root root -"
      "d /var/lib/spliit/app/cache     0770 spliit services -"
    ];

    # These services ensure the spliit network exist and that the containers are started in order
    services = {
      "podman-network-spliit" = {
        path = [ pkgs.podman ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = "podman network inspect spliit >/dev/null 2>&1 || podman network create spliit";
        wantedBy = [ "multi-user.target" ];
      };

      "podman-postgres" = {
        after = [ "podman-network-spliit.service" ];
        requires = [ "podman-network-spliit.service" ];
      };

      "podman-spliit" = {
        after = [ "podman-network-spliit.service" ];
        requires = [ "podman-network-spliit.service" ];
      };
    };
  };
}
