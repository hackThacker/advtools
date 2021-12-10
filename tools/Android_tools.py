# coding=utf-8
import os

from core import HackingTool
from core import HackingToolsCollection

class Android_tools(HackingTool):
    TITLE = "Android_tools"
    DESCRIPTION = "Mobile Verification Toolkit (MVT) is a collection of utilities to simplify and automate the process." \
                  "  of gathering forensic traces helpful to identify a potential compromise of Android and iOS devices."
   INSTALL_COMMANDS = [
        "sudo git clone https://github.com/mvt-project/mvt",
        "cd mvt && pip3 install mvt"
   ]
    RUN_COMMANDS = ["sudo Android_tools start"]
    PROJECT_URL = "sudo git clone https://github.com/mvt-project/mvt"

    def __init__(self):
        super(Android_tools, self).__init__([('Stop', self.stop)])

    def stop(self):
        os.system("sudo Android_tools stop")
        
class Android_tools(HackingToolsCollection):
    TITLE = "Android Tools"
    DESCRIPTION = ""
    TOOLS = [
        Android_tools()
    ]
