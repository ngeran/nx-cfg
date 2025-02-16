{
  pkgs,
  config,
  ...
}:
{
  home = {
    packages = with pkgs; [
      # Python packages
      (python3.withPackages (pypkgs: with pypkgs; [
        pip
        requests
        setuptools
        matplotlib
        numpy
        torch
        jinja2
        types-jinja2
        types-pyyaml
        types-requests
        pyyaml
        flask
        junos-eznc
        mypy
      ]))

    ];

    # Mypy cache directory
    sessionVariables.MYPY_CACHE_DIR = "${config.xdg.cacheHome}/mypy";
    
  };

  # Program configurations
  programs = {
    ruff = {
      enable = true;

      settings = {
        line-length = 100;
      };
    };

    nixvim = {
      filetype.extension.gin = "gin"; # inria
      files."after/ftplugin/python.lua" = {
        autoCmd = [
          {
            event = "BufWritePre";
            callback.__raw = ''
              function()
                vim.lsp.buf.code_action {
                  context = {only = {"source.fixAll.ruff"}},
                  apply = true
                }
              end
            '';
          }
        ];
      };
      plugins = {
        treesitter.languageRegister.python = [ "gin" ]; # inria
        lsp.servers = {
          ruff.enable = true;
          pylsp = {
            enable = true;
            settings = {
              plugins = {
                jedi_completion.fuzzy = true;
                pylsp_mypy.enabled = true;
                junos-eznc.enable = true;
                jinja2.enable = true;
                # Disabling redundant linters
                autopep8.enabled = false;
                flake8.enabled = false;
                mccabe.enabled = false;
                preload.enabled = false;
                pycodestyle.enabled = false;
                pydocstyle.enabled = false;
                pyflakes.enabled = false;
                pylint.enabled = false;
                ruff.enabled = false;
                yapf.enabled = false;
              };
            };
          };
        };
      };
    };
  };
}
