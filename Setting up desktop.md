# Setting up desktop


### packege installs 

```
sudo apt-get update

sudo apt-get install awscli keychain golang tmux python3-pip curl -y
pip3 install --user aws-sam-cli
```

### Prepare bash startup hooks





```
mkdir ~/.bash_profile.d
echo 'export PATH=$PATH:$HOME/.local/bin' > ~/.bash_profile.d/general.source
```

Update `~/.bash_profile` and `~/.bashrc`

```
echo 'for f in  `ls $HOME/.bash_profile.d`; do source   $HOME/.bash_profile.d/${f} ; done' >>  ~/.bash_profile
echo 'for f in  `ls $HOME/.bash_profile.d`; do source   $HOME/.bash_profile.d/${f} ; done' >>  ~/.bashrc
```




### tmux configuration 

`cat > $HOME/.tmux.conf`

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




Setup tmux bash shortcuts

`cat > $HOME/.bash_profile.d/tmux.source`

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

Quick Vim config `cat > $HOME/.vimrc` or `cat > $HOME/.config/nvim/init.vim`

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

Install golang 

```shell
curl -O https://dl.google.com/go/go1.15.6.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz
```


Setup golang bash source in  `cat > $HOME/.bash_profile.d/go.source`


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


`cat > $HOME/.bash_profile.d/keychain.source`

```source $HOME/.keychain/`hostname`-sh
keychain
```

Pet installation 
```shell
$ mkdir -p $GOPATH/src/github.com/knqyf263
$ cd $GOPATH/src/github.com/knqyf263
$ git clone https://github.com/knqyf263/pet.git
$ cd pet
$ make install
```

Setup git config and related ssh config 
`cat > $HOME/.gitconfig`
```
[user]
        name = Valmik Roy
        email = myemail@gmail.com
```
and `cat >> $HOME/.ssh/config`
```
Host github.com-valmikroy
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_rsa_github
```

### install docker 
```shell
 curl -fsSL https://get.docker.com -o get-docker.sh
 sudo sh get-docker.sh
 sudo usermod -aG docker `whoami`
```
