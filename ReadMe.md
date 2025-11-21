# My Dotfiles & System Snapshot

## Zsh Config (add symlinks in ~)
- ~/.zshrc
- ~/.zprofile

## Starship conf (add symlinks in ~/.config)
- -/.config/starship.toml

## Installed Packages (pacman)
```sh
pacman -Qqe > dotfiles/pkglist-repo.txt
```

- pkglist-repo.txt (repository packages)
  
## To restore packages:

```sh
sudo pacman -Syu
sudo pacman -S --needed - < pkglist-repo.txt
```


