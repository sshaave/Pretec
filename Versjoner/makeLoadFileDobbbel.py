#!/usr/bin/python3
import sys
import os
# 1st input: name of resultfile from "makeSetsItem.py"
# 2nd input: elNum of middle klakk member
with open(sys.argv[1]+'.txt','a') as i1:
    i1.write('\t\t<set name="lastflate" type="face">\n')
    i1.write('\t\t\t<item patch="15">6</item>\n')
    i1.write('\t\t\t<item patch="20">6</item>\n')
    i1.write('\t\t</set>\n')
