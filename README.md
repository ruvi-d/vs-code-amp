# Dev Container Feature: Amp CLI

This repo provides a [dev container Feature](https://containers.dev/implementors/features/) that installs the [Amp CLI](https://ampcode.com) for AI-powered code assistance.

## Usage

Add the feature to your `devcontainer.json`:

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/rdhambarage/vs-code-amp/amp": {}
    }
}
```

After building your dev container, the `amp` command will be available.

## Repo Structure

```
├── src
│   ├── amp
│   │   ├── devcontainer-feature.json
│   │   ├── install.sh
│   │   ├── util.sh
│   │   └── NOTES.md
```

## Publishing

This repo includes GitHub Action workflows to publish the feature to GHCR.
Run the "Release" workflow manually from the Actions tab to publish.

Note: After publishing, mark the GHCR package as `public` in the package settings.
