# Welcome to Nakanishi's dotfiles

## Requirements

- MacOS

## Preparing

- 自分の設定ファイルがある人は、下記のファイルのバックアップをとってください

```
cp ~/.bashrc ~/.bashrc.old
cp ~/.zshrc ~/.zshrc.old
cp ~/.tigrc ~/.tigrc.old
cp ~/.tmux.conf ~/.tmux.conf.old
cp ~/.ctags ~/.ctags.old
cp ~/.vimrc ~/.vimrc.old
```

## Installation

1. 下記コマンドを順番に実行してください

```
brew install peco ansible
git clone https://github.com/NakanishiTetsuhiro/dotfiles $HOME/dotfiles
ansible-playbook $HOME/dotfiles/ansible/deploy.yml -i $HOME/dotfiles/ansible/hosts
```

2. Preztoをインストールしてください

https://github.com/sorin-ionescu/prezto#manual

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

3. Preztoの設定ファイルのシンボリックリンクを作成してください

`.zshrc` はこのdotfilesのものを使用するため、**zshrc以外**をリンクします。
（`~/.zpreztorc` が無いとPreztoのモジュールが読み込まれず、シェル起動時に `command not found: prompt` エラーが発生します）

```
ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -s ~/.zprezto/runcoms/zlogin    ~/.zlogin
ln -s ~/.zprezto/runcoms/zlogout   ~/.zlogout
ln -s ~/.zprezto/runcoms/zshenv    ~/.zshenv
```

- Prezto公式READMEに記載されているfor文でのリンク作成は使用しないでください
  - `setopt EXTENDED_GLOB` が前提のコマンドですが、このdotfilesの `.zshrc` は `NO_EXTENDED_GLOB` を設定しているため失敗します
  - また、`~/.zshrc` がPrezto付属のものに置き換わってしまう可能性があります
- `~/.zprofile` は既存のファイル（Homebrewの設定など）がある場合はそのまま残してください

## Dependencies

- https://github.com/peco/peco
- https://github.com/sorin-ionescu/prezto

## Blog

http://kaoru6strings.hatenablog.com/

## Lincense

Nakanishi's dotfiles is released under the MIT license.
