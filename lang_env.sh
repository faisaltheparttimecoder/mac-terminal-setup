#!/bin/bash

# Function to install pyenv for managing python environment
# Documentation: https://github.com/pyenv/pyenv
install_pyenv() {
    echo -e "\n# Installing pyenv \n"
    if ! command -v pyenv &> /dev/null; then
        brew install pyenv
        if [[ $SHELL == "/bin/zsh" ]]; then
            echo -e '\n# Installing pyenv specific env variables \n' >> "$HOME/.zshrc"
            echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME/.zshrc"
            echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> "$HOME/.zshrc"
            echo 'eval "$(pyenv init -)"' >> "$HOME/.zshrc"
        fi
    else
        brew upgrade pyenv
    fi
}


# Function to install goenv for managing go environment
# Documentation: https://github.com/go-nv/goenv/
install_goenv() {
    echo -e "\n# Installing goenv \n"
    if ! command -v goenv &> /dev/null; then
        brew install goenv
        if [[ $SHELL == "/bin/zsh" ]]; then
            echo -e '\n# Installing goenv specific env variables \n' >> "$HOME/.zshrc"
            echo 'export GOENV_ROOT="$HOME/.goenv"' >> "$HOME/.zshrc"
            echo '[[ -d $GOENV_ROOT/bin ]] && export PATH="$GOENV_ROOT/bin:$PATH"' >> "$HOME/.zshrc"
            echo 'eval "$(goenv init -)"'  >> "$HOME/.zshrc"
        fi
    else
        brew upgrade goenv
    fi
}

# Function to install nvm for managing node environment
# Documentation: https://github.com/nvm-sh/nvm
install_nvm() {
    echo -e "\n# Installing nvm \n"
    # Install or upgrade nvm
    export NVM_DIR="$HOME/.nvm" && (
        git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
        ) && \. "$NVM_DIR/nvm.sh"
    if ! command -v nvm &> /dev/null; then
        if [[ $SHELL == "/bin/zsh" ]]; then
            echo -e '\n# Installing nvm specific env variables \n' >> "$HOME/.zshrc"
            echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.zshrc"
            echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> "$HOME/.zshrc"
            echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'  >> "$HOME/.zshrc"
        fi
    fi
}

# Main script 
install_pyenv
install_goenv
install_nvm