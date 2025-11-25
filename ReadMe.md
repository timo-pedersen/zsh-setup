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
ln -s ~/dotfiles/zsh/.zshrc     ~/.zshrc
ln -s ~/dotfiles/zsh/.zprofile  ~/.zprofile
ln -s ~/dotfiles/conf/starship.toml ~/.config/starship.toml

### To restore packages:

```sh
sudo pacman -Syu
dos2unix pkglist-repo.txt
sudo pacman -S --needed $(cat pkglist-repo.txt)
```

## Neovim

NeoVim conf lives in neovim directory. Symlink like this:

```sh
ln -s ~/dotfiles/neovim ~/.config/nvim
```







