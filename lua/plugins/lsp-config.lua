return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason.nvim",
  },
  config = function()
    -- Configurazione di ltex-ls per l'inglese usando le nuove API native
    vim.lsp.config("ltex", {
      settings = {
        ltex = {
          language = "en-US", -- Cambia in "en-GB" se preferisci l'inglese britannico
        },
      },
    })

    -- Abilita il server
    vim.lsp.enable("ltex")
  end,
}
