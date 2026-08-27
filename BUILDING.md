### Building

## Build local image

```bash
docker build -t opensim-opencode:local .
```

## Run local image

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
