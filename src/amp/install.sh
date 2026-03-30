#!/bin/sh
set -e
. ./util.sh

APT_CLEANUP_REQUIRED=0
APT_UPDATE_REQUIRED=1

# Make sure there isn't already an installation of the tool
remote_user_has_command amp && {
    version=$(remote_user_run 'amp --version')
    echo "Amp CLI $version is already installed"
    exit 0
}

# dependencies
has_command curl || {
    echo "curl not found, installing via apt-get..."
    apt-get update
    apt-get install -y --no-install-recommends curl ca-certificates
    APT_UPDATE_REQUIRED=0
    APT_CLEANUP_REQUIRED=1
}

has_command xdg-open || {
    echo "xdg-open not found, installing via apt-get..."
    if [ $APT_UPDATE_REQUIRED -eq 1 ];then
        apt-get update
    fi
    apt-get install -y xdg-utils
    APT_CLEANUP_REQUIRED=1
}

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

# apt clean ups
if [ $APT_CLEANUP_REQUIRED -ne 0 ]; then
    apt-get clean
    rm -rf /var/lib/apt/lists/* /var/tmp/*
fi
