return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "erooke/blink-cmp-latex",
    },
    opts = {
      completion = {
        trigger = {
          -- Désactive l'affichage automatique à chaque lettre tapée
          show_on_keyword = false,
          -- Active l'affichage UNIQUEMENT pour les commandes (comme le \ de LaTeX)
          show_on_trigger_character = true,
        },
      },
      sources = {
        -- Ajoute la source "latex" au filetype tex, en plus des sources par défaut
        per_filetype = {
          tex = { inherit_defaults = true, "latex" },
        },
        providers = {
          latex = {
            name = "Latex",
            module = "blink-cmp-latex",
            opts = {
              -- false : insère le symbole (ex. α) plutôt que la commande (\alpha)
              insert_command = false,
            },
          },
        },
      },
    },
  },
}
