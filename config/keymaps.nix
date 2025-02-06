{
    # [[ Basic Keymaps ]]
    #  See `:help vim.keymap.set()`
    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      # Clear highlights on search when pressing <Esc> in normal mode
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      # is not what someone will guess without a bit more experience.
      #
      # NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
      # or just use <C-\><C-n> to exit terminal mode
      {
        mode = "t";
        key = "jk";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
        };
      }

      # Better escape using jk in insert and terminal mode
      {
        mode = "i";
        key = "jk";
        action = "<Esc>";
        options = {
          desc = "Exit insert mode";
        };
      }

      
      # Disable arrow keys in normal mode
      {
        mode = "n";
        key = "<left>";
        action = "<cmd>echo 'Use h to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<right>";
        action = "<cmd>echo 'Use l to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<up>";
        action = "<cmd>echo 'Use k to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<down>";
        action = "<cmd>echo 'Use j to move!!'<CR>";
      }

      # Center search results
      {
        mode = "n";
        key = "n";
        action = "nzz";
        options = {
          desc = "Center search results";
        };
      }
      {
        mode = "n";
        key = "N";
        action = "Nzz";
        options = {
          desc = "Center search results";
        };
      }

    # Visual line wraps
      # {
      #   mode = "n";
      #   key = "k";
      #   action = "v:count == 0 ? 'gk' : 'k";
      #   options = {
      #     desc = "Better lines navigation when lines wrap";
      #   };
      # }
      # {
      #   mode = "n";
      #   key = "j";
      #   action = "v:count == 0 ? 'gj' : 'j";
      #   options = {
      #     desc = "Better lines navigation when lines wrap";
      #   };
      # }

      # Better indent
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          desc = "gv automatically selects the previously selected area";
        };
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          desc = "gv automatically selects the previously selected area";
        };
      }

      # Paste over currently selected text without yanking it
      {
        mode = "v";
        key = "p";
        action = "_dP";
        options = {
          desc = "Paste over currently selected text without yanking it";
        };
      }

      # Switch Buffer
      {
        mode = "n";
        key = "S-h";
        action = ":bprevious<CR>";
        options = {
          desc = "Switch to previous buffer";
        };
      }
      {
        mode = "n";
        key = "S-l";
        action = ":bnext<CR>";
        options = {
          desc = "Switch to next buffer";
        };
      }

      # Cancel search highlighting with ESC
      {
        mode = "n";
        key = "<ESC>";
        action = ":nohlsearch<Bar>:echo<CR>";
        options = {
          desc = "Cancel search highlighting with ESC";
        };
      }

      # Move selected line / block of text in visual mode
      {
        mode = "x";
        key = "K";
        action = ":move '<-2<CR>gv-gv";
        options = {
          desc = "Move selected line / block of text up";
        };
      }
      {
        mode = "x";
        key = "J";
        action = ":move '<+1<CR>gv-gv";
        options = {
          desc = "Move selected line / block of text down";
        };
      }

      
      # Keybinds to make split navigation easier.
      #  Use CTRL+<hjkl> to switch between windows
      #
      #  See `:help wincmd` for a list of all window commands
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {
          desc = "Move focus to the left pane";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {
          desc = "Move focus to the right pane";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {
          desc = "Move focus to the lower pane";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {
          desc = "Move focus to the upper pane";
        };
      }

      # Resizing panes
      {
        mode = "n";
        key = "<Left>";
        action = ":vertical resize +1<CR>";
        options = {
          desc = "Increase vertical size of the current pane";
        };
      }
      {
        mode = "n";
        key = "<Right>";
        action = ":vertical resize -1<CR>";
        options = {
          desc = "Decrease vertical size of the current pane";
        };
      }
      {
        mode = "n";
        key = "<Up>";
        action = ":resize -1<CR>";
        options = {
          desc = "Increase size of the current pane";
        };
      }
      {
        mode = "n";
        key = "<Down>";
        action = ":resize +1<CR>";
        options = {
          desc = "Decrease size of the current pane";
        };
      }

    
    # WTF
      {
        mode = "n";
        key = "<leader>sD";
        action = "function() require(\"wtf\").ai() end";
        options = {
          desc = "Search Diagnostic with AI";
        };
      }

      {
        mode = "n";
        key = "<leader>sd";
        action = "function() require(\"wtf\").search() end";
        options = {
          desc = "Search Diagnostic with DuckDuckGo";
        };
      }

      # Files and Directories
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Yazi<cr>";
        options = {
          desc = "Open yazi at the current file";
        };
      }
    
      {
        mode = "n";
        key = "<leader>ew";
        action = "<cmd>Yazi cwd<cr>";
        options = {
          desc = "Open the file manager in nvim's working directory";
        };
      }

      {
        mode = "n";
        key = "<leader>el";
        action = "<cmd>Yazi toggle<cr>";
        options = {
          desc = "Resume the last yazi session";
        };
      }
      
      # Telescope
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = {
          desc = "Telescope find files";
        };
      }
      
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope grep_string<cr>";
        options = {
          desc = "Telescope live_grep";
        };
      }
      {
        mode = "n";
        key = "<leader>fs";
        action = "<cmd>Telescope live_grep<cr>";
        options = {
          desc = "Telescope live_grep";
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        options = {
          desc = "Telescope buffers";
        };
      }
      
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
        options = {
          desc = "Telescope help_tags";
        };
      }

      # Telekasten
      {
        mode = "n";
        key = "<leader>o";
        action = "<cmd>Telekasten panel<cr>";
        options = {
          desc = "Telekasten panel";
        };
      }
      {
        mode = "n";
        key = "C-Enter";
        action = "<cmd>Telekasten toggle_todo<cr>";
        options = {
          desc = "Telekasten toggle_todo";
        };
      }
      {
        mode = "n";
        key = "<leader>ob";
        action = "<cmd>Telekasten show_backlinks<cr>";
        options = {
          desc = "Telekasten show_backlinks";
        };
      }
      {
        mode = "n";
        key = "<leader>od";
        action = "<cmd>Telekasten goto_today<cr>";
        options = {
          desc = "Telekasten goto_today";
        };
      }
      {
        mode = "n";
        key = "<leader>of";
        action = "<cmd>Telekasten find_notes<cr>";
        options = {
          desc = "Telekasten find_notes";
        };
      }
      {
        mode = "n";
        key = "<leader>os";
        action = "<cmd>Telekasten search_notes<cr>";
        options = {
          desc = "Telekasten search_notes";
        };
      }
      {
        mode = "n";
        key = "<leader>ol";
        action = "<cmd>Telekasten insert_link<cr>";
        options = {
          desc = "Telekasten insert_link";
        };
      }
      {
        mode = "n";
        key = "<leader>on";
        action = "<cmd>Telekasten new_note<cr>";
        options = {
          desc = "Telekasten new_note";
        };
      }
      {
        mode = "n";
        key = "<leader>or";
        action = "<cmd>Telekasten rename_note<cr>";
        options = {
          desc = "Telekasten rename_note";
        };
      }
      {
        mode = "n";
        key = "<leader>ot";
        action = "<cmd>Telekasten new_templated_note<cr>";
        options = {
          desc = "Telekasten new_templated_note";
        };
      }
      {
        mode = "n";
        key = "<leader>oy";
        action = "<cmd>Telekasten yank_notelink<cr>";
        options = {
          desc = "Telekasten yank_notelink";
        };
      }
      {
        mode = "n";
        key = "<leader>oz";
        action = "<cmd>Telekasten follow_link<cr>";
        options = {
          desc = "Telekasten follow_link";
        };
      }
      {
        mode = "i";
        key = "[[";
        action = "<cmd>Telekasten insert_link<cr>";
        options = {
          desc = "Telekasten insert_link";
        };
      }
      {
        mode = "n";
        key = "<leader>oh";
        action = ":lua yank_notelink_heading()<cr>";
        options = {
          desc = "Telekasten yank_notelink_heading";
        };
      }
      {
        mode = "n";
        key = "<leader>o";
        action = ":lua yank_notelink_id()<cr>";
        options = {
          desc = "Telekasten yank_notelink_id";
        };
      }
      {
        mode = "n";
        key = "<leader>od";
        action = ":lua yank_notelink_desc()<cr>";
        options = {
          desc = "Telekasten yank_notelink_desc";
        };
      }

# Completion

    ];
}
