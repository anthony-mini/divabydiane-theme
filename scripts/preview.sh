#!/usr/bin/env bash
# Publie une preview NON publiée (jamais le thème live) et affiche le lien
# partageable. Chaque exécution crée un nouveau thème non-publié — nettoyer
# les anciens de temps en temps avec `shopify theme list` / `theme delete`.
#
# Usage : scripts/preview.sh
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/_common.sh"

echo "→ Envoi d'une preview non publiée sur ${STORE} ..."
shopify theme push --store "$STORE" --unpublished --json "$@"
