#!/usr/bin/env bash
# Shared setup, sourced by the other scripts/*.sh — not meant to be run directly.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
STORE="divabydiane.myshopify.com"

cd "$PROJECT_ROOT"

if [ -f "$PROJECT_ROOT/.env" ]; then
  set -a
  # shellcheck disable=SC1091
  source "$PROJECT_ROOT/.env"
  set +a
else
  echo "⚠️  .env introuvable (SHOPIFY_CLI_THEME_TOKEN manquant)." >&2
  echo "    Voir docs/apps/front/theme-v1-dawn.md — app \"Theme Access\"." >&2
fi

if ! command -v shopify >/dev/null 2>&1; then
  echo "✗ Shopify CLI introuvable. Installer avec : npm install -g @shopify/cli@latest" >&2
  exit 1
fi
