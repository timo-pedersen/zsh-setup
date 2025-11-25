# My Dotfiles & System Snapshot

## Zsh Config (add symlinks in ~)
- ~/.zshrc
- ~/.zprofile

## Starship conf (add symlinks in ~/.config)
- -/.config/starship.toml

## Installed Packages (pacman)
- pkglist-repo.txt (repository packages)

### Update list with:

scripts/update-pkg-list.sh

Cli:

```sh
pacman -Qqe > dotfiles/pkglist-repo.txt
```

### To restore packages:

scripts/restore-packages.sh

Cli:
```sh
sudo pacman -Syu
dos2unix pkglist-repo.txt
sudo pacman -S --needed $(cat pkglist-repo.txt)
```

## Bootstrapping on a fresh system
```sh
cd ~
git clone https://github.com/timo-pedersen/zsh-setup.git dotfiles
cd dotfiles
# Symlink creation
ln -s ~/dotfiles/zsh/.zshrc     ~/.zshrc
ln -s ~/dotfiles/zsh/.zprofile  ~/.zprofile
ln -s ~/dotfiles/conf/starship.toml ~/.config/starship.toml

## Neovim

NeoVim conf lives in neovim directory. Symlink like this:

```sh
ln -s ~/dotfiles/neovim ~/.config/nvim
```







