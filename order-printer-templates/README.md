# Templates Order Printer

Ces fichiers ne font **pas partie du thème Shopify** (pas de `theme push` possible dessus) —
l'app **Order Printer** utilise sa propre variante de Liquid, indépendante du thème.

## Installation

1. Installer l'app gratuite **Order Printer** (Shopify App Store).
2. Admin Shopify → **Apps** → **Order Printer** → **Templates** → **Créer un template**.
3. Choisir le type **Packing slip** (bon de livraison), ouvrir l'éditeur de code (`</>`).
4. Copier-coller le contenu de `bon-de-livraison.liquid` dans l'éditeur.
5. Enregistrer, puis tester depuis une commande existante (**Commandes** → ouvrir une commande → **Plus d'actions** → **Imprimer un bon de livraison**).

## Design

- Typographies : Prata (titres) + Jost (texte), identiques au thème.
- Palette : noir `#121212` / blanc cassé `#F3F3F3` / accent or mat `#B08D57`.
- Contenu : coordonnées de livraison, détail des articles (photo, réf., quantité, prix),
  totaux, conseil d'entretien, politique de retour (14 jours).
- Format : A4, optimisé impression noir & blanc si besoin (l'accent or reste lisible en gris).
