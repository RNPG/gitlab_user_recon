# <img src="https://camo.githubusercontent.com/92155145d11c0c16b6d804cf10407c691d134283ced40c36ceecfb885b8b655c/68747470733a2f2f6564656e742e6769746875622e696f2f537570657254696e7949636f6e732f696d616765732f7376672f6769746c61622e737667" height=40 width=40> gitlab_user_recon
<img src="https://img.shields.io/badge/bash-script-orange">    <img src="https://img.shields.io/badge/user-enumeration-brightgreen">    <img src="https://img.shields.io/badge/Tested%20on-Kali%20Linux%202021.1-blueviolet">    <img src="https://img.shields.io/badge/GitLab%20CE-13.10.3-blue">    <img src="https://img.shields.io/badge/version-1.0-ff69b4">

This is a tool that can help ethical hackers or penetration testers to find automatically the usernames that exist on a self hosted instance of GitLab CE (Community Edition) from their targets' network. 

## Disclaimer
*Do not run this script against  <a href="https://gitlab.com">Gitlab.com</a> ! Also keep in mind that this PoC is meant only for educational purpose and ethical use. Running it against systems that you do not own or have the right permission is totally on your own risk.*

## Technical Analysis
GitLab's path `http://<gitlab>/<username>` can help an intruder to find its valid usernames. Basically this scrpit will test various usernames in the mentioned URL to find valid usernames of GitLab. 

## How To Install
```
git clone https://github.com/RNPG/gitlab_user_recon.git
```

## How To Use
```
PARAMETERS:
-------------
-u/--url        The URL of your victim's GitLab instance
--userlist      Path to a username wordlist file (one per line)
-h/--help       Show this help message and exit
```
```
chmod +x gitlab_user_recon.sh
./gitlab_user_recon.sh --url <URL> --userlist <Username Wordlist>
```
#### Usage Example:

`./gitlab_user_recon.sh --url http://192.168.10.10:8181 --userlist /root/Desktop/usernames.txt`

```
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                     GitLab User Enumeration Script
                                             Version 1.0

Description: It prints out the usernames that exist in your victim's GitLab CE instance

Disclaimer: Do not run this script against GitLab.com! Also keep in mind that this PoC is meant only
for educational purpose and ethical use. Running it against systems that you do not own or have the
right permission is totally on your own risk.

Author: @4DoniiS [https://github.com/4D0niiS]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


[+] The username root exists!
[+] The username mysql exists!
[+] The username robert exists!
[+] The username adonis exists!
                                    
```



