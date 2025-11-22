# `neovim-data/` folder

This folder is part of your dotfiles repository and corresponds to the **data directory** for Neovim (typically `~/.local/share/nvim/` on Linux/WSL).  
It contains runtime files such as swap/undo/history/shada files and plugin installations. Since most of these files are auto-generated, 
the folder is largely *ignored* in version control (see `.gitignore` for details).

## 📁 What lives here  
- `shada/`, `undo/`, `swap/`, `session/` etc — Neovim runtime state and history files.  
- `lazy/`, `site/pack/`, `plugins/` folders — plugin manager installation directories (e.g., for lazy.nvim etc).  
- Logs, cache files, build artifacts — ephemeral, machine-specific, and not tracked.

## ✅ What to *track*  
Typically, nothing from this folder needs to be tracked in your dotfiles repo, except perhaps special files you 
manually create and want to version (e.g., custom plugin scripts stored here).  
This folder is configured with `../.gitignore` so that auto-generated files are excluded.

## 🛠 How to link this data directory on a new machine / WSL setup  
1. Create the symlink so that Neovim’s data directory points here:

    ```bash
    ln -s ~/dotfiles/neovim-data ~/.local/share/nvim
    ```

1. Launch Neovim. It will automatically populate this directory (install plugins, create undo files, etc).  

You don’t need to manually copy any data unless you have custom files you wish to keep.

## 📌 Special notes  
- If you use Neovim on **WSL** only, keeping everything under `~/dotfiles/` and linking from `~/.local/share/nvim` keeps your 
setup centralized and version-controlled.  
- If you also use Neovim on **Windows native**, you may opt to reuse this folder or maintain a separate 
`nvim-data` under `%LOCALAPPDATA%`. In that case, you may still symlink or redirect plugin and cache locations via 
config or plugin manager settings.  
- Since plugin managers often install dynamically, tracking the full `lazy/` or `site/pack/` tree is not 
recommended (it’s large, frequently changed, and not portable). Your plugin specs/config should live under 
`dotfiles/neovim/` (the config directory) instead.

---

This directory exists for data that supports your Neovim config (`dotfiles/neovim/`) but which you **don’t normally version-control**. 
If you ever notice “slow startup” due to huge plugin directories, you can safely delete this folder and let Neovim rebuild it 
using your tracked config.


