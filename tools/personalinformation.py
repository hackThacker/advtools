import os

from core import HackingTool
from core import HackingToolsCollection

class DaProfiler(HackingTool):
    TITLE = "DaProfiler"
    DESCRIPTION = "DaProfiler is an OSINT tool allowing you to collect certain information about\n" \
                  "Addresses, Social media accounts, e-mail addresses, mobile / landline number, jobs."
    INSTALL_COMMANDS = [
        "git clone https://github.com/TheRealDalunacrobate/DaProfiler.git",
        "cd DaProfiler && pip3 install -r requirements.txt"
    ]
    RUN_COMMANDS = ["sudo  python3 profiler.py -h"]
    PROJECT_URL = " https://github.com/TheRealDalunacrobate/DaProfiler"
    
    
class Profil3r(HackingTool):
    TITLE = "Profil3r"
    DESCRIPTION = "Profil3r is an OSINT tool that allows you to find potential profiles of a person on social networks, as well as their email addresses\n" \
                  "This program also alerts you data leak for the found emails."
    INSTALL_COMMANDS = [
        "pip3 install PyInquirer jinja2",
        " git clone https://github.com/Rog3rSm1th/Profil3r.git",
        "cd Profil3r/ ",
        "sudo python3 setup.py install"
    ]
    RUN_COMMANDS = ["python3 profil3r.py "]
    PROJECT_URL = " https://github.com/TheRealDalunacrobate/DaProfiler"
    
    
    
    
def __init__(self):
        super(Profil3r, self).__init__(installable = False, runnable = False)


class userinformation(HackingToolsCollection):
    TITLE = "personal information gather"
    TOOLS = [
DaProfiler(),
Profil3r()
    ]
