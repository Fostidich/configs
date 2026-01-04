# Local programs
export PATH="$PATH:$HOME/.local/bin"

# .NET
export DOTNET_ROOT="/usr/local/share/dotnet"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$DOTNET_ROOT"

# Cargo
export PATH="$PATH:$HOME/.cargo/bin"

# Go
export PATH="$PATH:$HOME/go/bin"

# FZF
export PATH="$PATH:/opt/homebrew/opt/fzf/bin"

# Java
export PATH="$PATH:/opt/homebrew/opt/openjdk@21/bin"
export JAVA_HOME="/opt/homebrew/opt/openjdk@21"

# Vulkan
export PATH="$PATH:$HOME/.local/VulkanSDK/1.4.304.1/Applications/vkcube.app/Contents/MacOS"
export VULKAN_SDK="$HOME/.local/VulkanSDK/1.4.304.1/macOS"
export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH"
export VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"

# Swiftly
export SWIFTLY_HOME_DIR="$HOME/.swiftly"
export SWIFTLY_BIN_DIR="$HOME/.swiftly/bin"
export SWIFTLY_TOOLCHAINS_DIR="$HOME/Library/Developer/Toolchains"
export PATH="$PATH:$SWIFTLY_BIN_DIR"

# Pyenv
export PATH="$PATH:$HOME/.pyenv/shims"
source "$HOME/.pyenv/env.zsh"

# Homebrew
export HOMEBREW_AUTO_UPDATE_SECS=86400
export HOMEBREW_NO_ENV_HINTS=1
eval "$(/opt/homebrew/bin/brew shellenv)"

