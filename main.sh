#!/bin/bash

# Function to install or update Homebrew
# Documentation: https://brew.sh/
install_or_update_homebrew() {
    echo -e "\n# Installing or updating Homebrew\n"
    if ! command -v brew &> /dev/null; then
        # Homebrew not found, installing it
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/usr/local/bin/brew shellenv)"
    else
        # Homebrew found, updating it
        brew update
    fi
}

# Function to update few aliases
insert_aliases() {
    echo -e "\n# Updating aliases\n"
    local filename="$HOME/.zprofile"
    if [[ $SHELL == "/bin/zsh" ]]; then

        if ! grep -q "alias grep" "$filename"; then
            echo 'alias grep="grep --color"' >> "$filename"
        fi

         if ! grep -q "CLICOLOR=1" "$filename"; then
            echo 'export CLICOLOR=1' >> "$filename"
        fi
    fi
}

# Main script   
install_or_update_homebrew
insert_aliases