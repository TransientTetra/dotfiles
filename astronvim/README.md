# AstroNvim User Configuration Example

A user configuration template for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone --depth 1 https://github.com/TransientTetra/astronvim_user_config.git ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```

#### Todo
- Add DAP virtual text (i.e. variable values when debugging)
- Transparency
- Add mappings - f+g, find in current buffer for Telescope; change session mappings; u+r for relative toggle
- Icons - red x in tabs; DAP breakpoint icon color
- Rounded borders for lazy, mason and which key
- Sessions - no auto create and auto open for cwd 
- Mason and lazy icons
- Tab width deduction
- Git blame for whole file
- Autosave
- Fix encoding error for clangd (previous implementation borked dap keymaps, commented out)
