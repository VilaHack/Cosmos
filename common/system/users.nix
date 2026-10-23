{
  users = {
    users.root = {
      hashedPassword = "!";
      shell = "/run/current-system/sw/bin/nologin";
    };

    groups.services = { };
  };
}
