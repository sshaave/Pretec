#!/usr/bin/python3
#This script will create the small elongated squared between the bolts and the mid square, x-dir
import sys
from sys import path
path.append('../../Mappe/Splipy/')
from splipy import *
import splipy.surface_factory as sf
import splipy.volume_factory as vf
import numpy as np
np.set_printoptions(precision=6)
from splipy.io import G2
from math import pi
# 1st input: xLength
# 2nd input: yLength
# 3rd input: depth
# 4th input: dX
# 5th input: dY
# 6th input: dZ
# 7th input: refP
# 8th input: move
xL = float(sys.argv[1])
yL = int(float(sys.argv[2]))
depth = int(float(sys.argv[3]))
dX = int(float(sys.argv[4]))
dY = int(float(sys.argv[5]))
dZ = int(float(sys.argv[6]))
refP = int(float(sys.argv[7]))
move = int(float(sys.argv[8]))
knot = float(sys.argv[9])
#
square1 = sf.square(size=(xL,yL))
sq1 = vf.extrude(square1, amount=(0,0,depth))
sq1.raise_order(refP)
if knot>0:
    sq1.insert_knot(knot/xL,direction=0)

sq1.translate((dX,dY,dZ))
sq1.translate((move,move,0))

with G2('G2/litenMulti') as myfile:
    myfile.write(sq1)
