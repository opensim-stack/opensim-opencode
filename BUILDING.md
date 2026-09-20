# Building

Build and publish a multiarch image.

## Local Build

```bash
docker build -t opensim-opencode:local .
```

### Run Local

```bash
docker run --rm \
  -e OPENCODE_HOST=0.0.0.0 \
  -e OPENCODE_PORT=8998 \
  -e OPENCODE_SERVER_PASSWORD=change-me \
  -p 8998:8998 \
  -v opensim-workspace:/workspace \
  -v opencode-config:/root/.config/opencode \
  -v opencode-data:/root/.local/share/opencode \
  -v opencode-state:/root/.local/state/opencode \
  -v opencode-cache:/root/.cache/opencode \
  opensim-opencode:local
```
## Publish

### Setup

Create/use a buildx builder once:

```bash
docker buildx create --name multiarch --use
docker buildx inspect --bootstrap
```

### Build

Build and push Linux AMD64 + ARM64:

```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t bithatch/opensim-opencode:latest \
  -t bithatch/opensim-opencode:$(date +%Y%m%d) \
  --push \
  .
```

## Automated Publish (GitHub Actions)

This repository includes `.github/workflows/docker-publish.yml` to automatically build and push a multiarch image to Docker Hub.

### Triggers

- Pushes to `master` or `main` when `Dockerfile`, `docker/**`, or the workflow itself changes
- Git tags matching `v*`
- Manual `workflow_dispatch`

### Required Repository Secrets

- `DOCKERHUB_USERNAME`: Docker Hub username or org robot account name
- `DOCKERHUB_TOKEN`: Docker Hub access token (recommended) or password

### Published Platforms and Tags

- Platforms: `linux/amd64`, `linux/arm64`
- Tags (default branch): `latest`, `YYYYMMDD`, and `sha-<commit>`
- Tags (tag builds): `<git-tag>` and `sha-<commit>`
