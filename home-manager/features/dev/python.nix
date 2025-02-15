{
  pkgs,
  config,
  ...
}:
{
  # Home configuration for Python packages and environment variables
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

    # Configure MyPy cache directory for Python
    sessionVariables.MYPY_CACHE_DIR = "${config.xdg.cacheHome}/mypy";

    # Mypy settings (ignore missing imports for smoother development)
   # sessionVariables.MYPY_CONFIG = ''
   #   [mypy]
   #   ignore_missing_imports = True
   # '';
  };

  # Program configurations (LSP, linters, etc.)
  programs = {
    # Ruff linter settings
    ruff = {
      enable = true;

      settings = {
        line-length = 100;
      };
    };

    # NixVim settings for Python and other configurations
    nixvim = {
      filetype.extension.gin = "gin";  # inria, specific filetype settings

      # Auto command for formatting with ruff on file write
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

      # Plugin and LSP configuration for Python
      plugins = {
        treesitter.languageRegister.python = [ "gin" ];  # inria, custom language support

        # Python LSP server configurations (pylsp and mypy integration)
        lsp.servers = {
          # Ruff: enable it for linting in Python code
          ruff.enable = true;

          # pylsp configuration (Python Language Server)
          pylsp = {
            enable = true;
            settings = {
              plugins = {
                jedi_completion.fuzzy = true;  # Enable fuzzy completion for jedi

                # Enable MyPy for type checking via pylsp
                pylsp_mypy.enabled = true;

                # Enable Junos-EZNC for network configuration
                junos-eznc.enable = true;

                # Disable redundant linters that ruff already covers
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
