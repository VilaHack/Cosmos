{
  services.homer = {
    enable = true;
    virtualHost = {
      nginx.enable = true;
      domain = "hub.vilahack.com";
    };

    settings = {
      title = "Serveis interns de la VilaHack";
      documentTitle = "VilaHack - Serveis";
      footer = "";

      defaults = {
        colorTheme = "dark";
        layout = "list";
      };

      services = [
        {
          items = [
            {
              name = "Xat";
              subtitle = "Mattermost";
              icon = "fas fa-message";
              url = "https://chat.vilahack.com";
            }

            {
              name = "Taulell kanban";
              subtitle = "Kanboard";
              icon = "fas fa-calendar-days";
              url = "https://kanban.vilahack.com";
            }

            {
              name = "Documentació de l'API";
              subtitle = "Swagger";
              icon = "fas fa-globe";
              url = "https://docs.api.vilahack.com";
            }

            {
              name = "Observabilitat";
              subtitle = "Grafana";
              icon = "fas fa-chart-line";
              url = "https://grafana.vilahack.com";
            }
          ];
        }
      ];
    };
  };
}
