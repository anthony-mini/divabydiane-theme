# Diva by Diane — Boutique de bijoux (v1)

Thème Shopify Liquid basé sur [Dawn](https://github.com/Shopify/dawn), le thème de référence Shopify (Online Store 2.0).

- **Client :** Diane Vandenberg — bijoux "luxe abordable", France.
- **Domaine :** divabydiane.fr
- **Plateforme :** Shopify (plan Basic)

## Prérequis

- Node.js (installé : v24)
- Shopify CLI (installé globalement) — `shopify version`
- Un **dev store** Shopify (gratuit via [Shopify Partners](https://partners.shopify.com))

## Développement local

```bash
# Depuis apps/v1
# Connexion + dev store (aperçu local avec hot reload)
shopify theme dev --store <ton-store>.myshopify.com

# Vérifier la qualité du thème (Theme Check)
shopify theme check

# Pousser le thème vers la boutique (thème de dev non publié)
shopify theme push --unpublished

# Récupérer les réglages/données depuis la boutique
shopify theme pull
```

## Structure

| Dossier | Rôle |
|---|---|
| `layout/` | Gabarits racine (`theme.liquid`, `password.liquid`) |
| `templates/` | Templates de pages (produit, collection, panier, index…) — JSON 2.0 |
| `sections/` | Sections réutilisables et modulables |
| `snippets/` | Fragments Liquid réutilisables |
| `assets/` | CSS, JS, images, fonts |
| `config/` | `settings_schema.json` (réglages du thème), `settings_data.json` |
| `locales/` | Traductions (fr, en…) |

## Identité visuelle "Diva by Diane"

Choix fait : rester sur **Dawn** (gratuit) et le personnaliser, plutôt qu'un thème premium payant (Monaco/Prestige), pour préserver le budget MVP.

- **Langue par défaut** : français (`locales/fr.default.json` + `fr.default.schema.json`). L'anglais reste disponible en langue secondaire (`en.json`).
- **Typographies** : `Prata` (titres, serif éditorial type Cartier) + `Jost` (texte courant, sans-serif épuré type Zara).
- **Palette** : schémas 1–4 de Dawn conservés (noir/blanc/gris — déjà minimalistes). Le schéma 5 (bleu par défaut) remplacé par un accent or mat `#B08D57` (poudre d'or / plaqué or).
- **Slogan** : "Be a diva" renseigné en `brand_headline` (theme settings > Brand information).

## Prochaines étapes

1. Créer/connecter un dev store Shopify Partners si ce n'est pas déjà fait (`shopify theme dev --store <store>.myshopify.com`).
2. Ajouter le logo (noir/blanc, style Dior) via le theme editor (Header > Logo).
3. Importer les produits et photos (voir plan photo dans `notes/`).
4. Renseigner les liens réseaux sociaux (`social_instagram_link`, etc.) dans les réglages du thème.
5. Vérifier `shopify theme check` avant chaque push — quelques erreurs `ValidSchemaName` proviennent des traductions FR officielles de Shopify (noms de sections trop longs), non bloquantes.
