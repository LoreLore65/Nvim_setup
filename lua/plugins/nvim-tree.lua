return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,      -- Changed to false so dotfiles are VISIBLE by default
        git_ignored = false,   -- Changed to false so gitignored files are VISIBLE by default
      },
    }
--[[
    -- Auto-open nvim-tree on a real file launch
    local function open_nvim_tree(data)
      local real_file = vim.fn.filereadable(data.file) == 1
      if not real_file then return end

      require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })--]]
  end,
}
