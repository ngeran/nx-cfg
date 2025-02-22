{
  virtualisation.docker = {
    enable = true;
    users.users.nikos = {
    isNormalUser = true;
    extraGroups = [ "docker" ]; # Add to docker group
  };
}
}