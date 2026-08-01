# opensim-opencode

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-bithatch%2Fopensim--opencode-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/repository/docker/bithatch/opensim-opencode)

`opensim-opencode` is a specialized `opencode` container for the OpenSim AI stack.

It starts `opencode` in **server mode** and binds HTTP on container port `8998`.

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

- `opensim-config` -> `/workspace`
- `opencode-config` -> `/root/.config/opencode`
- `opencode-data` -> `/root/.local/share/opencode`
- `opencode-state` -> `/root/.local/state/opencode`
- `opencode-cache` -> `/root/.cache/opencode`

## Build local image

```bash
docker build -t opensim-opencode:local .
```

## Run local image

```bash
docker run --rm \
  -e OPENCODE_HOST=0.0.0.0 \
  -e OPENCODE_PORT=8998 \
  -p 8998:8998 \
  -v opensim-config:/workspace \
  -v opencode-config:/root/.config/opencode \
  -v opencode-data:/root/.local/share/opencode \
  -v opencode-state:/root/.local/state/opencode \
  -v opencode-cache:/root/.cache/opencode \
  opensim-opencode:local
```

## Optional environment variables

- `OPENCODE_WEB_PORT` fallback port variable for stack compatibility
- `OPENCODE_SERVER_EXTRA_ARGS` extra flags appended to server startup command
- `OPENCODE_PROJECT_DIR` override startup/project directory (default `/workspace`)

## Build and publish multiarch image

Create/use a buildx builder once:

```bash
docker buildx create --name multiarch --use
docker buildx inspect --bootstrap
```

Build and push Linux AMD64 + ARM64:

```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t bithatch/opensim-opencode:latest \
  -t bithatch/opensim-opencode:$(date +%Y%m%d) \
  --push \
  .
```
