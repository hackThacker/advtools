#!/bin/bash
clear

BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[92m'
YELLOW='\e[33m'
ORANGE='\e[93m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
NC='\e[0m'
purpal='\033[35m'

echo -e "${ORANGE} "
echo ""
echo " ██╗  ██╗ █████╗  ██████╗██╗  ██╗████████╗██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗       ";
echo " ██║  ██║██╔══██╗██╔════╝██║ ██╔╝╚══██╔══╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗       ";
echo " ███████║███████║██║     █████╔╝    ██║   ███████║███████║██║     █████╔╝ █████╗  ██████╔╝       ";
echo " ██╔══██║██╔══██║██║     ██╔═██╗    ██║   ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗       ";
echo " ██║  ██║██║  ██║╚██████╗██║  ██╗   ██║   ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║      ";
echo " ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝      ";
echo -e "${GREEN}  "
echo ""
echo "                       █████╗ ██████╗ ██╗   ██╗████████╗ ██████╗  ██████╗ ██╗     ███████╗ ";
echo "                      ██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝  ";
echo "                      ███████║██║  ██║██║   ██║   ██║   ██║   ██║██║   ██║██║     ███████╗   ";                         
echo "                      ██╔══██║██║  ██║╚██╗ ██╔╝   ██║   ██║   ██║██║   ██║██║     ╚════██║";
echo "                      ██║  ██║██████╔╝ ╚████╔╝    ██║   ╚██████╔╝╚██████╔╝███████╗███████║";
echo "                      ╚═╝  ╚═╝╚═════╝   ╚═══╝     ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝";


echo -e "${BLUE}                                    https://github.com/hackThacker/advtools.git ${NC}"

echo -e "${RED}                                   [!] This Tool Must Run As ROOT [!]${NC}"
echo ""
echo -e ${CYAN}              "Select Best Option : "
echo ""
echo -e "${WHITE}              [1] Kali Linux / Parrot-Os "
echo -e "${WHITE}              [0] Exit "
echo -n -e "${YELLOW} 𝓱𝓪𝓬𝓴𝓣𝓱𝓪𝓬𝓴𝓮𝓻>> "
read choice
INSTALL_DIR="/usr/share/doc/advtools"
BIN_DIR="/usr/bin/"
if [ $choice == 1 ]; then 
	echo "[*] Checking Internet Connection .."
	wget -q --tries=10 --timeout=20 --spider https://google.com
	if [[ $? -eq 0 ]]; then
	    echo -e ${BLUE}"[✔] Loading ... "
	    sudo apt-get update && apt-get upgrade 
	    sudo apt-get install python-pip
	    echo "[✔] Checking directories..."
	    if [ -d "$INSTALL_DIR" ]; then
	        echo "[!] A Directory hackingtool Was Found.. Do You Want To Replace It ? [y/n]:" ;
	        read input
	        if [ "$input" = "y" ]; then
	            rm -R "$INSTALL_DIR"
	        else
	            exit
	        fi
	    fi
    		echo "[✔] Installing ...";
		echo "";
		git clone https://github.com/hackThacker/advtools.git "$INSTALL_DIR";
		echo "#!/bin/bash
		python3 $INSTALL_DIR/hackingtool.py" '${1+"$@"}' > hackingtool;
		sudo chmod +x hackingtool;
		sudo cp hackingtool /usr/bin/;
		rm hackingtool;
		echo ""; 
		echo "[✔] Trying to installing Requirements ..."
		sudo pip3 install lolcat
		sudo apt-get install -y figlet
		sudo pip3 install boxes
		sudo apt-get install boxes
		sudo pip3 install flask
		sudo pip3 install requests
		
	else 
		echo -e $RED "Please Check Your Internet Connection ..!!"
	fi

    if [ -d "$INSTALL_DIR" ]; then
        echo "";
        echo "[✔] Successfuly Installed !!! ";
        echo "";
        echo "";
        echo -e $ORANGE "		[+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
        echo 		"		[+]						      		[+]"
        echo -e $ORANGE  "		[+]     ✔✔✔ Now Just Type In Terminal (advtools) ✔✔✔ 	     [+]"
        echo 		"		[+]						      		[+]"
        echo -e $ORANGE "		[+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
    else
        echo "[✘] Installation Failed !!! [✘]";
        exit
    fi
elif [ $choice -eq 0 ];
then
    echo -e $RED "[✘] THank Y0u !! [✘] "
    exit
else 
    echo -e $RED "[!] Select Valid Option [!]"
fi
