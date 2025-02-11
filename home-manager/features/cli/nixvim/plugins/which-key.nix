{
  programs.nixvim = {
  plugins.which-key = {
    enable = true;
    options = {
      plugins = {
        marks = true;
        registers = true;
      };
    };
  };
};
}