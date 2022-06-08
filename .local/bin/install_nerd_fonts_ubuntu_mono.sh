#!/usr/bin/env bash
# curls the Ubuntu/Ubuntu Mono Nerd Fonts v2.1.0 and installs it to ~/.local/share/fonts
dl_dir=${XDG_DOWNLOAD_DIR:-$HOME/Downloads}
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/2.2.0-RC/UbuntuMono.zip -o $dl_dir/UbuntuMono.zip
unzip -u $dl_dir/UbuntuMono.zip -d ~/.local/share/fonts/
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/2.2.0-RC/Ubuntu.zip -o $dl_dir/Ubuntu.zip
unzip -u $dl_dir/Ubuntu.zip -d ~/.local/share/fonts/
fc-cache -fv
