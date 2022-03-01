#!/bin/sh
N=1
V=2
# Geometri er ferdig


# Lager input-fil til iFEM
python3 makeSetsItemDobbel.py tempFiles/setsItem
python3 makeLoadFileDobbel.py tempFiles/setsItem
../../Mappe/IFEM-GPM/bin/./getGNO -v G2/total.g2 | grep "<connection" > tempFiles/patchFileTemp.txt
python3 qMerge.py
python3 qSort.py
python3 makeFileDobbel.py resultat.xinp G2/total.g2 tempFiles/setsItem.txt $N $V 3 3 3
