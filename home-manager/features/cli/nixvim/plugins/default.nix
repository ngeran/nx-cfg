{
  lib,
  config,
  ...
}:
{
  imports = [
    ./comment.nix
    ./lsp.nix
    ./lualine.nix
    ./neo-tree.nix
    ./telescope.nix
    ./treesitter.nix
    ./markdown-preview.nix
    #./harpoon.nix
    ./neorg.nix
    ./startify.nix
    ./vimtex.nix
    ./floaterm.nix
    ./lazygit.nix
    ./startify.nix
  ];



  programs.nixvim = {

    plugins = {

     colorschemes.gruvbox.enable = true;
     
      # Lazy loading
      lz-n.enable = true;

      web-devicons.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      colorizer = {
        enable = true;
        settings.user_default_options.names = false;
      };

      oil = {
        enable = true;
        lazyLoad.settings.cmd = "Oil";
      };

      luasnip = {
        enable = true;
      };

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}
