#!/bin/sh

# Geometri

# Bunnplate
Bunn_l=597
Bunn_b=100
Bunn_b_opp=40
Bunn_b_bak=$(( Bunn_b - Bunn_b_opp))
Bunn_t=10

# Stegplate
Bak_l=$Bunn_l
Bak_t=4
Bak_h=200

# Endeplate
Klakk_t=4
sveis=5

#Opplager/vingeplate
Opp_l=120
Opp_t=12
Opp_sveis_l=50
Opp_l_fri=35


refP=0
move=30

# ------   P5
# Opplager 1 del opplegg
python3 makeHorElement.py $Bunn_b $Opp_l_fri $Opp_t 0 0 $(( -Opp_t )) $refP $move $Bunn_b_opp
python3 merge.py total true

# - - - - - - --------------------------------
# Opplager 1 del opplegg
python3 makeHorElement.py $Bunn_b $Opp_sveis_l $Opp_t 0 $Opp_l_fri $(( -Opp_t )) $refP $move $Bunn_b_opp
python3 merge.py total multi


# - - - - - - -------------------------------- #nr 3
# Opplager 1 del opplegg
python3 makeHorElement.py $Bunn_b $(( Opp_l_fri )) $Opp_t 0 $(( Opp_l_fri + Opp_sveis_l )) $(( -Opp_t )) $refP $move $Bunn_b_opp
python3 merge.py total multi

# Opplager 1 sveis
#python3 makeHorElement.py $Bunn_b $sveis $Opp_t 0 $(( Opp_l_fri - sveis + Opp_l_fri + Opp_sveis_l )) 0 $refP $move $Bunn_b_opp
#python3 merge.py total multi

# ------ Kobling P5/P4, nr 5
# Opplager kloss 1
python3 makeHorElement.py $Bunn_b $Klakk_t $Opp_t 0 $Opp_l $(( -Opp_t )) $refP $move $Bunn_b_opp
python3 merge.py total multi

# Sveis OK endeplate 1, under opplager
#python3 makeVerElement.py $Bunn_b $sveis $sveis 0 $((Opp_l - sveis )) $sveis $refP $move $Bunn_b_opp 0
#python3 merge.py total multi

# -------   P4, patch 7
# Endeplate 1
#python3 makeVerElement.py $Bunn_b $Klakk_t $sveis 0 $(( Opp_l )) $sveis $refP $move $Bunn_b_opp 0
#python3 merge.py total multi

#python3 makeVerElement.py $Bak_t $Klakk_t $sveis $Bunn_b $Opp_l $sveis $refP $move 0 0
#python3 merge.py total multi

python3 makeVerElement.py $Bunn_b $Klakk_t $((Bak_h - Opp_t )) 0 $(( Opp_l )) $Bak_h $refP $move $Bunn_b_opp 0
python3 merge.py total multi

python3 makeVerElement.py $Bak_t $Klakk_t $(( Bak_h - Opp_t )) $Bunn_b $Opp_l $Bak_h $refP $move 0 0
python3 merge.py total multi



# -------  Kobling P4/P2, nr 11
# Vertikal kloss UK 1
python3 makeVerElement.py $Bunn_b $Klakk_t $Bunn_t 0 $(( Opp_l )) $(( Bak_h + Bunn_t )) $refP $move $Bunn_b_opp 0
python3 merge.py total multi

# Verikal tynnkloss UK 1
python3 makeVerElement.py $Bak_t $Klakk_t $Bunn_t $Bunn_b $(( Opp_l )) $(( Bak_h + Bunn_t )) $refP $move 0 0
python3 merge.py total multi

# -------   P2, nr 13
# Bunnplate
python3 makeVerElement.py $Bunn_b $Bunn_l $Bunn_t 0 $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move $Bunn_b_opp 150
python3 merge.py total multi

python3 makeVerElement.py $Bak_t $Bunn_l $Bunn_t $Bunn_b $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move 0 150
python3 merge.py total multi

# -------   P1
# Stegplate, nr 15
python3 makeVerElement.py $Bak_t $Bak_l $(( Bak_h - Opp_t )) $Bunn_b $(( Opp_l + Klakk_t )) $(( Bak_h )) $refP $move 0 150
python3 merge.py total multi

python3 makeVerElement.py $Bak_t $Bak_l $Opp_t $Bunn_b $(( Opp_l + Klakk_t )) $(( Opp_t )) $refP $move 0 150
python3 merge.py total multi

# HD
#python3 makeVerElement.py $Bunn_b_opp $Bunn_l $h_HD 0 $(( Opp_l + Klakk_t )) $(( Bak_h )) $refP $move
#cp G2/total.g2 G2/utenHD.g2
#python3 merge.py medHD HD


# Lager input-fil til iFEM
python3 makeSetsItem.py tempFiles/setsItem
python3 makeLoadFile.py tempFiles/setsItem
