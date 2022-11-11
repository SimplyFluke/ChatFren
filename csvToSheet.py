import os
import csv
import sys
import time
import gspread

from gspread_formatting import *

scriptDir = os.path.realpath(__file__)
dname = os.path.dirname(scriptDir)
os.chdir(dname)

def upload_CSV(recipient, full_path, filename):
    with open(full_path, 'r') as fp:
        length = len(fp.readlines())
 
    fmt = CellFormat(
        backgroundColor=Color(1, 0, 0)
    )

    filename = filename.replace(".csv", "")
    gc = gspread.service_account(filename='csvToSheet_token.json')
    sh = gc.create(filename) #  Set name of document
    sh.share(recipient, perm_type='user', role='writer') #  Share doc to email
    worksheet = sh.sheet1

    with open(full_path, 'r', encoding='utf-8-sig') as cFile:
        content = cFile.read()
        gc.import_csv(sh.id, data=content)

    activeList = sh.sheet1.get_values(f'B2:B{length}')
    cells = set() #  Set for storing 'false' cells

    for item in activeList:
        strItem = str(item)
        if strItem == "['FALSE']":
            cells.add(activeList.index(item))
            activeList[activeList.index(item)] = "." #  Change value of item in list to avoid iteration hell

    for item in cells: #  Mark 'dead' users in red
        format_cell_range(sh.sheet1, f"A{item+2}:E{item+2}", fmt)

    set_column_widths(sh.sheet1,[('A', 60), ('B', 60), ('C', 230), ('D', 66), ('E', 122)]) #  Set width according to TIP-site

# Run with command line args
upload_CSV(sys.argv[1], sys.argv[2], sys.argv[3])
