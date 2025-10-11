# coding=utf-8
import os
import sys
from time import sleep

from core import HackingTool
from core import HackingToolsCollection

# --- Define the correct application paths based on your install.sh script ---
# Using constants makes the code cleaner and easier to maintain.
APP_INSTALL_DIR = "/usr/share/advtools"
COMMAND_PATH = "/usr/local/bin/advtools"
CONFIG_FILE = "/home/advtoolspath.txt"


class UpdateTool(HackingTool):
    TITLE = "Update Framework"
    DESCRIPTION = "Checks for updates and forces the local code to match the official GitHub repository."

    def __init__(self):
        # We simplify the options to one primary action: update the tool itself.
        super(UpdateTool, self).__init__(
            [
                ("Check for and Install Updates", self.run_update),
                ("Update Operating System", self.update_sys),
            ],
            installable=False,
            runnable=False,
        )
    
    def update_sys(self):
        """Runs a full system update. Requires root privileges."""
        print("[*] Starting system update. This may take a while...")
        # Run a full system update and upgrade
        os.system("sudo apt update && sudo apt full-upgrade -y")
        print("\n[✔] System update complete.")

    def run_update(self):
        """
        A robust updater that forces the local code to match the GitHub repo.
        This works even if local files were modified and shows the user all changes.
        """
        # First, check if the directory contains a .git folder, which confirms it's a git repo.
        if not os.path.isdir(os.path.join(APP_INSTALL_DIR, '.git')):
            print(f"\n\033[91m[!] Error: Git repository not found in {APP_INSTALL_DIR}\033[0m")
            print("[!] Cannot update. The tool may not be installed correctly.")
            return

        # Give a strong warning that any local modifications will be permanently lost.
        print(f"\n\033[93m[*] This updater will sync your tool with the latest version from GitHub.\033[0m")
        print(f"\033[91m[!] WARNING: Any local changes you have made to the code will be permanently deleted.\033[0m")
        
        try:
            choice = input("[?] Do you want to continue? [y/n]: ").lower()
            if choice != 'y':
                print("\n[*] Update cancelled by user.")
                return
        except KeyboardInterrupt:
            print("\n\n[*] Update cancelled by user.")
            return

        print("\n\033[34m[*] Fetching latest version info from GitHub...\033[0m")
        
        # This is the correct and robust command sequence for updating.
        # 1. cd: Change to the correct directory.
        # 2. git fetch: Download all new code from the remote repository.
        # 3. git reset --hard: Force the local files to be an exact match of the remote files.
        update_command = (
            f"cd {APP_INSTALL_DIR} && "
            f"sudo git fetch --all && "
            f"sudo git reset --hard origin/main"
        )
        
        # Execute the command. The user will see the output from Git, confirming it's working.
        os.system(update_command)
        
        print("\n\033[92m[✔] advtools is now up to date. Please restart the tool to apply changes.\033[0m")


class UninstallTool(HackingTool):
    TITLE = "Uninstall advtools Framework"
    DESCRIPTION = "WARNING: Completely removes advtools and all downloaded tools from the system."

    def __init__(self):
        super(UninstallTool, self).__init__(
            [("Proceed with Uninstallation", self.run_uninstall)],
            installable=False,
            runnable=False,
        )

    def run_uninstall(self):
        """
        A safe and correct uninstaller that removes all application components.
        """
        print(f"\033[93m[!] WARNING: This will permanently delete the following:\033[0m")
        print(f"    - Main application: {APP_INSTALL_DIR}")
        print(f"    - Launcher command: {COMMAND_PATH}")
        print(f"    - Config file:      {CONFIG_FILE}")

        tools_install_path = ""
        if os.path.exists(CONFIG_FILE):
            with open(CONFIG_FILE, "r") as f:
                tools_install_path = f.readline().strip()
            if tools_install_path and os.path.isdir(tools_install_path):
                print(f"    - All downloaded tools: {tools_install_path}")
        print("")

        try:
            choice = input(
                "\033[91m[?] Are you sure you want to continue? This cannot be undone. [y/n]: \033[0m"
            ).lower()
        except KeyboardInterrupt:
            print("\n\n[*] Uninstall cancelled.")
            return

        if choice != "y":
            print("\n[*] Uninstall aborted by user.")
            return

        if os.geteuid() != 0:
            print("\n\033[91m[!] Error: Root privileges are required. Please run with 'sudo advtools'.\033[0m")
            return

        print("\n[*] Starting uninstallation...")
        sleep(1)

        # Using sudo for each command and quoting paths for maximum safety.
        if tools_install_path and os.path.isdir(tools_install_path):
            print(f"[*] Removing tools directory: {tools_install_path}")
            os.system(f"sudo rm -rf '{tools_install_path}'")

        if os.path.exists(CONFIG_FILE):
            print(f"[*] Removing config file: {CONFIG_FILE}")
            os.system(f"sudo rm -f '{CONFIG_FILE}'")

        if os.path.exists(COMMAND_PATH):
            print(f"[*] Removing command: {COMMAND_PATH}")
            os.system(f"sudo rm -f '{COMMAND_PATH}'")

        if os.path.isdir(APP_INSTALL_DIR):
            print(f"[*] Removing main application: {APP_INSTALL_DIR}")
            os.system(f"sudo rm -rf '{APP_INSTALL_DIR}'")

        print("\n\033[92m[✔] advtools has been successfully uninstalled.\033[0m")
        sys.exit()


class ToolManager(HackingToolsCollection):
    TITLE = "Manage Framework"
    DESCRIPTION = "Update or Uninstall the advtools framework."
    TOOLS = [UpdateTool(), UninstallTool()]