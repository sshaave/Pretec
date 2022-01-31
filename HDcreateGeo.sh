#!/bin/sh

# Geometri

# Bunnplate
Bunn_l=597
Bunn_b=120
Bunn_b_opp=70
Bunn_b_bak=$(( Bunn_b - Bunn_b_opp))
Bunn_t=10

# Stegplate
Bak_l=$Bunn_l
Bak_t=4
Bak_h=205

# Endeplate
Klakk_t=4

#Opplager/vingeplate
Opp_l=150
Opp_t=12
Opp_sveis_l=50
Opp_l_fri=50

#Hoyde HD-tilnaermelse
h_HD=52

refP=0
move=30

# ------   P5
# Opplager 1 del opplegg
python3 makeHorElement.py $Bunn_b_opp $Opp_l_fri $Opp_t 0 0 0 $refP $move
python3 merge.py total true

# Opplager 2 del bak HD
python3 makeHorElement.py $Bunn_b_bak $Opp_l_fri $Opp_t $Bunn_b_opp 0 0 $refP $move
python3 merge.py total multi

# Opplager tynn 1
#python3 makeHorElement.py $Bak_t $Opp_l_fri $Opp_t $Bunn_b 0 0 $refP $move
#python3 merge.py total multi
# - - - - - - --------------------------------
# Opplager 1 del opplegg
python3 makeHorElement.py $Bunn_b_opp $Opp_sveis_l $Opp_t 0 $Opp_l_fri 0 $refP $move
python3 merge.py total multi

# Opplager 2 del bak HD
python3 makeHorElement.py $Bunn_b_bak $Opp_sveis_l $Opp_t $Bunn_b_opp $Opp_l_fri 0 $refP $move
python3 merge.py total multi

# Opplager tynn 1
#python3 makeHorElement.py $Bak_t $Opp_sveis_l $Opp_t $Bunn_b $Opp_l_fri 0 $refP $move
#python3 merge.py total multi
# - - - - - - --------------------------------

# - - - - - - --------------------------------
# Opplager 1 del opplegg
python3 makeHorElement.py $Bunn_b_opp $Opp_l_fri $Opp_t 0 $(( Opp_l_fri + Opp_sveis_l )) 0 $refP $move
python3 merge.py total multi

# Opplager 2 del bak HD
python3 makeHorElement.py $Bunn_b_bak $Opp_l_fri $Opp_t $Bunn_b_opp $(( Opp_l_fri + Opp_sveis_l )) 0 $refP $move
python3 merge.py total multi

# Opplager tynn 1
#python3 makeHorElement.py $Bak_t $Opp_l_fri $Opp_t $Bunn_b $(( Opp_l_fri + Opp_sveis_l )) 0 $refP $move
#python3 merge.py total multi
# - - - - - - --------------------------------


# ------ Kobling P5/P4
# Opplager kloss 1
python3 makeHorElement.py $Bunn_b_opp $Klakk_t $Opp_t 0 $Opp_l 0 $refP $move
python3 merge.py total multi
python3 makeHorElement.py $Bunn_b_bak $Klakk_t $Opp_t $Bunn_b_opp $Opp_l 0 $refP $move
python3 merge.py total multi

# Opplager kloss tynn 1
#python3 makeHorElement.py $Bak_t $Klakk_t $Opp_t $Bunn_b $Opp_l 0 $refP $move
#python3 merge.py total multi

# -------   P4
# Endeplate 1
python3 makeVerElement.py $Bunn_b_opp $Klakk_t $Bak_h 0 $(( Opp_l )) $Bak_h $refP $move
python3 merge.py total multi

python3 makeVerElement.py $Bunn_b_bak $Klakk_t $Bak_h $Bunn_b_opp $Opp_l $Bak_h $refP $move
python3 merge.py total multi

# Endeplate tynnplate 1
python3 makeVerElement.py $Bak_t $Klakk_t $Bak_h $Bunn_b $Opp_l $Bak_h $refP $move
python3 merge.py total multi

# -------  Kobling P4/P2
# Vertikal kloss UK 1
python3 makeVerElement.py $Bunn_b_opp $Klakk_t $Bunn_t 0 $(( Opp_l )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi
python3 makeVerElement.py $Bunn_b_bak $Klakk_t $Bunn_t $Bunn_b_opp $Opp_l $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi

# Verikal tynnkloss UK 1
python3 makeVerElement.py $Bak_t $Klakk_t $Bunn_t $Bunn_b $(( Opp_l )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi

# -------   P2
# Bunnplate
python3 makeVerElement.py $Bunn_b_opp $Bunn_l $Bunn_t 0 $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi
python3 makeVerElement.py $Bunn_b_bak $Bunn_l $Bunn_t $Bunn_b_opp $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi
python3 makeVerElement.py $Bak_t $Bunn_l $Bunn_t $Bunn_b $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move
python3 merge.py total multi

# -------   P1
# Stegplate
python3 makeVerElement.py $Bak_t $Bak_l $Bak_h $Bunn_b $(( Opp_l + Klakk_t )) $(( Bak_h )) $refP $move
python3 merge.py total multi

# HD
#python3 makeVerElement.py $Bunn_b_opp $Bunn_l $h_HD 0 $(( Opp_l + Klakk_t )) $(( Bak_h )) $refP $move
#cp G2/total.g2 G2/utenHD.g2
#python3 merge.py medHD HD

# Vertikal kloss UK 1
#python3 makeVerElement.py $Bunn_b $Klakk_t $Bunn_t 0 $(( Opp_l + Klakk_t + Bunn_l )) $(( Bak_h + Bunn_t )) $refP $move
#python3 merge.py total multi

# ------- SYMMETRI ------


# Vertikal tynnkloss UK2
#python3 makeVerElement.py $Bak_t $Klakk_t $Bunn_t $Bunn_b $(( Opp_l + Klakk_t + Bunn_l )) $(( Bak_h + Bunn_t )) $refP $move
#python3 merge.py total multi

# Vertikal plate 2
#python3 makeVerElement.py $Bunn_b $Klakk_t $Bak_h 0 $(( Opp_l + Klakk_t + Bunn_l )) $Bak_h $refP $move
#python3 merge.py total multi

# Vertikal tynnplate 2
#python3 makeVerElement.py $Bak_t $Klakk_t $Bak_h $Bunn_b $(( Opp_l + Klakk_t + Bunn_l )) $Bak_h $refP $move
#python3 merge.py total multi

# Opplager kloss 2
#python3 makeHorElement.py $Bunn_b $Klakk_t $Opp_t 0 $(( Opp_l + Klakk_t + Bunn_l )) 0 $refP $move
#python3 merge.py total multi

# Opplager kloss tynn 2
#python3 makeHorElement.py $Bak_t $Klakk_t $Opp_t $Bunn_b $(( Opp_l + Klakk_t + Bunn_l )) 0 $refP $move
#python3 merge.py total multi

# Opplager 2
#python3 makeHorElement.py $Bunn_b $Opp_l $Opp_t 0 $(( Opp_l + Klakk_t + Klakk_t + Bunn_l )) 0 $refP $move
#python3 merge.py total multi

# Opplager tynn 2
#python3 makeHorElement.py $Bak_t $Opp_l $Opp_t $Bunn_b $(( Opp_l + Klakk_t + Klakk_t + Bunn_l )) 0 $refP $move
#python3 merge.py total multi



# Lager input-fil til iFEM
python3 makeSetsItem.py tempFiles/setsItem
python3 makeLoadFile.py tempFiles/setsItem
