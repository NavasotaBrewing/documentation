#!/bin/bash

# Configuration path
CONF_DIR="/etc/NavasotaBrewing/"
# Configuration file name
CONF_FILE="rtu_conf.yaml"
# Combined path and file name
CONF_PATH="$CONF_DIR$CONF_FILE"
# This url is the standard configuration file that will be cloned
# The user will be prompted to edit this later
CONF_URL="https://raw.githubusercontent.com/NavasotaBrewing/documentation/master/RTU_Configuration/rtu_conf.yaml"
# This is the default discord webhook. it goes to my personal channel.
# If you want to change this later, just edit ~/.wheres_my_pi on the RTU 
DISCORD_WEBHOOK="https://discord.com/api/webhooks/620679845352833035/worbazhnG9IT6hZfmyZfntVwN07LhoEtzdagAIYJUHOdGO0jy58L7nuq9REKLVNIaNSC"
# Startup commands will go in here
STARTUP_FILE="/etc/rc.local"
# Dependency list
DEPENDENCIES="nano libudev-dev libssl-dev"


function main {
    start_message

    install_dependencies
    
    install_cargo # and also rustup/rustc

    # set_nightly_rust    
    
    create_configuration
    
    # install_wheres_my_pi
    
    install_bcs
    
    set_startup_actions

    post_run_message
}

function start_message {
    echo "=== Setting up RTU ==="
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
    
    confirm
}

function post_run_message {
    echo 
    echo "done."
    echo
    echo "You should restart your system."
    echo "You now have access to the CLI through"
    echo "  $ NBC_cli"
    echo "and iris through"
    echo "  $ nbc_iris"
    echo
    echo "Prost!"
}

function confirm {
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
}

function install_dependencies {
    # Configure system dependencies -------------
    echo
    echo "=== installing dependencies ==="
    sudo apt-get update
    sudo apt-get install -y $DEPENDENCIES
}

function install_cargo {
    # Configure rustup/cargo ----------------------------
    # If cargo is not installed, attempt to install it
    # This pipes to sh, which is usually dangerous but I trust the Rust Foundation
    # Hopefully it returns here fine
    if [ ! -x "$(command -v cargo)" ]; then
        echo
        echo "cargo is not installed. Attempting to install"
        curl https://sh.rustup.rs -sSf | sh
    fi
}

function set_nightly_rust {
    # Set nightly rust
    echo
    echo "Setting Nightly rust"
    ~/.cargo/bin/rustup default nightly
}

function install_wheres_my_pi {
    ~/.cargo/bin/cargo install wheres_my_pi
}

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
        echo -n "Note: your IP is "
        hostname -I
    else
        echo "Creating configuration file ($CONF_PATH)"
        curl -sSfL $CONF_URL | sudo tee $CONF_PATH
        echo
        echo "You're about to edit $CONF_PATH"
        echo "I've put the default configuration file (shown above) in there, so you can"
        echo "follow the format. Just fill out the correct values and write out your devices."
        echo
        echo -n "Note: your IP is "
        hostname -I
        echo "And the USB serial ports in /dev/ I found are:"
        ls /dev | grep ttyUSB
        echo
        echo "Select 1 to start the editor"
        select yn in "start" "continue"; do
            case $yn in
                start ) sudo nano $CONF_PATH;;
                continue ) break;;
            esac
        done
    fi

    # if [ ! -f ~/.wheres_my_pi ]; then
    #     echo "Setting discord webhook in ~/.wheres_my_pi"
    #     echo "If you want to change it, edit ~/.wheres_my_pi"
    #     touch ~/.wheres_my_pi
    #     echo $DISCORD_WEBHOOK > ~/.wheres_my_pi
    # fi
}

function install_bcs {
    echo
    echo "=== installing BCS ==="

    # CLI --------------------------
    echo "  = Installing CLI =  "
    ~/.cargo/bin/cargo install NBC_cli
    echo "done."

    # Iris
    echo "  = Installing Iris =  "
    ~/.cargo/bin/cargo install nbc_iris
    echo "done."
}

function set_startup_actions {
    echo
    echo "=== Setting startup actions ==="
    echo
    echo "You're about to edit $STARTUP_FILE"
    echo "Put the *fully qualified path* to any programs you want to start on boot"
    echo "For example:"
    echo "  $HOME/.cargo/bin/nbc_iris &"
    echo "is the correct line to start iris"
    echo
    echo "Select 1 to start the editor"
    select yn in "start" "continue"; do
        case $yn in
            start ) sudo nano $STARTUP_FILE;;
            continue ) break;;
        esac
    done
}

main
