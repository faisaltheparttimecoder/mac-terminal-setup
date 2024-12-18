# Mac Terminal Setup

Welcome to the Mac Terminal Setup repository! This repository contains a collection of scripts designed to quickly set up your macOS system for development purposes. These scripts automate the installation of essential tools, utilities, and configurations, saving you time and effort.

# Installation Scripts
1. [install_bash.sh](/Install_base.sh)
    - Installs Homebrew, a package manager for macOS.
    - Enhances terminal display by adding color to file listings.
2. [install_languages_env.sh](/install_languages_env.sh)
    - Installs Pyenv for managing Python environments.
    - Installs Goenv for managing Go environments.
    - Installs Nvm for managing Node.js environments.
3. [install_terminal.sh](/Install_terminal.sh)
    - Installs Warp Terminal for an enhanced terminal experience.
    - Applies a custom Warp theme for visual appeal.
    - Installs Nerd Fonts to support various icons and glyphs.
    - Installs Starship and customizes the terminal prompt line for improved readability.
4. [install_utilities.sh](/install_utilities.sh)
    - Installs Rancher Desktop, providing Docker and Kubernetes instances.
    - Installs Visual Studio Code, a versatile integrated development environment (IDE).
    - Configures Visual Studio Code with essential extensions.
    - Installs Sublime TextEditor for additional coding options.
4. [install_personalization.sh](/install_personalization.sh)
    - Installs Rectangle, provides keyboard shortcuts for window resizing.

# How to Run

Clone the repository to your local machine:

```
cd /tmp
git clone https://github.com/faisaltheparttimecoder/mac-terminal-setup
```

Navigate to the cloned repository directory:

```
cd mac-terminal-setup
```

Execute the base script first, followed by others in any order of your choice:

```
/bin/bash install_bash.sh
/bin/bash install_languages_env.sh
/bin/bash install_terminal.sh
/bin/bash install_utilities.sh
/bin/bash install_personalization.sh
```

# License

This project is licensed under the [MIT License](/LICENSE).