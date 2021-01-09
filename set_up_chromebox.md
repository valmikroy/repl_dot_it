# developer mode
- turn on developer mode using normal keyboard
- once booted - find a root shell with alt-ctrl-f2
- login as a `root` and default password `test0000`
- change root password 
- create your own user  and add it into sudoers file 
- this user will allow you to login over the ssh connection
- disable root login over ssh `PermitRootLogin` in `/etc/ssh/sshd_config`

# Install crouton 
```
sudo crouton -r xenial -t core -n xenial_workspace
sudo enter-chroot -n xenial_workspace
# dropin function 

function _start_xenial {
	sudo enter-chroot -n xenial_workspace
}

```

Cheatsheet
https://github.com/dnschneid/crouton/wiki/Crouton-Command-Cheat-Sheet
https://github.com/dnschneid/crouton/blob/master/README.md
