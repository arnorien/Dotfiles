===============================================================================
=                 L A Z Y V I M - T U T O R   (version perso)               =
===============================================================================

  Ce fichier est un mode d'emploi de TA config LazyVim, dans le style de
  vimtutor. Il se lit ET se pratique directement dedans : certaines zones
  sont faites pour être modifiées à la main (comme dans vimtutor).

  Comment l'utiliser :
    - Ouvre-le avec :  nvim ~/Dotfiles/nvim/LAZYVIM_TUTOR.md
    - Avance de haut en bas, fais les exercices dans les "ZONES D'ENTRAINEMENT".
    - Si tu casses une zone d'entraînement et veux repartir de zéro sans
      sauvegarder : tape  :e!  (recharge le fichier depuis le disque).
    - Ne fais PAS :w sur ce fichier tant que tu es en plein exercice, sinon
      tu vas devoir corriger les dégâts toi-même (comme un vrai éditeur !).
    - Astuce transversale : dans LazyVim, appuie sur la touche <leader>
      (= Espace) et ATTENDS une seconde. Un menu "which-key" apparaît et te
      montre toutes les combinaisons possibles. C'est ta bouée de sauvetage
      si un raccourci ci-dessous ne correspond plus exactement à ta version.

-------------------------------------------------------------------------------
  Leçon 0 : Échauffement (motions de base, pour la suite)
