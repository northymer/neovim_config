return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main", -- HACK: force neo-tree to checkout `main` for initial v3 migration since default branch has changed
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  cmd = "Neotree",
  init = function() vim.g.neo_tree_remove_legacy_commands = true end,
  opts = function()
    return {
      auto_clean_after_session_restore = true,
      close_if_last_window = true,
      sources = { "filesystem", "buffers", "git_status" },
      window = {
        width = 40,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          ["[b"] = "prev_source",
          ["]b"] = "next_source",
          -- F = utils.is_available "telescope.nvim" and "find_in_dir" or nil,
          O = "system_open",
          Y = "copy_selector",
          h = "parent_or_close",
          l = "child_or_open",
          o = "open",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
          ["<C-j>"] = "move_cursor_down",
          ["<C-k>"] = "move_cursor_up",
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
        }
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(_) vim.opt_local.signcolumn = "auto" end,
        },
      },
    }
  end,
}
