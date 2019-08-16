# Welcome to Nakanishi's dotfiles

## Preparing

- 自分の設定ファイルがある人は、下記のファイルのバックアップをとってください
    - ~/.bashrc
    - ~/.zshrc
    - ~/.tigrc
    - ~/.tmux.conf
    - ~/.ctags
    - ~/.vimrc

## Installation

```
brew install peco ansible zsh
```

`/etc/shells`にzshのパス(`/usr/local/bin/zsh`)を追加

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
