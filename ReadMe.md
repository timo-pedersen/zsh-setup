# My Dotfiles & System Snapshot

## Zsh Config (add symlinks in ~)
- ~/.zshrc
- ~/.zprofile

## Starship conf (add symlinks in ~/.config)
- -/.config/starship.toml

## Installed Packages (pacman)
- pkglist-repo.txt (repository packages)

Update list with:
```sh
pacman -Qqe > dotfiles/pkglist-repo.txt
```

## Bootstrapping on a fresh system
```sh
cd ~
git clone <repo-url> dotfiles
cd dotfiles
# Symlink creation
ln -s ~/dotfiles/.zshrc     ~/.zshrc
ln -s ~/dotfiles/.zprofile  ~/.zprofile
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

### To restore packages:

```sh
sudo pacman -Syu
sudo pacman -S --needed - < pkglist-repo.txt
```

## Neovim

NeoVim conf lives in neovim directory. Symlink like this:

```sh
ln -s ~/dotfiles/neovim ~/.config/nvim
```

Neovim data lives in neovim-data direcory and holds runtime files, plugin installs and 
should mostly be ignored in version control.

Symlink like this:

```sh
ln -s ~/dotfiles/neovim-data ~/.local/share/nvim
```







