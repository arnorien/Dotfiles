return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        trigger = {
          -- Désactive l'affichage automatique à chaque lettre tapée
          show_on_keyword = false,
          -- Active l'affichage UNIQUEMENT pour les commandes (comme le \ de LaTeX)
          show_on_trigger_character = true,
        },
      },
    },
  },
}
