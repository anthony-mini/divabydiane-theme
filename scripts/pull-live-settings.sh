#!/usr/bin/env bash
# Récupère UNIQUEMENT config/settings_data.json depuis le thème LIVE.
#
# Utile après un changement fait dans Admin > Personnaliser (ex. upload de
# logo) : le thème connecté GitHub committe automatiquement ce fichier sur
# `main` (shopify[bot]) — voir docs/apps/front/theme-v1-dawn.md. Ce script
# sert pour les cas où on veut le récupérer directement en local sans
# attendre/chercher ce commit, en gardant un scope volontairement étroit
# (jamais un `theme pull` complet, qui écraserait tout le reste du thème
# local avec l'ancienne version live).
#
# Usage : scripts/pull-live-settings.sh
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/_common.sh"

echo "⚠️  Ceci écrase config/settings_data.json local avec la version LIVE."
read -r -p "Continuer ? [y/N] " confirm
if [[ "${confirm}" != "y" && "${confirm}" != "Y" ]]; then
  echo "Annulé."
  exit 1
fi

shopify theme pull --store "$STORE" --live --only=config/settings_data.json

echo ""
echo "→ Diff avec la version précédente (relire avant de committer -- une"
echo "  fusion silencieuse a déjà fait perdre un réglage une fois, voir"
echo "  docs/apps/front/theme-v1-dawn.md) :"
git --no-pager diff -- config/settings_data.json
