let
  regularUsers = lib.attrNames (lib.filterAttrs (_: user: user.isNormalUser) config.users.users);
in
{
  security = {
    sudo.enable = false;

    doas = {
      enable = true;
      # Enable doas for users that exist on the specific machine
      extraRules = lib.optional (regularUsers != [ ]) {
        users = regularUsers;
        keepEnv = true;
        persist = true;
      };
    };
  };
}
