{ pkgs, ... }:

{
  services.opentelemetry-collector = {
    enable = true;
    package = pkgs.opentelemetry-collector-contrib;

    settings = {
      receivers.otlp.protocols.grpc.endpoint = "0.0.0.0:4317";

      processors = {
        batch = {
          timeout = "1m";
          send_batch_size = 1024;
        };

        resource.attributes = [
          {
            key = "service.environment";
            value = "production";
            action = "upsert";
          }
        ];
      };

      exporters = {
        prometheus.endpoint = "0.0.0.0:9000";
        "otlp_http/loki".endpoint = "http://localhost:3100/otlp";
      };

      service.pipelines = {
        metrics = {
          receivers = ["otlp"];
          processors = ["batch" "resource"];
          exporters = ["prometheus"];
        };

        logs = {
          receivers = ["otlp"];
          processors = ["batch" "resource"];
          exporters = ["otlp_http/loki"];
        };
      };
    };
  };
}
