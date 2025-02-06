{
    plugins.telescope = {
        enable = true;
        extensions = {
            fzf-native.enable = true;
            live-grep-args.enable = true;
            manix.enable = true;
            media-files.enable = true;
            #project.enable = true;
            undo.enable = true;
        };
        # TODO: Add lazyLoad settings
        #lazyLoad = {
        #    enable = true;
            # settings = {
            #     cmd = [
            #         "Telescope find_files"
            #         "Telescope live_grep"
            #         "Telescope buffers"
            #         "Telescope help_tags"
            #     ];
            #     keys = [
            #         "<leader>ff"
            #         "<leader>fg"
            #         "<leader>fb"
            #         "<leader>fh"
            #     ];
            # };
        #};
    };
}