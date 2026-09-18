--Bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Enable syntax highlighting 
--vim.cmd('syntax on')

-- Enable row numbers view
vim.cmd('set number')

-- Enable Mouse Contols on Startups
vim.opt.mouse = "a"


--Telescope keybinds 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, { desc = "Find in current file" })

-- Jump directly to the split in that direction
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true }) -- Jump left (e.g., back to nvim-tree)
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true }) -- Jump right (e.g., into your code file)
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true }) -- Jump down
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true }) -- Jump up

--Hop between buffers in bufferline
-- Salta al buffer successivo (destra)
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer successivo" })

-- Salta al buffer precedente (sinistra)
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer precedente" })

--Open Errors list
vim.keymap.set('n', '<leader>x', vim.diagnostic.setloclist, { desc = "Apri lista errori del file (loclist)" })

-- Start Lualine
require('lualine').setup()

--Use the dayfox color scheme
--vim.cmd("colorscheme dayfox")

--Set tab to 4 spaces
vim.cmd('set shiftwidth=4')
vim.cmd('set tabstop=4')

--Remove auto comment
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

--Add "scavalcamento riga"
vim.opt.whichwrap:append("<,>,[,],h,l")

--Configure trminal to exit on "Esc"
vim.cmd('tnoremap <Esc> <C-\\><C-n>')

--Configure a shortcut for NvimTree toggle
vim.api.nvim_create_user_command('TreeToggle', function()
  vim.cmd('NvimTreeToggle')
end, {})

--Use mouse to resize splits
vim.o.mouse = 'a'

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- seamless copy-pasting
vim.opt.clipboard = "unnamedplus"

-- Startup mason LSP
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "pyright" },
})

-- new lspconfig API (nvim-lspconfig v2+)
--vim.lsp.config("clangd", {})
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

--Server setup for VimTex and Zathura


vim.g.vimtex_compiler_method = 'latexmk'
-- Questa riga dice a VimTeX di configurare automaticamente i server per la ricerca inversa
vim.g.vimtex_view_forward_search_on_start = true

-- Bufferline Setup
vim.opt.termguicolors = true
require("bufferline").setup({
 
    options = {    
        diagnostics = "nvim_lsp",

        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
    

   offsets = {
        {
          filetype = "NvimTree",
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = "Directory",
          text_align = "left"
        }
        }
 },
})






