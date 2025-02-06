{
    plugins.yazi = {
        enable = true;
        # TODO: Add Telescope plugin settings
        lazyLoad = {
            enable = true;
            settings = {
                cmd = [
                    "Yazi"
                    "Yazi Toggle"
                    "Yazi cwd"
                ];
                keys = [
                    "<leader>e"
                    "<leader>ew"
                    "<leader>el"
                ];
            };
        };
        settings = {
            enable_mouse_support = true;
            open_for_directories = true;
        };
    };
}