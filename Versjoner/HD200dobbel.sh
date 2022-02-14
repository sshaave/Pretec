#!/bin/sh

# Geometri

# Bunnplate
Bunn_l=1197
Bunn_b=100
Bunn_b_opp=80
Bunn_b_bak=$(( Bunn_b - Bunn_b_opp))
Bunn_t=10

# Stegplate
Bak_l=$Bunn_l
Bak_t=4
Bak_h=205

# Forsterkningsplate
F_gap=10
opprom=$F_gap
F_t=10
F_h=50

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
# Opplager del 1
python3 makeHorElement.py $Bunn_b $Opp_l_fri $Opp_t 0 0 0 $refP $move $Bunn_b_opp
python3 merge.py total true

# - - - - - - --------------------------------
# Opplager del 2
python3 makeHorElement.py $Bunn_b $Opp_sveis_l $Opp_t 0 $Opp_l_fri 0 $refP $move $Bunn_b_opp
python3 merge.py total multi


# - - - - - - -------------------------------- #nr 3
# Opplager del 3
python3 makeHorElement.py $Bunn_b $(( Opp_l_fri - sveis )) $Opp_t 0 $(( Opp_l_fri + Opp_sveis_l )) 0 $refP $move $Bunn_b_opp
python3 merge.py total multi

# Opplager 1 del 4
python3 makeHorElement.py $Bunn_b $sveis $Opp_t 0 $(( Opp_l_fri - sveis + Opp_l_fri + Opp_sveis_l )) 0 $refP $move $Bunn_b_opp
python3 merge.py total multi

# ------ Kobling P5/P4, nr 5
# Opplager kloss 1
python3 makeHorElement.py $Bunn_b $Klakk_t $Opp_t 0 $Opp_l 0 $refP $move $Bunn_b_opp
python3 merge.py total multi

# Sveis UK opplager
python3 makeVerElement.py $Bunn_b $sveis $sveis 0 $((Opp_l - sveis )) $sveis $refP $move $Bunn_b_opp 0
python3 merge.py total multi

# -------   P4, patch 7
# Endeplate OK, tynn
python3 makeVerElement.py $Bunn_b $Klakk_t $sveis 0 $(( Opp_l )) $sveis $refP $move $Bunn_b_opp 0
python3 merge.py total multi

# Kobling endeplate mot stiverplate OK, tynn
python3 makeVerElement.py $Bak_t $Klakk_t $sveis $Bunn_b $Opp_l $sveis $refP $move 0 0
python3 merge.py total multi

# Endeplate forsterket hoyde
python3 makeVerElement.py $Bunn_b $Klakk_t $(( F_h - sveis )) 0 $(( Opp_l )) $F_h $refP $move $Bunn_b_opp 0
python3 merge.py total multi

# Kobling forsterket hoyde
python3 makeVerElement.py $Bak_t $Klakk_t $(( F_h - sveis )) $Bunn_b $(( Opp_l )) $F_h $refP $move 0 0
python3 merge.py total multi

# Endeplate fri hoyde
python3 makeVerElement.py $Bunn_b $Klakk_t $(( Bak_h - F_h )) 0 $Opp_l $Bak_h $refP $move $Bunn_b_opp 0
python3 merge.py total multi

# Kobling fri hoyde, nr 12
python3 makeVerElement.py $Bak_t $Klakk_t $(( Bak_h - F_h )) $Bunn_b $Opp_l $Bak_h $refP $move 0 0
python3 merge.py total multi



# -------  Kobling P4/P2, nr 13
# Vertikal kloss UK 1
python3 makeVerElement.py $Bunn_b $Klakk_t $Bunn_t 0 $(( Opp_l )) $(( Bak_h + Bunn_t )) $refP $move $Bunn_b_opp 0
python3 merge.py total multi


# Verikal tynnkloss UK 1
python3 makeVerElement.py $Bak_t $Klakk_t $Bunn_t $Bunn_b $(( Opp_l )) $(( Bak_h + Bunn_t )) $refP $move 0 0
python3 merge.py total multi

# -------   P2
# Bunnplate opprom, bred del
python3 makeVerElement.py $Bunn_b $opprom $Bunn_t 0 $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move $Bunn_b_opp 0
python3 merge.py total multi

# Bunnplate opprom kobling
python3 makeVerElement.py $Bak_t $opprom $Bunn_t $Bunn_b $(( Opp_l + Klakk_t )) $(( Bak_h + Bunn_t )) $refP $move 0 0
python3 merge.py total multi

# Stegplate lav/uforsterket tynn
python3 makeVerElement.py $Bak_t $opprom $(( Bak_h - F_h )) $Bunn_b $(( Opp_l + Klakk_t )) $(( Bak_h )) $refP $move 0 0
python3 merge.py total multi

# Stegplate hoy/forsterket tynn, nr 18
python3 makeVerElement.py $Bak_t $opprom $(( F_h - sveis )) $Bunn_b $(( Opp_l + Klakk_t )) $F_h $refP $move 0 0
python3 merge.py total multi

# stegplate opprom sveis
python3 makeVerElement.py $Bak_t $opprom $sveis $Bunn_b $(( Opp_l + Klakk_t )) $sveis $refP $move 0 0
python3 merge.py total multi

# Bunnplate P2
python3 makeVerElement.py $Bunn_b $((Bunn_l - opprom )) $Bunn_t 0 $(( Opp_l + Klakk_t + opprom )) $(( Bak_h + Bunn_t)) $refP $move $Bunn_b_opp 150
python3 merge.py total multi

python3 makeVerElement.py $Bak_t $(( Bunn_l - opprom )) $Bunn_t $Bunn_b $(( Opp_l + Klakk_t + opprom )) $(( Bak_h + Bunn_t )) $refP $move 0 150
python3 merge.py total multi

# -------   P1
# Stegplate, uforsterket
python3 makeVerElement.py $Bak_t $(( Bak_l - opprom )) $(( Bak_h - F_h )) $Bunn_b $(( Opp_l + Klakk_t + opprom )) $(( Bak_h )) $refP $move 0 150
python3 merge.py total multi

# Stegplate, forsterket
python3 makeVerElement.py $Bak_t $(( Bak_l - opprom )) $(( F_h - sveis )) $Bunn_b $(( Opp_l + Klakk_t + opprom )) $F_h $refP $move 0 150
python3 merge.py total multi

# Steglate, forsterket tykk
python3 makeVerElement.py $(( F_t )) $(( Bak_l - opprom )) $(( F_h - sveis )) $((Bunn_b - F_t )) $(( Opp_l + Klakk_t + opprom )) $F_h $refP $move 0 150
python3 merge.py total multi

# Stegplate OK tynn
python3 makeVerElement.py $Bak_t $(( Bak_l - opprom )) $sveis $Bunn_b $(( Opp_l + Klakk_t + opprom )) $(( sveis )) $refP $move 0 150
python3 merge.py total multi

# Stegplate OK tykkp
python3 makeVerElement.py $(( F_t )) $(( Bak_l - opprom )) $sveis $(( Bunn_b - F_t )) $(( Opp_l + Klakk_t + opprom )) $sveis $refP $move 0 150
python3 merge.py total multi

mv G2/total.g2 HD200/G2/HD200dobbel.g2
