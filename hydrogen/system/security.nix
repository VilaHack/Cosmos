{
  security = {
    sudo.enable = false;

    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "pol-epsevg" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
