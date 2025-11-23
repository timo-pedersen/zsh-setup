#!/usr/bin/env sh

pushd ~

rm -f ../dotfiles.zip
zip -r ../dotfiles.zip ./dotfiles \
    -x "*/.git/*" \
       "*/.cache/*" \
       "*/neovim-data/*" \
       "*/swap/*" \
       "*.swp" "*.swo"
cp ../dotfiles.zip "$WIN_HOME/Desktop"
popd

