{
  imports = [
    ./pol-epsevg.nix
  ];

  users = {
    users.root.hashedPassword = "!";

    groups = {
      services = { };
    };
  };
}
