# opensim-opencode

`opensim-opencode` is a containerized `opencode` server image tailored for the OpenSim AI stack.

It is intended to be used as part of the **OpenSim Stack** project:
**"A docker stack to get an AI integrated virtual world up and running in minutes."**

## What This Image Does

- Runs `opencode` in server mode
- Binds HTTP on container port `8998`
- Starts in `/workspace` and uses it as the project directory
- Uses persistent directories for config/state/cache/data

## Required Volume Mounts

- `opensim-config` -> `/workspace`
- `opencode-config` -> `/root/.config/opencode`
- `opencode-data` -> `/root/.local/share/opencode`
- `opencode-state` -> `/root/.local/state/opencode`
- `opencode-cache` -> `/root/.cache/opencode`

## Quick Start

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
  bithatch/opensim-opencode:latest
```

## Project Links

- Main AI Stack (`opensim-ai-docker`): https://github.com/opensim-stack/opensim-ai-docker
- `opensim-opencode` on GitHub: https://github.com/opensim-stack/opensim-opencode
- Related MCP servers:
  - `opensim-console2mcp`: https://github.com/opensim-stack/opensim-console2mcp
  - `opensim-metaverse2mcp`: https://github.com/opensim-stack/opensim-metaverse2mcp
