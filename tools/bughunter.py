# coding=utf-8
import os

from core import HackingTool
from core import HackingToolsCollection

class bughunter(HackingTool):
    TITLE = "bughunter"
    DESCRIPTION = "A bug bounty program is a deal offered by many websites, organizations and software developers by which individuals" \
                  " can receive recognition and compensation for reporting bugs, especially those pertaining to security exploits and vulnerabilities."
    INSTALL_COMMANDS = [
        "sudo git clone https://github.com/thehackingsage/bughunter.git",
        "cd bughunter && chmod +x bughunter.py && sudo cp bughunter.py /usr/bin/bughunter"
    ]
    RUN_COMMANDS = ["sudo bughunter start"]
    PROJECT_URL = "https://github.com/thehackingsage/bughunter"

    def __init__(self):
        super(bughunter, self).__init__([('Stop', self.stop)])

    def stop(self):
        os.system("sudo bughunter stop")
        
class bughunter(HackingToolsCollection):
    TITLE = "Bugbounty Tools"
    DESCRIPTION = ""
    TOOLS = [
        bughunter()
    ]
