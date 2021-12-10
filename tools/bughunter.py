class bughunter(HackingTool):
    TITLE = "bughunter"
    DESCRIPTION = "It automatically overwrites the RAM when\n" \
                  "the system is shutting down and also change Ip."
    INSTALL_COMMANDS = [
        "sudo git clone https://github.com/thehackingsage/bughunter.git",
        "cd bughunter && chmod +x bughunter.py && sudo cp bughunter.py /usr/bin/bughunter"
    ]
    RUN_COMMANDS = ["sudo bughunter start"]
    PROJECT_URL = "https://github.com/thehackingsage/bughunter/blob/master/README.md"

    def __init__(self):
        super(bughunter), self).__init__([('Stop', self.stop)])

    def stop(self):
        os.system("sudo bughunter stop")
        
class bughunter(HackingToolsCollection):
    TITLE = "Bugbounty Tools"
    DESCRIPTION = ""
    TOOLS = [
        bughunter(),
        
    ]
