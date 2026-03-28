# Supported OS

Supports Debian and Ubuntu based images only. Alpine is not supported.

# Get Started

Add the feature to your devcontainer.json: 

```devcontainer.json
{
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/ruvi-d/vs-code-amp/amp": {}
  }
}
```

Start your devcontainer and run: `amp`
