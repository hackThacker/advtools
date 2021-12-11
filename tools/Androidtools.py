# coding=utf-8
import os

from core import HackingTool
from core import HackingToolsCollection

class Androidtools(HackingTool):
    TITLE = "Android_tools"
    DESCRIPTION = "Mobile Verification Toolkit (MVT) is a collection of utilities to simplify and automate the process." \
                  "  of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices."
    INSTALL_COMMANDS = [

        "sudo adb ",
        "sudo pip " 
    ]
    RUN_COMMANDS = [ 
        "export PATH=$PATH:~/.local/bin ",
        "pip install mvt",
        "sudo mvt-android && mvt-ios",
        "sudo adb start-server",
        "sudo mvt-android check-adb",
        "sudo /home/kali/Desktop  && mkdir mvtapps",
        "sudo mvt-android download-apks -o mvtapps -A"
      ]
    PROJECT_URL = "sudo git clone https://github.com/mvt-project/mvt"

    def __init__(self):
        super(Androidtools, self).__init__([('Stop', self.stop)])

    def stop(self):
        os.system("sudo Androidtools stop")
        
class Androidtools(HackingToolsCollection):
    TITLE = "Android Tools"
    DESCRIPTION = ""
    TOOLS = [
        Androidtools()
    ]
