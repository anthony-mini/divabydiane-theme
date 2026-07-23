#!/usr/bin/env bash
# Lance l'aperçu local (hot-reload) sur http://127.0.0.1:9292
#
# Usage : scripts/dev.sh [flags supplémentaires shopify theme dev]
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/_common.sh"

echo "→ Aperçu local sur ${STORE} (http://127.0.0.1:9292) ..."
exec shopify theme dev --store "$STORE" "$@"
