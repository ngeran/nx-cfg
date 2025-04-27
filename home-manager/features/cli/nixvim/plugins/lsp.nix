{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    plugins = {
      lsp.enable = true;
      lsp.servers = {
        pylsp.enable = true;
        ruff.enable = true;
        marksman.enable = true;         # Markdown
        yamlls.enable = true;           # YAML
        rust-analyzer.enable = true;    # Rust
        html.enable = true;             # HTML (can help with Hugo content)
      };
    };
  };
}
