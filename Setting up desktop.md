# Setting up desktop



# tmux configuration 

File `~/.tmux.conf`

```
# scollback buffer
set-option -g history-limit 999999

# unbind
unbind C-b
set-option -g prefix C-z
bind-key C-z send-prefix

# splits
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# borders
set -g pane-border-fg green
set -g pane-active-border-fg brightred

# reload
bind r source-file ~/.tmux.conf

# vi movement
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# resize with vim movement
bind H resize-pane -L 10
bind J resize-pane -D 10
bind K resize-pane -U 10
bind L resize-pane -R 10

# bell
set-option -g bell-action any
set-option -g visual-bell on

# maximization of pane is C-z z , readily solved in new version of tmux
# assh setup

# Copy paste with vim movement

setw -g mode-keys vi
bind [ copy-mode
#bind -t vi-copy v begin-selection
#bind -t vi-copy y copy-selection
#bind -t vi-copy V rectangle-toggle

bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection
bind-key -T copy-mode-vi V send-keys -X rectangle-toggle
#bind ] paste-buffer
bind p paste-buffer

# buffer
bind Space choose-buffer

# zoom in/out
bind Up resize-pane -Z
bind Down resize-pane -Z

# display pane color
set-option -g display-panes-active-colour blue
set-option -g display-panes-colour brightred
```

Create bash profile dir 

```
~/.bash_profile.d
```

Update `~/.bash_profile`

```
echo 'source ~/.bash_profile.d/*' >>  ~/.bash_profile
echo 'source ~/.bash_profile.d/*' >>  ~/.bashrc
```





Setup tmux bash shortcuts

File `~/.bash_profile.d/tmux.source`

```shell
function assh {

        if [ -z $TMUX ]
        then
                command ssh -A "$@"
        else
                tmux rename-window "$(echo $* | cut -d . -f 1)"
                #tmux set-window-option -g window-status-bg brightred >/dev/null
                command ssh -o ForwardAgent=yes  -o StrictHostKeyChecking=no -o BatchMode=yes  "$@"
                tmux set-window-option automatic-rename "on" 1>/dev/null
                #tmux set-window-option -g window-status-bg green >/dev/null
        fi

}



function _tls {
        tmux ls
}

function _tnew {
        tmux new -s $1
}

function _tattach {
        tmux attach -d -t $1
}

```

Quick Vim config `.vimrc` or `.config/nvim/init.vim`

```
" Turn on syntax highlighting
syntax on

" Blink cursor on error instead of beeping (grr)
set visualbell

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Forget being compatible with good ol' vi
set nocompatible


syntax on

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

set pastetoggle=<F2>
```


Setup golang bash source in  `.bash_profile.d/go.source`
```shell
export GOROOT=/usr/local/go
test -d $HOME/goworkspace || mkdir $HOME/goworkspace
export GOPATH=$HOME/goworkspace
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```


Install rvm and ruby 
```shell
export rvm_ignore_gemrc_issues=1
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s  --  --auto-dotfiles
source  /home/users/abhsawan/.profile
rvm install ruby
rvm --default use ruby
gem install bundle
```

Keychain installation 
```shell
apt-get install keychain
echo keychain > ~/.bash_profile.d/keychain.source
```

Pet installation 
```shell

```
