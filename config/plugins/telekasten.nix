{
    plugins.telekasten = {
        enable = true;
        luaConfig.post =  ''
            require("telekasten").setup({
                -- Main paths
                home = '/home/lgo/citizengo',        -- path to main notes folder
                dailies = '/home/lgo/citizengo/LGo/Calendar/Journal',       -- path to daily notes
                weeklies = '/home/lgo/citizengo/LGo/Calendar',      -- path to weekly notes
                templates = '/home/lgo/citizengo/Templates',   -- path to templates

		-- Specific note templates
        	-- set to `nil` or do not specify if you do not want a template
      		-- template_new_note = '/path/to/file',    -- template for new notes
      		template_new_daily = '/home/lgo/citizengo/Templates/journal_lgo.md',   -- template for new daily notes
      		template_new_weekly = '/home/lgo/citizengo/Templates/weekly_lgo.md',  -- template for new weekly notes

		-- Image subdir for pasting
        	-- subdir name
        	-- or nil if pasted images shouldn't go into a special subdir
      		--image_subdir = "/home/lgo/citizengo/LGo/Assets/img",

		-- Generate note filenames. One of:
        	-- "title" (default) - Use title if supplied, uuid otherwise
        	-- "uuid" - Use uuid
        	-- "uuid-title" - Prefix title by uuid
        	-- "title-uuid" - Suffix title with uuid
      		new_note_filename = "title",
      		-- file uuid type ("rand" or input for os.date such as "%Y%m%d%H%M")
      		uuid_type = "%Y%m%d%H%M",
      		-- UUID separator
      		uuid_sep = "-",

		-- Flags for creating non-existing notes
	      	follow_creates_nonexisting = true,    -- create non-existing on follow
	      	dailies_create_nonexisting = true,    -- create non-existing dailies
	      	weeklies_create_nonexisting = true,   -- create non-existing weeklies

	      	-- skip telescope prompt for goto_today and goto_thisweek
	      	journal_auto_open = false,

	      	-- Image link style",
		-- wiki:     ![[image name]]
		-- markdown: ![](image_subdir/xxxxx.png)
	      	image_link_style = "markdown",

		-- Default sort option: 'filename', 'modified'
	      	sort = "filename",

	      	-- Make syntax available to markdown buffers and telescope previewers
	      	install_syntax = true,

	      	-- Tag notation: '#tag', '@tag', ':tag:', 'yaml-bare'
	      	tag_notation = "#tag",

	      	-- When linking to a note in subdir/, create a [[subdir/title]] link
	      	-- instead of a [[title only]] link
	      	subdirs_in_links = true,

	      	-- Command palette theme: dropdown (window) or ivy (bottom panel)
	      	command_palette_theme = "ivy",

	      	-- Tag list theme:
		-- get_cursor (small tag list at cursor)
		-- dropdown (window)
		-- ivy (bottom panel)
	      	show_tags_theme = "ivy",

	      	-- Previewer for media files (images mostly)
		-- "telescope-media-files" if you have telescope-media-files.nvim installed
		-- "catimg-previewer" if you have catimg installed
		-- "viu-previewer" if you have viu installed
	      	media_previewer = "telescope-media-files",

		-- Customize insert image and preview image files list. This is useful
      		-- to add optional filetypes into filtered list (for example
      		-- telescope-media-files optionally supporting svg preview)
      		media_extensions = {
        		".png",
        		".jpg",
        		".bmp",
        		".gif",
        		".pdf",
        		".mp4",
        		".webm",
        		".webp",
		},

		-- Calendar integration
      		plug_into_calendar = true,         -- use calendar integration
      		calendar_opts = {
        	weeknm = 3,                      -- calendar week display mode:
                                         --   1 .. 'WK01'
                                         --   2 .. 'WK 1'
                                         --   3 .. 'KW01'
                                         --   4 .. 'KW 1'
                                         --   5 .. '1'

        	calendar_monday = 1,             -- use monday as first day of week:
                                         --   1 .. true
                                         --   0 .. false

        	calendar_mark = 'left-fit',      -- calendar mark placement
                                         -- where to put mark for marked days:
                                         --   'left'
                                         --   'right'
                                         --   'left-fit'
      		},

		--vaults = {
        	--	citizengo = {
          	--		-- configuration for personal vault. E.g.:
          	--		-- home = "/home/lgo/citizengo",
        	--	},
        	--	LGo = {
          	--		-- configuration for personal vault. E.g.:
          	--		-- home = "/home/lgo/citizengo/LGo",
        	--	}
      		--},

      		-- Specify a clipboard program to use
      		clipboard_program = "wl-paste", -- xsel, xclip, wl-paste, osascript

		
		-- https://gist.github.com/gahrae/548036b64f754aa5a3caa58d87bb8731
		-- Appends a 'block reference' to the line under the cursor, and yanks a link to it.
		yank_notelink_id = function()
			local uuid = require("telekasten.utils.files").new_uuid("rand")
			local title = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
			local blockReference = "^" .. uuid
			vim.api.nvim_command("normal! $")
			vim.api.nvim_put({ " " .. blockReference }, "c", true, true)
			local blockReferenceLink = "[[" .. title .. "#" .. blockReference .. "|" .. title .. "]]"
			vim.fn.setreg('"', blockReferenceLink)
			print("yanked " .. blockReferenceLink)
		end

		-- Prompt user for link description, and yank a link to the file using the description.
		--yank_notelink_desc = function()
		--	local title = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
		--	vim.ui.input({
		--			prompt = "Description:",
		--			default = title,
		--		}, function(description)
		--		local link
		--		if description ~= "" then
		--			link = "[[" .. title .. "|" .. description .. "]]"
		--		else
		--			link = "[[" .. title .. "]]"
		--		end
		--		vim.fn.setreg('"', link)
		--		print("yanked " .. link)
		--	end)
		--end

		-- Yank a link to the heading under the cursor.
		--yank_notelink_heading = function()
		--	local title = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")

		--	local heading = vim.fn.getline(vim.fn.line("."))
		--	heading = string.gsub(heading, "^[#| ]*", "")

		--	local headingLink = "[[" .. title .. "#" .. heading .. "|" .. heading .. "]]"
		--	vim.fn.setreg('"', headingLink)
		--	print("yanked " .. headingLink)
		--end
            })
        '';
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
