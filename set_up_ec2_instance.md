# Quickstart EC2 instance 
Refering https://aws.amazon.com/premiumsupport/knowledge-center/new-user-accounts-linux-instance/


### Amazon linux 

```
ssh -i ~/.ssh/mykeypair.pem ec2-user@IP or ssh -i ~/.ssh/mykeypair.pem ubuntu@IP




sudo adduser valmikroy
```

```
sudo su - valmikroy

mkdir ~/.ssh

chmod 700 ~/.ssh

touch ~/.ssh/authorized_keys

chmod 600 ~/.ssh/authorized_keys

cat >> ~/.ssh/authorized_keys

```

SSH public key generation from the private key 
```
 ssh-keygen -y -f id_rsa_valmikroy > id_rsa_valmikroy.pub

```


```
sudo passwd valmikroy

sudo usermod -aG wheel valmikroy  or sudo usermod -aG sudo valmikroy

sudo su -l

echo "valmikroy ALL=(ALL) NOPASSWD:ALL"  > /etc/sudoers.d/99-sudo-user

```

```
ssh valmikroy@IP
```
