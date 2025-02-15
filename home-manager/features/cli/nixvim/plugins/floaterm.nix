{
  programs.nixvim = {
    plugins.floaterm = {
      enable = true;

      settings = {
       open_mapping = "[[<C-,>]]";
      };
    };
    
  };
}