-------------------------------------------------------------------------------

  Objectif : se rappeler dw, dd, yy, p, ciw avant d'attaquer LazyVim.

  ZONE D'ENTRAINEMENT (à éditer) :
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1. Supprime le mot "vraiment" en trop sur la ligne ci-dessous avec dw :
     Ce plugin est vraiment vraiment rapide.

  2. Supprime entièrement la ligne inutile ci-dessous avec dd :
     LIGNE A SUPPRIMER - elle ne sert à rien.

  3. Duplique la ligne suivante juste en dessous avec yy puis p :
     Cette ligne doit apparaître deux fois.

  4. Change le mot ENTRE GUILLEMETS ci-dessous en "gruvbox" avec ciw
     (place le curseur sur "tokyonight" d'abord) :
     Mon thème préféré est "tokyonight".
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Une fois fait, passe à la suite (pas besoin de tout garder correct).

-------------------------------------------------------------------------------
  Leçon 1 : Le Leader et le menu which-key
-------------------------------------------------------------------------------

  Dans ta config, le leader est la touche Espace (comportement par défaut
  de LazyVim, tu ne l'as pas changé).

  A FAIRE (pas dans le texte, dans l'éditeur) :
    1. En mode NORMAL, appuie sur Espace et attends. Un menu s'ouvre avec
       des groupes : f (find), g (git), c (code), a (+ai, ton ajout !),
       k (+wiki, ton ajout !), etc.
    2. Tape <leader>sk (Espace puis s puis k) : ça ouvre une recherche
       parmi TOUS les raccourcis clavier existants. Cherche "gruvbox" ou
       "claude" pour voir apparaître tes propres raccourcis personnalisés.

  Retiens ce réflexe "Espace + attendre" : il remplace 90% de ce tutoriel.

-------------------------------------------------------------------------------
  Leçon 2 : Trouver des fichiers et du texte (Telescope)
-------------------------------------------------------------------------------

  Raccourcis à essayer (root = racine du projet git détectée automatiquement) :

    <leader><space>   Chercher un fichier par son nom
    <leader>ff        Idem (alias)
    <leader>fr        Fichiers récemment ouverts
    <leader>fb        Chercher parmi les buffers ouverts
    <leader>sg        Grep : chercher du texte dans tout le projet
    <leader>sw        Grep du mot sous le curseur

  A FAIRE :
    1. Tape <leader><space>, cherche "keymaps.lua", valide avec Entrée.
    2. Reviens ici avec <leader>fb (tu dois voir ce fichier tutor listé).
    3. Tape <leader>sg et cherche "vimwiki" : tu dois voir la ligne où
       ton plugin vimwiki est déclaré dans lua/plugins/vimwiki.lua.

-------------------------------------------------------------------------------
  Leçon 3 : L'explorateur de fichiers (Neo-tree)
-------------------------------------------------------------------------------

    <leader>e   Ouvrir/fermer l'explorateur (racine du projet)
    <leader>E   Idem mais sur le dossier courant

  Dans l'explorateur :
    a      créer un fichier/dossier
    d      supprimer
    r      renommer
    Entrée ouvrir
    H      afficher/cacher les fichiers cachés

  Sélectionner plusieurs fichiers et les traiter par lot :
    Neo-tree réutilise le mode VISUEL de Vim pour sélectionner plusieurs
    lignes (donc plusieurs fichiers/dossiers) à la fois.

    1. Place le curseur sur le premier fichier à sélectionner.
    2. Appuie sur  V  (visuel ligne) pour entrer en mode visuel.
    3. Descend avec  j  (ou les flèches) jusqu'au dernier fichier voulu :
       toutes les lignes traversées sont surlignées et donc sélectionnées.
    4. Appuie sur UNE des touches d'action ci-dessous : elle s'applique
       alors à TOUS les fichiers sélectionnés, pas seulement à un seul :
         y   copier (dans le presse-papier interne de Neo-tree)
         x   couper
         p   coller (après un y ou un x, sur un dossier de destination)
         d   supprimer
         c   copier vers un nouvel emplacement (demande le chemin)
         m   déplacer vers un nouvel emplacement (demande le chemin)

    Exemple concret : pour déplacer 3 fichiers dans un même dossier,
    sélectionne-les avec V + j/j, tape x (couper), navigue jusqu'au
    dossier cible, place le curseur dessus, puis tape p (coller).

  A FAIRE : ouvre <leader>e, navigue jusqu'à nvim/lua/plugins/, regarde la
  liste de tes 5 plugins perso, referme avec <leader>e.

-------------------------------------------------------------------------------
  Leçon 4 : Buffers et fenêtres
-------------------------------------------------------------------------------

    <S-h> / <S-l>     Buffer précédent / suivant
    <leader>bd        Fermer le buffer courant
    <leader>bb        Basculer vers le dernier buffer utilisé
    <C-h/j/k/l>       Se déplacer entre les fenêtres (splits)
    <leader>-          Split horizontal
    <leader>|          Split vertical

  A FAIRE : ouvre un 2e fichier avec <leader><space>, fais un split vertical
  avec <leader>|, navigue entre les deux avec <C-h>/<C-l>, referme le split
  en trop avec <C-w>q, puis <leader>bd pour fermer le buffer superflu.

-------------------------------------------------------------------------------
  Leçon 5 : LSP - comprendre le code sans quitter l'éditeur
-------------------------------------------------------------------------------

  Ces raccourcis marchent dans un fichier avec un langage supporté (essaie
  sur un .lua de ta config, par exemple nvim/lua/plugins/blink.lua) :

    gd            Aller à la définition
    gr            Voir les références
    K             Documentation/info au survol
    <leader>ca    Action de code (code action)
    <leader>cr    Renommer un symbole partout dans le projet
    ]d / [d       Diagnostic suivant / précédent (erreurs, warnings)
    <leader>cd    Voir le diagnostic sous le curseur en détail
    <leader>xx    Ouvrir Trouble : liste de tous les diagnostics du projet

  A FAIRE : ouvre nvim/lua/plugins/claudecode.lua, place le curseur sur
  "opts" ligne 5, tape K pour voir ce que LSP en dit (si le serveur Lua est
  installé - sinon lance :LazyExtras pour ajouter le support lua).

-------------------------------------------------------------------------------
  Leçon 6 : Git intégré
-------------------------------------------------------------------------------

    <leader>gg    Ouvrir lazygit (interface complète dans le terminal)
    ]h / [h       Hunk (bloc de modif) suivant / précédent dans le fichier
    <leader>ghs   Stage le hunk sous le curseur
    <leader>ghr   Reset (annuler) le hunk sous le curseur
    <leader>gb    Blame de la ligne courante

  A FAIRE : dans ce dossier Dotfiles, tape <leader>gg pour ouvrir lazygit,
  regarde le fichier nvim/lazy-lock.json marqué comme modifié (M), quitte
  lazygit avec q.

-------------------------------------------------------------------------------
  Leçon 7 : Le gestionnaire de plugins Lazy
-------------------------------------------------------------------------------

  Commandes (mode commande, ":") :

    :Lazy          Ouvrir le dashboard des plugins (installés, à jour, etc.)
    :Lazy update   Mettre à jour tous les plugins
    :Lazy sync     Installer/mettre à jour/nettoyer en une fois
    :Lazy health   Vérifier que chaque plugin fonctionne bien
    :checkhealth   Diagnostic global de Neovim (LSP, clipboard, etc.)
    :LazyExtras    Activer/désactiver les modules optionnels de LazyVim
                   (langages, formatters, etc. en plus de ta config)

  A FAIRE : tape :Lazy, repère "claudecode.nvim" et "vimwiki" dans la liste,
  quitte avec q. C'est cet écran qui explique pourquoi
  nvim/lazy-lock.json a changé dans ton git status : il note les versions
  exactes de chaque plugin.

-------------------------------------------------------------------------------
  Leçon 8 : Correction orthographique (activée dans ton options.lua)
-------------------------------------------------------------------------------

  Ta config force `spell = true` et `spelllang = { "fr" }` partout
  (nvim/lua/config/options.lua). Utile ici, dans du texte français.

    ]s / [s    Mot mal orthographié suivant / précédent
    z=         Proposer des corrections pour le mot sous le curseur
    zg         Ajouter le mot au dictionnaire personnel (bien orthographié)
    zw         Marquer un mot comme mal orthographié
    <leader>us Activer/désactiver la correction (toggle "spell")

  ZONE D'ENTRAINEMENT (contient des fautes volontaires) :
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Cette phrase contiens des aute d'ortografe a corriger avec ]s et z=.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  A FAIRE : place le curseur au début de la zone, utilise ]s pour sauter
  d'erreur en erreur, corrige avec z= puis le numéro de la suggestion.

-------------------------------------------------------------------------------
  Leçon 9 : Claude Code dans Neovim (ton plugin claudecode.nvim)
-------------------------------------------------------------------------------

  Config : nvim/lua/plugins/claudecode.lua - tout est sous <leader>a.

    <leader>ac    Ouvrir/fermer le panneau Claude Code
    <leader>af    Donner le focus au panneau Claude
    <leader>ar    Reprendre (--resume) une session Claude précédente
    <leader>aC    Continuer (--continue) la dernière conversation
    <leader>ab    Ajouter le buffer courant au contexte envoyé à Claude
    <leader>as    (en mode VISUEL) Envoyer la sélection à Claude
    <leader>aa    Accepter un diff proposé par Claude
    <leader>ad    Refuser un diff proposé par Claude

  A FAIRE :
    1. Ouvre ce fichier tutor, sélectionne cette leçon en mode visuel (V puis
       flèches), tape <leader>as pour l'envoyer à Claude comme contexte.
    2. Ouvre le panneau avec <leader>ac, demande-lui quelque chose de simple
       sur ce fichier, referme avec <leader>ac.

-------------------------------------------------------------------------------
  Leçon 10 : VimWiki (ton plugin, actif UNIQUEMENT dans ~/Travail/Wiki)
-------------------------------------------------------------------------------

  Config : nvim/lua/plugins/vimwiki.lua. Point important : tu as désactivé
  vimwiki_global_ext, donc SEULS les .md dans ~/Travail/Wiki/ deviennent des
  fichiers vimwiki. Un .md ailleurs (comme ce tutoriel !) reste du markdown
  normal - c'est voulu, pour ne pas gêner tes README.md.

    <leader>kw    Ouvrir l'index du wiki
    <leader>kt    Ouvrir l'index du wiki dans un nouvel onglet
    <leader>ki    Ouvrir l'index du journal (diary)
    <leader>kd    Créer une nouvelle note de journal du jour

  A FAIRE (si ~/Travail/Wiki existe déjà, sinon vimwiki le proposera de le
  créer) : tape <leader>kw pour ouvrir l'index, puis <leader>kd pour créer
  la note du jour. Reviens ici avec <leader>fb ou <leader>fr.

-------------------------------------------------------------------------------
  Leçon 11 : VimTeX + blink.cmp (rédaction LaTeX)
-------------------------------------------------------------------------------

  Config : nvim/lua/plugins/vimtex.lua (compilateur lualatex, visionneuse
  zathura) et nvim/lua/plugins/blink.lua (autocomplétion). Point notable de
  ta config blink : l'autocomplétion ne se déclenche PAS à chaque lettre
  tapée (show_on_keyword = false) - elle n'apparaît QUE sur un caractère
  déclencheur comme le "\" de LaTeX. C'est volontaire pour ne pas être
  pollué en dehors du LaTeX.

    \ll    (dans un fichier .tex) Compiler le document
    \lv    Ouvrir la visionneuse zathura, synchronisée avec le PDF
    \lc    Nettoyer les fichiers auxiliaires de compilation

  A FAIRE : crée un fichier test.tex quelque part (:e /tmp/test.tex), tape
  un "\", regarde le menu de complétion latex (fourni par blink-cmp-latex)
  apparaître automatiquement.

-------------------------------------------------------------------------------
  Leçon 12 : Le thème gruvbox (transparent)
-------------------------------------------------------------------------------

  Config : nvim/lua/plugins/gruvbox.lua - `transparent_mode = true`, donc
  le fond de Neovim laisse transparaître le fond de ton terminal.

  A FAIRE : tape :colorscheme puis Tab pour voir la liste des thèmes
  installés, essaie un autre thème temporairement, reviens à gruvbox avec
  :colorscheme gruvbox (le changement définitif se fait dans le fichier
  gruvbox.lua, pas en live).

-------------------------------------------------------------------------------
  Aide-mémoire final (tes raccourcis perso, tout sur une page)
-------------------------------------------------------------------------------

  +ai (Claude Code)        +wiki (VimWiki)
  <leader>ac  toggle       <leader>kw  index
  <leader>af  focus        <leader>kt  index (onglet)
  <leader>ar  resume       <leader>ki  index journal
  <leader>aC  continue     <leader>kd  note du jour
  <leader>ab  add buffer
  <leader>as  send (visuel)
  <leader>aa  accept diff
  <leader>ad  deny diff

  LaTeX (vimtex)            Général LazyVim
  \ll  compiler             <leader><space>  fichiers
  \lv  visionneuse          <leader>sg       grep
  \lc  nettoyer             <leader>e        explorateur
                            <leader>gg       lazygit
                            <leader>xx       diagnostics (trouble)
                            :Lazy            gestion plugins

===============================================================================
                    Fin du tutoriel - bonne exploration !
===============================================================================
