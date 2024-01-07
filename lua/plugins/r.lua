return {
 -- vscode-like pictograms for lsp completion items
  "onsails/lspkind.nvim",

 -- r plugin
  "jamespeapen/Nvim-R",

  -- r autocomplete (better than the lsp)
  { "jalvesaq/cmp-nvim-r",
    config = function()
      -- autocomplete config specific to R
      require('cmp_nvim_r').setup({
        filetypes = {'r', 'R', 'rmd', 'Rmd', 'qmd', 'quarto', 'Rprofile'},
        doc_width = 56
        })
    end
  },

}
