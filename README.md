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

```
brew install peco ansible
chsh -s /bin/zsh
```

ログアウトしてログイン

```
git clone https://github.com/NakanishiTetsuhiro/dotfiles $HOME/dotfiles
ansible-playbook $HOME/dotfiles/ansible/deploy.yml -i $HOME/dotfiles/ansible/hosts
```

## Dependencies

- https://github.com/peco/peco

## Blog

http://kaoru6strings.hatenablog.com/

## Lincense

Nakanishi's dotfiles is released under the MIT license.
