{
    plugins.noice = {
        enable = true;
        autoLoad = true;
        # TODO: Add settings after completing Treesitter-setup
	settings.lsp.override = {
		"cmp.entry.get_documentation" = false;
		  "vim.lsp.util.convert_input_to_markdown_lines" = false;
		  "vim.lsp.util.stylize_markdown" = false;

	};
    };
}
