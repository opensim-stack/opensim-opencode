# opensim-opencode

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-bithatch%2Fopensim--opencode-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/bithatch/opensim-opencode)
[![Docker Publish](https://github.com/opensim-stack/opensim-opencode/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/opensim-stack/opensim-opencode/actions/workflows/docker-publish.yml)

`opensim-opencode` is a specialized `opencode` container for the OpenSim AI stack.

It starts `opencode` in **server mode** and binds HTTP on container port `8998`.

**For Issues And Discussions see main project [opensim-ai-docker](https://github.com/opensim-stack/opensim-ai-docker)**

*This is part of the [opensim-stack](https://opensim-stack.github.io/) and is intended to be used in conjunction with other parts of the stack. See [Docs](https://opensim-stack.github.io/docs/index.html) for full details.*

## What this image does

- Runs `opencode` in server mode (`server` or `serve`, auto-detected)
- Starts from `/workspace` and uses it as the project directory by default
- Keeps persistent state/config/cache/data in dedicated volume mount points
- Supports the same OpenSim stack environment variable conventions where applicable

## Runtime defaults

- `OPENCODE_HOST=0.0.0.0`
- `OPENCODE_PORT=${OPENCODE_PORT:-${OPENCODE_WEB_PORT:-8998}}`
- `OPENCODE_PROJECT_DIR=/workspace`
- Container HTTP listen port: `8998/tcp`

## Required volume mappings

- `opensim-workspace` -> `/workspace`
- `opencode-config` -> `/root/.config/opencode`
- `opencode-data` -> `/root/.local/share/opencode`
- `opencode-state` -> `/root/.local/state/opencode`
- `opencode-cache` -> `/root/.cache/opencode`

## Optional environment variables

- `OPENCODE_SERVER_EXTRA_ARGS` extra flags appended to server startup command
- `OPENCODE_SERVER_PASSWORD` server password value (available for server/auth wiring and stack pass-through)
- `OPENCODE_MODE` override mode, defaults to `serve`, with `web` as an alternative
- `OPENCODE_PROJECT_DIR` override startup directory (default `/workspace`)

## Building and publishing

See `BUILDING.md` for local build/run steps, manual multiarch publish commands, and automated GitHub Actions publish details.
