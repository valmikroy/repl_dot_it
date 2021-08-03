Use above shell files with following structure

```
mkdir ~/.bash_profile.d
ln -sf /home/valmikroy/git/repl_dot_it/files/shell/general.source ~/.bash_profile.d/
ln -sf /home/valmikroy/git/repl_dot_it/files/shell/helper.source ~/.bash_profile.d/
ln -sf /home/valmikroy/git/repl_dot_it/files/shell/tmux.source ~/.bash_profile.d/


```

Add following line to source above files in the `.bashrc`

```
for f in  `ls $HOME/.bash_profile.d`; do source   $HOME/.bash_profile.d/${f} ; done
```
