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
STARTUP_FILE="/etc/rc.local"
# Dependency list
DEPENDENCIES="nano libudev-dev openssl"

echo "This script is about to do the following things to your system:"
echo "  * create /etc/NavasotaBrewing/rtu_conf.yaml if it doesn't already exist"
echo "  * install the following dependecies:"
echo "      $DEPENDENCIES"
echo "  * Install cargo and rustup (if not already present)"
echo "  * Set default rust toolchain to nightly rust"
echo "  * Install the following BCS software:"
echo "      * NBC_cli - the brewery system command line interface"
echo "      * nbc_iris - the RTU server"
echo "  * Create and populate /etc/rc.local file"
echo

echo "Are you sure you want to continue?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) exit;;
  esac
done

echo
echo


function main {
    echo "=== Setting up RTU ==="
    check_dependencies
    # configure_serial_port
    create_configuration
    install_bcs
    set_startup_actions
}

# Dependencies =====================================================
function check_dependencies {
    # Configure system dependencies -------------
    echo
    echo "=== installing dependencies ==="
    sudo apt-get update
    sudo apt-get install -y $DEPENDENCIES

    # Configure rustup/cargo ----------------------------
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
    echo
    echo "=== creating RTU configuration ==="
    
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
    echo
    echo "=== installing BCS ==="

    # CLI --------------------------
    echo "  = Installing CLI =  "
    cargo install NBC_cli
    echo "done."

    # Iris
    echo "  = Installing Iris =  "
    cargo install nbc_iris
    echo "done."
}

function set_startup_actions {
    echo "=== Setting startup actions ==="
    
    if [ ! -f "$STARTUP_FILE" ]; then 
        echo "No $STARTUP_FILE found, creating it..."
        sudo touch $STARTUP_FILE
        echo "Configuring iris to start on Pi startup"
        echo 'nbc_iris &' | sudo tee -a $STARTUP_FILE
        echo "done."
    else
        echo
        echo "$STARTUP_FILE already exists. Would you like to edit it now?"
        echo "I recommend putting \`nbc_iris &\` in there to start the iris server on startup"
        echo ""
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) sudo nano $STARTUP_FILE;;
                No ) break;;
            esac
        done
    fi

}

main
