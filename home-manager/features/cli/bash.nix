{ config, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
