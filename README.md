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

**Prérequis d'authentification** : installer l'app gratuite **Theme Access**
depuis le App Store Shopify, générer un mot de passe (`shptka_...`), et le
mettre dans `apps/v1/.env` (jamais commité, déjà dans `.gitignore`) :

```bash
# apps/v1/.env
SHOPIFY_CLI_THEME_TOKEN=shptka_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Détails et dépannage : [docs/apps/front/theme-v1-dawn.md](../../docs/apps/front/theme-v1-dawn.md).

```bash
# Depuis apps/v1 — scripts/ charge automatiquement .env
scripts/dev.sh                 # aperçu local avec hot reload (http://127.0.0.1:9292)
scripts/check.sh               # Theme Check (lint)
scripts/preview.sh             # preview partageable, thème non publié (jamais le live)
scripts/pull-live-settings.sh  # récupère juste config/settings_data.json du live (avec confirmation + diff)
```

Équivalent sans les scripts (à préférer si besoin de flags spécifiques) :

```bash
set -a; source .env; set +a
shopify theme dev --store divabydiane.myshopify.com
shopify theme check
shopify theme push --unpublished --json
shopify theme pull --live --only=config/settings_data.json
```

Autres commandes utiles, pas de script dédié (usage ponctuel) :

```bash
shopify theme list --store divabydiane.myshopify.com          # IDs et statuts des thèmes
shopify theme open --live --store divabydiane.myshopify.com    # liens preview/éditeur du thème live
shopify theme share                                            # preview à usage unique, nom aléatoire
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
