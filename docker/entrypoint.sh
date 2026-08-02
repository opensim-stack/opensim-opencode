#!/usr/bin/env sh
set -eu

OPENCODE_HOST="${OPENCODE_HOST:-0.0.0.0}"
OPENCODE_PORT="${OPENCODE_PORT:-8998}"
OPENCODE_PROJECT_DIR="${OPENCODE_PROJECT_DIR:-/workspace}"
OPENCODE_MODE="${OPENCODE_MODE:-serve}"
OPENCODE_SERVER_EXTRA_ARGS="${OPENCODE_SERVER_EXTRA_ARGS:-}"

mkdir -p \
  /root/.config/opencode \
  /root/.local/share/opencode \
  /root/.local/state/opencode \
  /root/.cache/opencode \
  "${OPENCODE_PROJECT_DIR}"

cd "${OPENCODE_PROJECT_DIR}"

if [ "$#" -gt 0 ]; then
  exec "$@"
fi

# shellcheck disable=SC2086
exec opencode "${OPENCODE_MODE}" --hostname "${OPENCODE_HOST}" --port "${OPENCODE_PORT}"  ${OPENCODE_SERVER_EXTRA_ARGS}
