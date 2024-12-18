#!/bin/bash

# Function to install rancher
# Documentation: https://www.rancher.com/products/rancher-desktop
# Description: For local docker and kubernetes setup
install_rancher() {
    echo -e "\n# Installing Rancher Desktop\n"
    if mdfind "kMDItemDisplayName == '*Rancher*'" | grep ".app"; then
        brew upgrade --cask rancher
    else
        brew install --cask rancher
    fi
}

# Function to install Visual Studio Code
# Documentation: https://code.visualstudio.com/
# Description: The best IDE for programming
install_visual_studio_code() {
    echo -e "\n# Installing Visual Studio Code\n"
    if ! command -v code &> /dev/null; then
        brew install --cask visual-studio-code
        echo 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' >> "$HOME/.zprofile"  
    else 
        brew upgrade --cask visual-studio-code
    fi
}

# Function to install Visual Studio Code extensions
# Description: Some of the best visual studio extensions
install_visual_studio_code_extensions() {
    echo -e "\n# Installing Visual Studio Code Extensions\n"

    # Material themes icon pack
    code --install-extension PKief.material-icon-theme --force

    # Codium AI 
    code --install-extension Codium.codium --force

    # Tabnine AI
    code --install-extension TabNine.tabnine-vscode --force

    # Grubox Theme
    code --install-extension sainnhe.gruvbox-material --force

    # Dev containers
    code --install-extension ms-vscode-remote.vscode-remote-extensionpack --force

    # Code Formatter for javascripts
    code --install-extension esbenp.prettier-vscode --force

    # Code formatter for python
    code --install-extension ms-python.black-formatter --force

    # Color Highlighter
    code --install-extension naumovs.color-highlight --force
}

# Function to install sublime text
# Documentation: https://www.sublimetext.com/index2
# Description: Text editor
install_sublime_text() {
    echo -e "\n# Installing Sublime Text\n"
    if mdfind "kMDItemDisplayName == '*Sublime*'" | grep ".app"; then
        brew upgrade --cask sublime-text
    else
        brew install --cask sublime-text
    fi
}


# Main script 
install_rancher
install_visual_studio_code
install_visual_studio_code_extensions
install_sublime_text


# Print messages to the user on the screen on the steps to be done
echo '
################################################################################
Please follow the instructions below to complete the setup process.

Open VScode app and activate extension
    - Press Cmd + shift + p
    - Type in "Preferences: Open User Settings (JSON)" and click to open
    - Copy paste the below settings to activate the extensions 

    {
        "workbench.colorTheme": "Gruvbox Material Dark",
        "window.titleBarStyle": "custom",
        "workbench.iconTheme": "material-icon-theme",
        "terminal.external.osxExec": "terminal.app",
        "terminal.integrated.fontFamily": "DroidSansMono Nerd Font",
        "tabnine.experimentalAutoImports": true,
        "editor.formatOnSave": true,
        "editor.formatOnPaste": true,
        "files.autoSave": "afterDelay",
        "[python]": {
            "editor.defaultFormatter": "ms-python.black-formatter"
        },
        "[javascript]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode"
        },
        "go.goroot": "$HOME/.goenv/shims/"
    }
################################################################################
'

