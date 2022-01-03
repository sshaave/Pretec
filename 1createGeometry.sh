#!/bin/sh

# Geometri
N=1
V=1
# Bunnplate
Bunn_l=1200
Bunn_b=100
Bunn_t=5

# Vertikal plate
Bak_l=$Bunn_l
Bak_t=5
Bak_h=265

# Klakk
Klakk_t=5

#Opplager
Opp_l=60
Opp_t=10

refP=0
move=30

# Opplager 1
python3 makeHorElement.py $Bunn_b $Opp_l $Opp_t 0 0 0 $refP $move
python3 merge.py total true

# Opplager tynn 1
python3 makeHorElement.py $Bak_t $Opp_l $Opp_t $Bunn_b 0 0 $refP $move
python3 merge.py total multi

# Opplager kloss 1
python3 makeHorElement.py $Bunn_b $Klakk_t $Opp_t 0 $Opp_l 0 $refP $move
python3 merge.py total multi

# Opplager kloss tynn 1
python3 makeHorElement.py $Bak_t $Klakk_t $Opp_t $Bunn_b $Opp_l 0 $refP $move
python3 merge.py total multi

# Vertikal plate 1
python3 makeVerElement.py $Bunn_b $Klakk_t $Bak_h 0 $(( Opp_l )) $Bak_h $refP $move
python3 merge.py total multi

# Vertikal tynnplate 1
python3 makeVerElement.py $Bak_t $Klakk_t $Bak_h $Bunn_b $Opp_l $Bak_h $refP $move
python3 merge.py total multi

# Vertikal kloss UK 1
python3 makeVerElement.py $Bunn_b $Klakk_t $Bunn_t 0 $(( Opp_l )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi

# Verikal tynnkloss UK 1
python3 makeVerElement.py $Bak_t $Klakk_t $Bunn_t $Bunn_b $(( Opp_l )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi

# Bunnplate
python3 makeVerElement.py $Bunn_b $Bunn_l $Bunn_t 0 $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi
python3 makeVerElement.py $Bak_t $Bunn_l $Bunn_t $Bunn_b $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi

# Bakplate
python3 makeVerElement.py $Bak_t $Bak_l $Bak_h $Bunn_b $(( Opp_l + Klakk_t )) $(( Bak_h )) $refP $move
python3 merge.py total multi

# Vertikal kloss UK 1
python3 makeVerElement.py $Bunn_b $Klakk_t $Bunn_t 0 $(( Opp_l + Klakk_t + Bunn_l )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi

# Vertikal tynnkloss UK2
python3 makeVerElement.py $Bak_t $Klakk_t $Bunn_t $Bunn_b $(( Opp_l + Klakk_t + Bunn_l )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi

# Vertikal plate 2
python3 makeVerElement.py $Bunn_b $Klakk_t $Bak_h 0 $(( Opp_l + Klakk_t + Bunn_l )) $Bak_h $refP $move
python3 merge.py total multi

# Vertikal tynnplate 2
python3 makeVerElement.py $Bak_t $Klakk_t $Bak_h $Bunn_b $(( Opp_l + Klakk_t + Bunn_l )) $Bak_h $refP $move
python3 merge.py total multi

# Opplager kloss 2
python3 makeHorElement.py $Bunn_b $Klakk_t $Opp_t 0 $(( Opp_l + Klakk_t + Bunn_l )) 0 $refP $move
python3 merge.py total multi

# Opplager kloss tynn 2
python3 makeHorElement.py $Bak_t $Klakk_t $Opp_t $Bunn_b $(( Opp_l + Klakk_t + Bunn_l )) 0 $refP $move
python3 merge.py total multi

# Opplager 2
python3 makeHorElement.py $Bunn_b $Opp_l $Opp_t 0 $(( Opp_l + Klakk_t + Klakk_t + Bunn_l )) 0 $refP $move
python3 merge.py total multi

# Opplager tynn 2
python3 makeHorElement.py $Bak_t $Opp_l $Opp_t $Bunn_b $(( Opp_l + Klakk_t + Klakk_t + Bunn_l )) 0 $refP $move
python3 merge.py total multi


python3 updatePatchFile.py tempFiles/updatePatchFile
#python3 makeSetsItem.py tempFiles/setsItem $(( elNum + 1 )) $b $a $nx $ny 6

# This will create a intermediate textfile used in the <connection> setting
python3 makeLoadFile.py tempFiles/setsItem
echo Wrap it up
# Wrap it up
../Mappe/IFEM-GPM/bin/./getGNO -v G2/total.g2 | grep "<connection" > tempFiles/patchFileTemp.txt
python3 qMerge.py
python3 qSort.py
python3 makeFile.py resultat.xinp G2/total.g2 tempFiles/setsItem.txt $N $V 19 3 3 3
echo $elNum
