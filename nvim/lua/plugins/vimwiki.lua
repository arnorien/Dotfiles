return {
  {
    "vimwiki/vimwiki",
    lazy = false, -- vimwiki doit être chargé au démarrage pour détecter le filetype
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/Travail/Wiki/",
          syntax = "markdown",
          ext = ".md",
        },
      }
      -- Ne traite en "vimwiki" que les .md situés dans ~/Travail/Wiki, pas tous les
      -- fichiers markdown du système (sinon README.md etc. changeraient de filetype)
      vim.g.vimwiki_global_ext = 0
      -- Désactive les mappings globaux par défaut (<leader>ww, <leader>wt, ...)
      -- qui entrent en conflit avec le groupe fenêtres <leader>w de LazyVim
      vim.g.vimwiki_key_mappings = { global = 0 }
    end,
    keys = {
      { "<leader>k", "", desc = "+wiki", mode = "n" },
      { "<leader>kw", "<cmd>VimwikiIndex<cr>", desc = "Open wiki index" },
      { "<leader>kt", "<cmd>VimwikiTabIndex<cr>", desc = "Open wiki index (tab)" },
      { "<leader>ki", "<cmd>VimwikiDiaryIndex<cr>", desc = "Open diary index" },
      { "<leader>kd", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "New diary note" },
    },
  },
}
