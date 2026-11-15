#!/bin/bash


show_pet() {
    echo -e "\e[36m"
    cat <<'EOF'
        /\_/\
       ( o.o )
        > ^ <
       /|   |\
      (_|___|_)
EOF
    echo -e "\e[0m"
    echo "       Hey! I'm Byte!"
}

pet_confused() {
    echo -e "\e[33m"
    echo "   ( o.O ) Huh?!"
    echo "   That's not a valid choice!"
    echo -e "\e[0m"
}

pet_goodbye() {
    echo -e "\e[35m"
    echo "   ( -.- ) Zzz..."
    echo "   See you later, human!"
    echo -e "\e[0m"
}



# check if the directory exists & shows it's permissions

check_directory_exist(){

echo " Please enter the directory "
read -r directory 

while [[ -z "$directory" ]]
do
	echo -e "\e[31m Your input can not be blank. Please enter a valid \e[0m "
	read directory
done

if [[ -d "$directory" ]]; then
echo " "
	echo "Directory exists!"
	echo " "
	echo "Here it's permissions "
	ls -ld "$directory"
else
    echo "directory not found!"
fi
}

check_memory_Usage()
{
echo "Your Memory Usage "
free -h 
echo " "
echo "Your Disk Usage "
df -h /

}

# the title
	echo "===========================================================================      "
	echo " "
	echo -e "                         \e[31mLinux System Information\e[0m         "
	echo " "
	echo "===========================================================================      "


# bonus for welcomin
	show_pet
	echo "Welcome  .... Ummm ...  Can you tell Byte your name ? "
	read name 
# check if the name is not blank
while [[ -z "$name" ]]
do
	echo -e "\e[31m Your name can not be blank. Please enter a valid \e[0m "
	read -r name
done

echo " "
printf "\e[35mWelcome, %s ! \e[0m to our system information program ..\n " "$name"
echo " "

# the menu

while [[ true ]]
do
echo -e "	\e[36m"
echo "============== MENU ==============="
echo "1. Show Current User & hostname "
echo "2. Show Current Date "
echo "3. Show Current shell "
echo "4. Show Directory Permissions & check if it exists "
echo "5. Show Disk & Memory Usage "
echo "6. Number of Files in Current Directory "
echo "7.Linux Distribution "
echo "8.Exit "
echo "==================================="
read choice
echo "==================================="
echo -e "	\e[0m"

# switch for the those cases 
case $choice in 
	1)

	echo -e "\e[36mInvestigating current user...\e[0m"
	printf "Username: %s " "$(whoami)"
	echo ""
	echo -e "\e[36mInvestigating current host...\e[0m"
	printf "Hostname: %s " "$(hostname)"
	echo " "
	;;
	2)
	echo "the date is "
	date
	
	;;
	3)
	echo "Your current shell is "
	echo "$SHELL"
	
	;;
	4)
	check_directory_exist
	
	;;
	5)
	check_memory_Usage
	
	;;
	6)
	echo "Number of Files in Current Directory "
	find . -maxdepth 1 -type f | wc -l
	
	;;
	7)
	echo "Your Linux Distribution "
	cat /etc/os-release 
	
	;;
	
	8)
	echo -e "\e[34m Thanks for using our system .\e[0m"
	pet_goodbye
	break 
	;;
	
	*)
	pet_confused
	
	;;
esac

done


