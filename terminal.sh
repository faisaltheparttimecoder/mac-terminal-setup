#!/bin/bash

# Function to install or update Warp Terminal
# Documentation: https://www.warp.dev/
install_warp_terminal() {
    echo -e "\n# Installing or updating Warp Terminal\n"
    if mdfind "kMDItemDisplayName == 'Warp'" | grep -q ".app"; then
        # Warp found, updating it
        brew upgrade --cask warp
    else
        # Warp not found, installing it
        brew install --cask warp
    fi
}

# Function to install Catppuccin themes for Warp if they don't exist
# Documentation: https://github.com/catppuccin/warp
install_warp_themes() {
    WARP_THEMES_DIR="$HOME/.warp/themes"
    echo -e "\n# Installing Catppuccin themes for Warp\n"
    mkdir -p "$WARP_THEMES_DIR"
    for theme in "catppuccin_latte.yml" "catppuccin_frappe.yml" "catppuccin_macchiato.yml" "catppuccin_mocha.yml"; do
        curl -sS -o "$WARP_THEMES_DIR/$theme" "https://raw.githubusercontent.com/catppuccin/warp/main/dist/$theme"
    done
}

# Function to install Nerd Fonts
# Documentation: https://webinstall.dev/nerdfont/
install_nerd_fonts() {
    echo -e "\n# Installing Nerd Fonts\n"
    curl -sS https://webi.sh/nerdfont | sh
}

# Function to install starship
# Documentation: https://starship.rs/
install_starship() {
    echo -e "\n# Installing Starship shell prompt\n"
    if ! command -v starship &> /dev/null; then
        brew install starship
        if [[ $SHELL == "/bin/zsh" ]]; then
            echo -e '\n# Installing starship prompt\n' >> "$HOME/.zshrc"
            echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
        fi
    else
        brew upgrade starship
    fi
}

# Function to setup Starship shell custom preset
install_starship_custom_preset() {
    echo -e "\n# Setting up Starship shell custom preset\n"
    STARSHIP_THEMES_DIR="$HOME/.config"
    backup_file="${STARSHIP_THEMES_DIR}/starship.toml.backup_$(date +"%Y_%m_%d_%H_%M_%S")"
    # Create a backup file of the existing starship theme
    if [[ -f "${STARSHIP_THEMES_DIR}/starship.toml" ]]; then
        mv "${STARSHIP_THEMES_DIR}/starship.toml" "$backup_file"
    fi
    cp ./starship.toml "${STARSHIP_THEMES_DIR}/starship.toml"
}

# Main script   
install_warp_terminal
install_warp_themes
install_nerd_fonts
install_starship
install_starship_custom_preset


# Print messages to the user on the screen on the steps to be done
echo '
################################################################################
Please follow the instructions below to complete the setup process.

Open Warp app and navigate to Settings > Appearance
    - Select the theme of choice
    - On the Prompt section choose the Shell Prompt (PS1) to set starship has the theme
    - On text - terminal font, choose "DroidSansMono Nerd Font"
################################################################################
'