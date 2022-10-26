#!/bin/bash

# Configuration path
CONF_DIR="/etc/NavasotaBrewing/"
# Configuration file name
CONF_FILE="rtu_conf.yml"
# Combined path and file name
CONF_PATH="$CONF_DIR$CONF_FILE"
# This url is the standard configuration file that will be cloned
# The user will be prompted to edit this later
CONF_URL="https://raw.githubusercontent.com/NavasotaBrewing/documentation/master/RTU_Configuration/rtu_conf.yaml"
# Dependency list
DEPENDENCIES="vim libudev-dev openssl"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

function main {
    echo "=== Setting up RTU ==="
    # check_dependencies
    # configure_serial_port
    # create_configuration
    install_bcs
}

# Dependencies =====================================================
function check_dependencies {
    # Configure system dependencies -------------
    echo
    echo " === installing dependencies ==="
    sudo apt-get update
    sudo apt-get install -y $DEPENDENCIES

    # Configure Rust ----------------------------
    # If cargo is not installed, attempt to install it
    # This pipes to sh, which is usually dangerous but I trust the Rust Foundation
    # Hopefully it returns here fine
    if [ ! -x "$(command -v cargo)" ]; then
        echo
        echo "cargo is not installed. Attempting to install"
        curl https://sh.rustup.rs -sSf | sh
    fi
    # Set nightly rust
    echo
    echo "Setting Nightly rust"
    rustup default nightly
}

# Serial Port Stuff ================================================
# function configure_serial_port {
#     # This does nothing at the moment
# }

# Configuration Stuff ==============================================
function create_configuration {

    # If the configuration directory doesn't exist, create it
    if [ ! -d $CONF_DIR ]; then
        sudo mkdir $CONF_DIR
    fi


    if [ -f $CONF_PATH ]; then
        echo "Configuration file already exists at $CONF_PATH"
        echo "I would check the configuration file and make sure it's set up how you want it."
    else
        echo "Creating configuration file ($CONF_PATH)"
        sudo curl $CONF_URL >> $CONF_PATH
        sudo nano $CONF_PATH
    fi
}

# Install BCS Software =============================================
function install_bcs {
    # CLI --------------------------
    cargo install NBC_cli

    # Iris
    cargo install nbc_iris
}

main
