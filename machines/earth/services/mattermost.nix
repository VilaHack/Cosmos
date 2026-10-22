{ pkgs, ... }:

{
  # Cli for controlling the mattermost service
  environment.systemPackages = with pkgs; [ mmctl ];

  services.mattermost = {
    enable = true;

    # Downloaded from https://github.com/matterpoll/matterpoll/releases/tag/v1.9.2
    plugins = [ /etc/mattermost/com.github.matterpoll.matterpoll-1.9.2.tar.gz ];

    host = "0.0.0.0";
    siteName = "VilaXat";
    siteUrl = "https://chat.vilahack.com";
    socket = {
      enable = true;
      export = true;
      # use the env variable `MMCTL_LOCAL_SOCKET_PATH=/etc/mattermost/mattermost_local.socket`
      # so mmctl can find the socket
      path = "/etc/mattermost/mattermost_local.socket";
    };

    settings = {
      TeamSettings = {
        EnableCustomBrand = true;
        TeammateNameDisplay = "nickname_full_name";
        EnableLastActiveTime = false;
        EnableUserCreation = false;
      };

      SupportSettings = {
        ReportAProblemLink = "";
        ReportAProblemMail = "info@vilahack.com";
      };

      EmailSettings = {
        SendEmailNotifications = false;
      };

      ServiceSettings = {
        EnableLocalMode = true;
        EnableSVGs = true;
        EnableLatex = true;
        EnableInlineLatex = true;
      };

      PasswordSettings = {
        MinimumLength = 10;
        Lowercase = true;
        Uppercase = true;
        Number = true;
        Symbol = true;
      };
    };
  };
}
