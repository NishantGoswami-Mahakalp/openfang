# Docker deployment

Production deployment assets for `fang.mahakalp.dev`.

Files:

- `compose.yaml` - OpenFang container attached to the shared `caddy-net` network
- `compose.build.yaml` - local build overlay for smoke tests and ad-hoc builds
- `.env.example` - environment variable template for provider keys
- `config.toml` - container-ready OpenFang config bound to `0.0.0.0:4200`
- `deploy.sh` - image-based deployment entrypoint for CI/CD

Copy `.env.example` to `.env` before running the stack.

Recommended remote deployment path: `/home/<user>/.openfang`.

Use the shared Caddy network to route `fang.mahakalp.dev` to `openfang:4200`.
