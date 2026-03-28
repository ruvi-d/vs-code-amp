#!/bin/sh
set -e
. ./util.sh

# Make sure there isn't already an installation of the tool
remote_user_has_command amp && {
    version=$(remote_user_run 'amp --version')
    echo "Amp CLI $version is already installed"
    exit 0
}

# dependencies
has_command curl || {
    echored "ERROR: This feature requires curl to be installed. Install with devcontainer feature ghcr.io/devcontainers/features/common-utils"
    exit 1
}

# alpine dependencies
ensure_bash_on_alpine
if os_alpine ; then 
    apk add --no-cache libgcc libstdc++ ripgrep
fi

# install Amp CLI
echo "Installing Amp CLI via https://ampcode.com/install.sh"
echo ""
echo "Note: Amp install script does not output progress..."
# Run the install as the remote user, as script installs locally
remote_user_run 'curl -fsSL https://ampcode.com/install.sh | bash'
add_to_user_profiles 'export PATH="$HOME/.local/bin:$PATH"'

# Verify installation
remote_user_has_command amp && {
    version=$(remote_user_run 'amp --version')
    echo "Amp CLI $version installed successfully"
}
