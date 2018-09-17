# Neovim config file

## Install [vim-plug](https://github.com/junegunn/vim-plug#neovim) (for neovim on unix)

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


## Install [deoplete](https://github.com/Shougo/deoplete.nvim#requirements)

```bash
pip3 install --user neovim
```


## Install [go](https://github.com/zchee/deoplete-go#3-install-latest-of-gocode)

```bash
sudo pacman -S go
export GOPATH=$HOME/.local/share/go
export PATH=$GOPATH/bin:$PATH
go get -u github.com/mdempsky/gocode
```


## Install [php](https://github.com/lvht/phpcd.vim#system-requirement)

```bash
sudo pacman -S composer
pecl install msgpack
```


## Install [javascript](https://github.com/carlitux/deoplete-ternjs#required)

```bash
sudo pacman -S nodejs npm yarn
echo 'prefix=~/.local/share/node_modules'
export PATH=$HOME/.local/share/node_modules/bin:$PATH
```

> Edit ~/.tern-config

```json
{
  "libs": [
    "browser",
    "jquery"
  ],
  "loadEagerly": [
    "importantfile.js"
  ],
  "plugins": {
    "requirejs": {
      "baseURL": "./",
      "paths": {}
    }
  }
}
```


## Install [python](https://github.com/zchee/deoplete-jedi#required)

```bash
pip3 install --user jedi # for deoplete
pip3 install --user yapf # for autoformat
```


## Install [gtags](https://spacevim.org/layers/tags/). Source code: ([global](https://www.gnu.org/software/global/download.html))

```bash
# install tools
sudo pacman -S ctags python-pygments

# download & unpack
cd /tmp
curl -O https://www.tamacom.com/global/global-6.6.2.tar.gz
tar -xf global-6.6.2.tar.gz

# config & build
cd global-6.6.2
./configure --with-exuberant-ctags=/usr/bin/ctags
make
sudo make install

# needed
cp gtags.conf ~/.globalrc
echo export GTAGSLABEL=pygments >> .profile

# remove
cd ..
rm -rf global*
```

> [Key Mapping](https://github.com/jsfaint/gen_tags.vim#key-mapping)

```vim
Ctrl+\ c    Find functions calling this function
Ctrl+\ d    Find functions called by this function
Ctrl+\ e    Find this egrep pattern
Ctrl+\ f    Find this file
Ctrl+\ g    Find this definition
Ctrl+\ i    Find files #including this file
Ctrl+\ s    Find this C symbol
Ctrl+\ t    Find this text string
```

## Enable Chinese format

Edit /etc/locale.conf

```
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
```

```bash
sudo locale-gen
```
