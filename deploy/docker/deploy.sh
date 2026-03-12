#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd "$SCRIPT_DIR"

if [[ ! -f .env ]]; then
  printf 'Missing %s/.env\n' "$SCRIPT_DIR" >&2
  exit 1
fi

if [[ -z "${OPENFANG_IMAGE:-}" ]]; then
  printf 'OPENFANG_IMAGE is required\n' >&2
  exit 1
fi

docker compose pull openfang
docker compose up -d
docker compose ps
