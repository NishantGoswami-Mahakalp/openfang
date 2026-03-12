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
for _ in $(seq 1 20); do
  status="$(docker inspect -f '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' openfang 2>/dev/null || true)"
  if [[ "$status" == "healthy" || "$status" == "running" ]]; then
    docker compose ps
    exit 0
  fi
  sleep 3
done

docker compose ps >&2
docker logs --tail 80 openfang >&2 || true
printf 'OpenFang failed to become healthy\n' >&2
exit 1
