# Hardening Ubuntu. Systemd edition.  
A quick way to make a Ubuntu server a bit more secure.   
Tested on ```Ubuntu 15.04``` and ```15.10 Ubuntu Wily Werewolf (development branch)```   
Systemd required.  

## Howto
Start the installation of the server.    
Pick language, keyboard layout, timezone and so on as you usually would.  

### Partition the system  
/    
/boot (rw)    
/home (rw,nosuid,nodev)    
swap    
/var      
/var/log (rw,nosuid,nodev,noexec)    
/var/log/audit (rw,nosuid,nodev,noexec)   

Note that ```/tmp``` and ```/var/tmp``` will be added automatically by the script.

### Login, set a Grub2 password, configure and run ubuntu.sh
Do not add any packages.    
Log in.    
Select a Grub2 password (using ```grub-mkpasswd-pbkdf2```).  
Download the script using ```git clone https://github.com/konstruktoid/hardening.git```.   
Change the configuration options and last but not least run the script, ```sudo bash ubuntu.sh```.      

##Configuration options
```FW_ADMIN="127.0.0.1"```  The IP address that will be able to connect with SSH.  
```SSH_GRPS="sudo"``` Which group the users have to be member of in order to acess via SSH.  
```SYSCTL_CONF="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/sysctl.conf"``` Stricter sysctl settings  
```AUDITD_RULES="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/audit.rules"``` Auditd rules  
```NTPSERVERPOOL="0.ubuntu.pool.ntp.org 1.ubuntu.pool.ntp.org 2.ubuntu.pool.ntp.org 3.ubuntu.pool.ntp.org pool.ntp.org"``` NTP server pool   
```VERBOSE="N"``` If you want all the details or not     
```CHANGEME=""``` Add something just to verify that you actually glanced the code    

###Function list  
```pre``` Script setup    
```firewall``` Enable ufw and allow port 22 from ```$FW_ADMIN```  
```disablenet``` Disable misc network protocols  
```disablemnt``` Disable misc file systems  
```disablemod``` Disable misc kernel modules  
```systemdconf``` Systemd/system.conf and Systemd/user.conf  
```journalctl``` Systemd/journald.conf  
```timesyncd``` Systemd/timesyncd.conf  
```fstab``` /etc/fstab, system/tmp.mount and system/var-tmp.mount  
```prelink``` Prelink  
```aptget``` Updating the package index and upgrading installed packages  
```hosts``` /etc/hosts.allow and /etc/hosts.deny  
```logindefs``` /etc/login.defs  
```sysctl``` /etc/sysctl.conf  
```limitsconf``` /etc/security/limits.conf  
```adduser``` /etc/adduser.conf and /etc/default/useradd  
```rootaccess``` /etc/security/access.conf and /etc/securetty  
```packages``` Installing base packages   
```sshdconfig``` /etc/ssh/sshd_config  
```password``` /etc/pam.d/common-password and /etc/pam.d/common-auth  
```cron``` /etc/cron and /etc/at  
```ctrlaltdel``` Ctrl-alt-delete  
```auditd``` Auditd  
```aide``` Aide  
```rhosts``` .rhosts  
```users``` Remove users  
```aptget_clean``` Remove unused packages  
```suid``` Remove suid bits  
```rc``` /etc/init.d/rc  
```path``` Modify paths  
```aa_enforce``` Enforce apparmor profiles  
```aide_post``` Create Aide db  
```aide_timer``` Enable daily Aide check  
```checkreboot``` Check if reboot is required

##Recommended reading:  
[CIS Ubuntu 14.04 LTS Server Benchmark v1.0.0](https://benchmarks.cisecurity.org/downloads/show-single/?file=ubuntu1404.100)  
https://wiki.ubuntu.com/Security/Features     
https://help.ubuntu.com/community/StricterDefaults

