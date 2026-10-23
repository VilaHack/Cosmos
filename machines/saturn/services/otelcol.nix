{ pkgs, ... }:

{
  services.opentelemetry-collector = {
    enable = true;
    package = pkgs.opentelemetry-collector-contrib;

    settings = {
      receivers = {
        otlp.protocols.grpc.endpoint = "0.0.0.0:4317";

        mongodb = {
          collection_interval = "15s";

          tls = {
            insecure = true;
            insecure_skip_verify = true;
          };

          hosts = [
            {
              endpoint = "10.1.0.5:27017";
            }
          ];

          # username = "TODO";
          # password = "TODO";
        };
      };

      processors.batch = {
        timeout = "5s";
        send_batch_size = 1024;
      };

      exporters = {
        prometheus.endpoint = "0.0.0.0:9000";
        "otlp_http/loki".endpoint = "http://localhost:3100/otlp";
      };

      service.pipelines = {
        metrics = {
          receivers = [
            "otlp"
            "mongodb"
          ];
          processors = [ "batch" ];
          exporters = [ "prometheus" ];
        };

        logs = {
          receivers = [ "otlp" ];
          processors = [ "batch" ];
          exporters = [ "otlp_http/loki" ];
        };
      };
    };
  };
}
