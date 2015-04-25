# Hardening Ubuntu. Systemd edition.  
This is pre-alpha work-in-progress, but will be a simple way to harden a Ubuntu server.   
Tested on Ubuntu 15.04.  
Systemd required.  

## Howto
Start the installation of the server.    
Pick language, keyboard layout, timezone and so on as you usually would.
Partition the system:    
/    
/boot (rw)    
/home (rw,nosuid,nodev)    
swap    
/var     
/var/log (rw,nosuid,nodev,noexec)    
/var/log/audit (rw,nosuid,nodev,noexec)   

Note that /tmp and /var/tmp will be added automatically by the script.

Do not add any packages.    
Log in.     
Download the script.     
Change the configuration options and last but not least run the script.    

##Configuration options
FW_ADMIN="192.168.2.100" *The IP address that will be able to connect with SSH.*  
SSH_GRPS="sudo" *Which group the users have to be member of in order to acess via SSH.*  
FW_SERVICE="https://raw.githubusercontent.com/konstruktoid/hardening/master/config/firewall.service" *Skeleton firewall unit*  
FW_POLICY="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/net/firewall" *Skeleton firewall*  
SYSCTL_CONF="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/sysctl.conf " *Stricter sysctl settings*  
AUDITD_RULES="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/audit.rules" *Auditd rules*    
VERBOSE="N" *If you want all the details or not*     
CHANGEME="" *Add something just to verify that you actually glanced the code*    

##Recommended reading:  
[CIS Ubuntu 14.04 LTS Server Benchmark v1.0.0](https://benchmarks.cisecurity.org/downloads/show-single/?file=ubuntu1404.100)  
https://wiki.ubuntu.com/Security/Features     
https://help.ubuntu.com/community/StricterDefaults
