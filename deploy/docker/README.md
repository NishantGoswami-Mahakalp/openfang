# Docker deployment

Production deployment assets for `fang.mahakalp.dev`.

Files:

- `compose.yaml` - OpenFang container bound to `127.0.0.1:4200`
- `compose.build.yaml` - local build overlay for smoke tests and ad-hoc builds
- `.env.example` - environment variable template for provider keys
- `config.toml` - container-ready OpenFang config bound to `0.0.0.0:4200`
- `deploy.sh` - image-based deployment entrypoint for CI/CD

Copy `.env.example` to `.env` before running the stack.

Recommended remote deployment path: `/home/<user>/.openfang`.

Use the host-level reverse proxy to route `fang.mahakalp.dev` to `127.0.0.1:4200`.
