#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Color Codes ---
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
purpal='\033[35m' # Note: This is the same as PURPLE

# --- Installation Variables ---
INSTALL_DIR="/usr/share/advtools"
BIN_DIR="/usr/local/bin" # Standard directory for user-installed executables

#=================================================================#
#                        FUNCTIONS                                #
#=================================================================#

# Function to check for internet connectivity
check_internet() {
    echo -e "\n${BLUE}[*] Checking Internet Connection...${NC}"
    if ! wget -q --tries=10 --timeout=20 --spider https://google.com; then
        echo -e "${RED}[✘] Error: Please check your internet connection!${NC}"
        exit 1
    fi
    echo -e "${GREEN}[✔] Internet connection verified.${NC}"
}

# Function to install all necessary dependencies
install_dependencies() {
    echo -e "\n${BLUE}[*] Updating package lists (this may take a moment)...${NC}"
    apt-get update -y
    
    echo -e "${BLUE}[*] Installing system dependencies (git, python3-pip, figlet, boxes)...${NC}"
    apt-get install -y git python3-venv python3-pip figlet boxes   
}

# Function to clone the tool's repository and create the command
install_tool() {
    echo -e "\n${BLUE}[*] Checking for existing installation...${NC}"
    if [ -d "$INSTALL_DIR" ]; then
        read -p "$(echo -e ${YELLOW}"[!] The directory ${INSTALL_DIR} already exists. Replace it? [y/n]: "${NC})" choice
        case "$choice" in 
          y|Y )
            echo -e "${ORANGE}[*] Removing existing directory...${NC}"
            rm -rf "$INSTALL_DIR"
            ;;
          * )
            echo -e "${RED}[✘] Installation aborted by user.${NC}"
            exit 0
            ;;
        esac
    fi

    echo -e "\n${BLUE}[*] Cloning the advtools repository from GitHub...${NC}"
    git clone https://github.com/hackThacker/advtools.git "$INSTALL_DIR"
    
    echo -e "${BLUE}[*] Creating the command line launcher in ${BIN_DIR}...${NC}"
    # Create a launcher script for the tool
    echo "#!/bin/bash
python3 ${INSTALL_DIR}/hackingtool.py \"\$@\"" > "${BIN_DIR}/advtools"
    
    # Make the launcher executable
    chmod +x "${BIN_DIR}/advtools"
}

#=================================================================#
#                        MAIN SCRIPT                              #
#=================================================================#

# 1. Check for Root Privileges
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${RED}[!] This script must be run as root. Please use sudo.${NC}"
    exit 1
fi

# 2. Display the banner and menu
echo -e "${ORANGE} "
echo ""
echo "██╗  ██╗ █████╗  ██████╗██╗  ██╗████████╗██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗";
echo "██║  ██║██╔══██╗██╔════╝██║ ██╔╝╚══██╔══╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗";
echo "███████║███████║██║     █████╔╝    ██║   ███████║███████║██║     █████╔╝ █████╗  ██████╔╝";
echo "██╔══██║██╔══██║██║     ██╔═██╗    ██║   ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗";
echo "██║  ██║██║  ██║╚██████╗██║  ██╗   ██║   ██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║";
echo "╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝";
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
read -p "$(echo -e ${YELLOW}"𝓱𝓪𝓬𝓴𝓣𝓱𝓪𝓬𝓴𝓮𝓻>> "${NC})" choice

# 3. Process User's Choice
case $choice in
    1)
        check_internet
        install_dependencies
        install_tool
        
        # 4. Final Verification and Success Message
        if [ -f "${BIN_DIR}/advtools" ]; then
            echo -e "\n${GREEN}[✔] Successfully Installed!${NC}"
            echo ""
            echo -e "${ORANGE}		[+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
            echo "		[+]						      		[+]"
            echo -e "${ORANGE}		[+]     ✔✔✔ Now Just Type 'advtools' In Your Terminal ✔✔✔ 	     [+]"
            echo "		[+]						      		[+]"
            echo -e "${ORANGE}		[+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
        else
            echo -e "\n${RED}[✘] Installation Failed! The command could not be created.${NC}"
            exit 1
        fi
        ;;
    0)
        echo -e "\n${ORANGE}[*] Thank you! Exiting now.${NC}"
        exit 0
        ;;
    *)
        echo -e "\n${RED}[!] Invalid option selected. Please run the script again.${NC}"
        exit 1
        ;;
esac

exit 0