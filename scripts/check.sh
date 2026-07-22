#!/usr/bin/env bash
# Lint du thème (Theme Check) — pas besoin d'auth, purement statique.
#
# Usage : scripts/check.sh [flags supplémentaires shopify theme check]
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/_common.sh"

exec shopify theme check "$@"
