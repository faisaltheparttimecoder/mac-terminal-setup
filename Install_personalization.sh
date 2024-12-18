#!/bin/bash

# Function to install rectangle
# Documentation: https://github.com/rxhanson/Rectangle
# Description: For window resize and drag and drop operation
install_rectangle() {
    echo -e "\n# Installing Rectangle \n"
    if mdfind "kMDItemDisplayName == '*Rancher*'" | grep ".app"; then
        brew upgrade --cask rectangle
    else
        brew install --cask rectangle
    fi
}


# Main script 
install_rectangle