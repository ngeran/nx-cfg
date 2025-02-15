{
  pkgs,
  config,
  ...
}:
{
  home = {
    packages = with pkgs; [
      # Python packages
      (python3.withPackages (ps: with ps; [
        pip
        setuptools
        matplotlib
        numpy
        torch
        flask
        pyyaml
      ]))

      # Python tools for development
      python310Packages.mypy
      python310Packages.junos-eznc
      python310Packages.jinja2
      python310Packages.types-jinja2
    ];

    # Mypy settings (added directly inline)
    sessionVariables.MYPY_CONFIG = ''
      [mypy]
      ignore_missing_imports = True
    '';

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
