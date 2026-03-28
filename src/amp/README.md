
# Amp CLI (via ampcode.com/install.sh) (amp)

Installs Amp CLI for AI code assistance https://ampcode.com

## Example Usage

```json
"features": {
    "ghcr.io/ruvi-d/vs-code-amp/amp:0": {}
}
```



# Supported OS

Tested on Alpine, Debian and Ubuntu.

# Get Started

Add the feature to your devcontainer.json: 

```devcontainer.json
{
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/rdhambarage/vs-code-amp/amp": {}
  }
}
```

Start your devcontainer and run: `amp`


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/ruvi-d/vs-code-amp/blob/main/src/amp/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
