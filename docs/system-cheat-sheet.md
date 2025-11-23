# System cheat sheet

## 1. Neovim – Core Keymaps
Leader
<leader> = Space

Navigation / Editing

Move selected lines (visual mode):

J   → move down
K   → move up


Clear search highlight:

<leader>h


Delete without polluting registers:

<leader>d


Yank to system clipboard:

<leader>y (normal/visual)
<leader>Y (line)

Quickfix

Next / previous:

<leader>9 → cnext
<leader>8 → cprevious


Open / close QF:

<leader>qo
<leader>qc

## 2. Telescope (fzf-native)
Find
<leader>ff   → find files
<leader>fg   → live grep
<leader>fb   → buffers
<leader>fh   → help tags

Inside Telescope
<C-q>   → send results → quickfix
<C-x>   → open split
<C-v>   → open vsplit
<C-t>   → open tab

## 3. tmux (prefix = Ctrl-b)

(You can switch to Ctrl-a later, keep defaults initially)

Sessions
tmux              → new session
tmux new -s name  → named session
tmux ls           → list
tmux attach       → reattach
tmux attach -t n  → attach specific
Ctrl-b d          → detach

Kill session
tmux kill-session -t name
tmux kill-server      → kill all

Windows (tabs)
Ctrl-b c   → new window
Ctrl-b n   → next
Ctrl-b p   → previous
Ctrl-b w   → list windows

Panes (splits)
Ctrl-b "   → horiz split
Ctrl-b %   → vert split
Ctrl-b arrow-key → move
Ctrl-b x   → kill pane

## 4. fzf (shell)
Common commands
fzf                 → fuzzy search thru files/dirs
history | fzf       → fuzzy history
rg foo | fzf        → fuzzy grep results

fzf shortcuts:

<Tab> → multi-select

<Ctrl-c> or <Esc> → quit

<Ctrl-p>/<Ctrl-n> → up/down

## 5. Arch pacman
Install packages
sudo pacman -S pkg

Update
sudo pacman -Syu

Reinstall from pkglist
sudo pacman -S --needed - < pkglist-repo.txt

Save currently installed packages
pacman -Qqe > dotfiles/pkglist-repo.txt

## 6. WSL Essentials
Show WSL version
wsl -l -v

Restart WSL
wsl --shutdown

Access Windows FS
/mnt/c/...

Run Windows executable
notepad.exe file.txt

## 7. zsh Basics
Reload config
source ~/.zshrc

Aliases
alias gs="git status"
alias ll="ls -la"

Reverse search
Ctrl-r

Globbing
**/*.cs
**/bin/**

## 8. Git (your dual setup)
Windows Git (corporate)
wgit <command>

WSL Git (plugins + normal repos)
git <command>

Status & diffs in Neovim

gitsigns gutter symbols

:Gitsigns blame_line

:Gitsigns stage_hunk

:Gitsigns reset_hunk

## 9. Dotfiles repo structure
dotfiles/
  .zshrc
  .zprofile
  starship.toml
  pkglist-repo.txt
  neovim/
    init.lua
    lua/
      core/
        options.lua
        keymaps.lua
      plugins/
        init.lua
  neovim-data/

Symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

ln -s ~/dotfiles/neovim ~/.config/nvim
ln -s ~/dotfiles/neovim-data ~/.local/share/nvim


