#!/usr/bin/env sh
set -eu

OPENCODE_HOST="${OPENCODE_HOST:-0.0.0.0}"
OPENCODE_PORT="${OPENCODE_PORT:-${OPENCODE_WEB_PORT:-8998}}"
OPENCODE_PROJECT_DIR="${OPENCODE_PROJECT_DIR:-/workspace}"
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

if opencode server --help >/dev/null 2>&1; then
  set -- opencode server --host "${OPENCODE_HOST}" --port "${OPENCODE_PORT}"
elif opencode serve --help >/dev/null 2>&1; then
  set -- opencode serve --host "${OPENCODE_HOST}" --port "${OPENCODE_PORT}"
else
  echo "Unable to detect supported opencode server command (expected 'server' or 'serve')." >&2
  exit 1
fi

# shellcheck disable=SC2086
exec "$@" ${OPENCODE_SERVER_EXTRA_ARGS}
