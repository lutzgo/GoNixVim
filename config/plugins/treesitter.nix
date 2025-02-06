{ pkgs, ... }: {
    plugins.treesitter = {
        enable = true;
        autoLoad = true;
	grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      html
      java
      json
      latex
      lua
      make
      markdown
      markdown_inline
      nix
      regex
      toml
      vim
      vimdoc
      xml
      yaml
    ];
        # TODO: Add settings after completing LSP-setup
    };
}
