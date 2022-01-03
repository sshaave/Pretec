python3 updatePatchFile.py tempFiles/updatePatchFile $b $a $nx $ny false $elNum
python3 makeSetsItem.py tempFiles/setsItem $(( elNum + 1 )) $b $a $nx $ny 6

# This will create a intermediate textfile used in the <connection> setting
python3 makeLoadFile.py tempFiles/setsItem $nx
echo Wrap it up
# Wrap it up
../Mappe/IFEM-GPM/bin/./getGNO -v G2/total.g2 | grep "<connection" > tempFiles/patchFileTemp.txt
python3 qMerge.py
python3 qSort.py
python3 makeFile.py resultat.xinp G2/total.g2 tempFiles/setsItem.txt $N $V $elNum $lowerBolt $upperBolt 3 3 3
echo $elNum
