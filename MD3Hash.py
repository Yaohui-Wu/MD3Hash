#!/usr/bin/env python3
# -*- coding: utf-8 -*-
 
#********************************************************
# 作者：伍耀晖              Author: YaoHui.Wu           *
# 开源日期：2022年6月11日   Open Source Date: 2022-6-11 *
# 国家：中国                Country: China              *
#********************************************************

import os, sys

def Usage():
    print("Usage: python MD3Hash YouWantToHash.File")

def Ternary(iNumeric):
    i, lTrinary = 0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    if iNumeric:
        while iNumeric:
            iNumeric, iRemainder = divmod(iNumeric, 3)

            lTrinary[i] = iRemainder

            i += 1

    return lTrinary[::-1]

# 0 0 0
# 0 1 1
# 0 1 2

def TrinaryAnd(w, x, y):
    for i in range(24):
        if x[i] == y[i] == 0: w[i] = 0

        elif x[i] == 0 and y[i] == 1: w[i] = 0

        elif x[i] == 0 and y[i] == 2: w[i] = 0

        elif x[i] == 1 and y[i] == 0: w[i] = 0

        elif x[i] == y[i] == 1: w[i] = 1

        elif x[i] == 1 and y[i] == 2: w[i] = 1

        elif x[i] == 2 and y[i] == 0: w[i] = 0

        elif x[i] == 2 and y[i] == 1: w[i] = 1

        elif x[i] == y[i] == 2: w[i] = 2

# 0 1 2
# 1 1 2
# 2 2 2

def TrinaryOr(w, x, y):
    for j in range(24):
        if x[j] == y[j] == 0: w[j] = 0

        elif x[j] == 0 and y[j] == 1: w[j] = 1

        elif x[j] == 0 and y[j] == 2: w[j] = 2

        elif x[j] == 1 and y[j] == 0: w[j] = 1

        elif x[j] == y[j] == 1: w[j] = 1

        elif x[j] == 1 and y[j] == 2: w[j] = 2

        elif x[j] == 2 and y[j] == 0: w[j] = 2

        elif x[j] == 2 and y[j] == 1: w[j] = 2

        elif x[j] == y[j] == 2: w[j] = 2

# 0 0 2
# 1 1 1
# 2 2 0

def TrinaryXor(w, x, y):
    for k in range(24):
       if x[k] == y[k] == 0: w[k] = 0

       elif x[k] == 0 and y[k] == 1: w[k] = 0

       elif x[k] == 0 and y[k] == 2: w[k] = 2

       elif x[k] == 1 and y[k] == 0: w[k] = 1

       elif x[k] == y[k] == 1: w[k] = 1

       elif x[k] == 1 and y[k] == 2: w[k] = 1

       elif x[k] == 2 and y[k] == 0: w[k] = 2

       elif x[k] == 2 and y[k] == 1: w[k] = 2

       elif x[k] == y[k] == 2: w[k] = 0

# 2 0 0
# 1 1 1
# 0 2 2

def TrinaryXand(w, x, y):
    for i in range(24):
       if x[i] == y[i] == 0: w[i] = 2

       elif x[i] == 0 and y[i] == 1: w[i] = 0

       elif x[i] == 0 and y[i] == 2: w[i] = 0

       elif x[i] == 1 and y[i] == 0: w[i] = 1

       elif x[i] == y[i] == 1: w[i] = 1

       elif x[i] == 1 and y[i] == 2: w[i] = 1

       elif x[i] == 2 and y[i] == 0: w[i] = 0

       elif x[i] == 2 and y[i] == 1: w[i] = 2

       elif x[i] == y[i] == 2: w[i] = 2

# 0 1 2
# 1 2 0
# 2 0 1

def TrinaryAdd(w, x, y):
    for j in range(24):
        if x[j] == [j] == 0: w[j] = 0

        elif x[j] == 0 and y[j] == 1: w[j] = 1

        elif x[j] == 0 and y[j] == 2: w[j] = 2

        elif x[j] == 1 and y[j] == 0: w[j] = 1

        elif x[j] == y[j] == 1: w[j] = 2

        elif x[j] == 1 and y[j] == 2: w[j] = 0

        elif x[j] == 2 and y[j] == 0: w[j] = 2

        elif x[j] == 2 and y[j] == 1: w[j] = 0

        elif x[j] == y[j] == 2: w[j] = 1

# 0 0 0
# 0 1 2
# 0 2 1

def TrinaryMultiplication(w, x, y):
    for k in range(24):
        if x[k] == y[k] == 0: w[k] = 0

        elif x[k] == 0 and y[k] == 1: w[k] = 0

        elif x[k] == 0 and y[k] == 2: w[k] = 0

        elif x[k] == 1 and y[k] == 0: w[k] = 0

        elif x[k] == y[k] == 1: w[k] = 1

        elif x[k] == 1 and y[k] == 2: w[k] = 2

        elif x[k] == 2 and y[k] == 0: w[k] = 0

        elif x[k] == 2 and y[k] == 1: w[k] = 2

        elif x[k] == y[k] == 2: w[k] = 1

def F(w, x, y, z):
    TrinaryAnd(w, x, y)

    TrinaryOr(w, w, z)

def G(w, x, y, z):
    TrinaryAdd(w, x, z)

    TrinaryMultiplication(w, w, y)

def H(w, x, y, z):
    TrinaryXor(w, x, y)

    TrinaryXand(w, w, z)

def I(w, x, y, z):
    TrinaryMultiplication(w, y, z)

    TrinaryAdd(w, w, x)

def Add(w, z):
    iCarry = 0

    for i in range(24):
        w[i] += z[i] + iCarry

        if w[i] > 2:
            w[i] -= 3

            if iCarry == 0:
                iCarry = 1
        else:
            iCarry = 0

def RotateShiftLeft(w, iBit):
    lSwap = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    for j in range(23, -1, -1):
        lSwap[j] = w[j - iBit if j >= iBit else 24 - iBit + j]

    for k in range(24):
        w[k] = lSwap[k]

def FF(a, b, c, d, e, iShift, k):
    lTemp = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    F(lTemp, b, c, d)

    Add(lTemp, a)

    Add(lTemp, e)

    Add(lTemp, k)

    RotateShiftLeft(lTemp, iShift)

    Add(lTemp, b)

    for i in range(24):
        a[i] = lTemp[i]

def GG(a, b, c, d, e, iShift, k):
    lTemp = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    G(lTemp, c, d, a)

    Add(lTemp, b)

    Add(lTemp, e)

    Add(lTemp, k)

    RotateShiftLeft(lTemp, iShift)

    Add(lTemp, c)

    for j in range(24):
        b[j] = lTemp[j]

def HH(a, b, c, d, e, iShift, k):
    lTemp = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    H(lTemp, d, a, b)

    Add(lTemp, c)

    Add(lTemp, e)

    Add(lTemp, k)

    RotateShiftLeft(lTemp, iShift)

    Add(lTemp, d)

    for i in range(24):
        c[i] = lTemp[i]

def II(a, b, c, d, e, iShift, k):
    lTemp = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    I(lTemp, a, b, c)

    Add(lTemp, d)

    Add(lTemp, e)

    Add(lTemp, k)

    RotateShiftLeft(lTemp, iShift)

    Add(lTemp, a)

    for j in range(24):
        d[j] = lTemp[j]

def MD3Hash(a, b, c, d, e):
    iShift11 = 2

    iShift12 = 3

    iShift13 = 4

    iShift14 = 5

    iShift21 = 6

    iShift22 = 7

    iShift23 = 8

    iShift24 = 11

    iShift31 = 10

    iShift32 = 13

    iShift33 = 14

    iShift34 = 17

    iShift41 = 16

    iShift42 = 19

    iShift43 = 22

    iShift44 = 23

    k0 = (2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0)

    k1 = (1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0)

    k2 = (0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0)

    k3 = (1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0)

    k4 = (1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0)

    k5 = (2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0)

    k6 = (2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0)

    k7 = (2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0)

    k8 = (1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0)

    k9 = (2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0)

    k10 = (1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0)

    k11 = (1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0)

    k12 = (2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0)

    k13 = (2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0)

    k14 = (1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0)

    k15 = (0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0)

    k16 = (0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0)

    k17 = (1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0)

    k18 = (0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0)

    k19 = (1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0)

    k20 = (1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0)

    k21 = (2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0)

    k22 = (1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0)

    k23 = (2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0)

    k24 = (0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0)

    k25 = (0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0)

    k26 = (2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0)

    k27 = (2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)

    k28 = (1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0)

    k29 = (2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0)

    k30 = (1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0)

    k31 = (1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0)

    k32 = (1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0)

    k33 = (2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0)

    k34 = (1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0)

    k35 = (1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0)

    k36 = (2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0)

    k37 = (1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0)

    k38 = (1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0)

    k39 = (0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0)

    k40 = (0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0)

    k41 = (0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0)

    k42 = (2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0)

    k43 = (0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0)

    k44 = (1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0)

    k45 = (0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0)

    k46 = (1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0)

    k47 = (0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0)

    k48 = (0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0)

    k49 = (2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0)

    k50 = (2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0)

    k51 = (1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0)

    k52 = (2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0)

    k53 = (1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0)

    k54 = (2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0)

    k55 = (0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0)

    k56 = (1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0)

    k57 = (2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0)

    k58 = (2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0)

    k59 = (0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0)

    k60 = (1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0)

    k61 = (2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0)

    k62 = (0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0)

    k63 = (2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0)

    FF(a, b, c, d, e[ 0], iShift11, k0)

    FF(b, c, d, a, e[ 1], iShift12, k1)

    FF(c, d, a, b, e[ 2], iShift13, k2)

    FF(d, a, b, c, e[ 3], iShift14, k3)

    FF(a, b, c, d, e[ 4], iShift11, k4)

    FF(b, c, d, a, e[ 5], iShift12, k5)

    FF(c, d, a, b, e[ 6], iShift13, k6)

    FF(d, a, b, c, e[ 7], iShift14, k7)

    FF(a, b, c, d, e[ 8], iShift11, k8)

    FF(b, c, d, a, e[ 9], iShift12, k9)

    FF(c, d, a, b, e[10], iShift13, k10)

    FF(d, a, b, c, e[11], iShift14, k11)

    FF(a, b, c, d, e[12], iShift11, k12)

    FF(b, c, d, a, e[13], iShift12, k13)

    FF(c, d, a, b, e[14], iShift13, k14)

    FF(d, a, b, c, e[15], iShift14, k15)

    GG(a, b, c, d, e[ 1], iShift21, k16)

    GG(d, a, b, c, e[ 6], iShift22, k17)

    GG(c, d, a, b, e[11], iShift23, k18)

    GG(b, c, d, a, e[ 0], iShift24, k19)

    GG(a, b, c, d, e[ 5], iShift21, k20)

    GG(d, a, b, c, e[10], iShift22, k21)

    GG(c, d, a, b, e[15], iShift23, k22)

    GG(b, c, d, a, e[ 4], iShift24, k23)

    GG(a, b, c, d, e[ 9], iShift21, k24)

    GG(d, a, b, c, e[14], iShift22, k25)

    GG(c, d, a, b, e[ 3], iShift23, k26)

    GG(b, c, d, a, e[ 8], iShift24, k27)

    GG(a, b, c, d, e[13], iShift21, k28)

    GG(d, a, b, c, e[ 2], iShift22, k29)

    GG(c, d, a, b, e[ 7], iShift23, k30)

    GG(b, c, d, a, e[12], iShift24, k31)

    HH(a, b, c, d, e[ 5], iShift31, k32)

    HH(b, c, d, a, e[ 8], iShift32, k33)

    HH(c, d, a, b, e[11], iShift33, k34)

    HH(d, a, b, c, e[14], iShift34, k35)

    HH(a, b, c, d, e[ 1], iShift31, k36)

    HH(b, c, d, a, e[ 4], iShift32, k37)

    HH(c, d, a, b, e[ 7], iShift33, k38)

    HH(d, a, b, c, e[10], iShift34, k39)

    HH(a, b, c, d, e[13], iShift31, k40)

    HH(b, c, d, a, e[ 0], iShift32, k41)

    HH(c, d, a, b, e[ 3], iShift33, k42)

    HH(d, a, b, c, e[ 6], iShift34, k43)

    HH(a, b, c, d, e[ 9], iShift31, k44)

    HH(b, c, d, a, e[12], iShift32, k45)

    HH(c, d, a, b, e[15], iShift33, k46)

    HH(d, a, b, c, e[ 2], iShift34, k47)

    II(a, b, c, d, e[ 0], iShift41, k48)

    II(d, a, b, c, e[ 7], iShift42, k49)

    II(c, d, a, b, e[14], iShift43, k50)

    II(b, c, d, a, e[ 5], iShift44, k51)

    II(a, b, c, d, e[12], iShift41, k52)

    II(d, a, b, c, e[ 3], iShift42, k53)

    II(c, d, a, b, e[10], iShift43, k54)

    II(b, c, d, a, e[ 1], iShift44, k55)

    II(a, b, c, d, e[ 8], iShift41, k56)

    II(d, a, b, c, e[15], iShift42, k57)

    II(c, d, a, b, e[ 6], iShift43, k58)

    II(b, c, d, a, e[13], iShift44, k59)

    II(a, b, c, d, e[ 4], iShift41, k60)

    II(d, a, b, c, e[11], iShift42, k61)

    II(c, d, a, b, e[ 2], iShift43, k62)

    II(b, c, d, a, e[ 9], iShift44, k63)

if __name__ == "__main__":
    if len(sys.argv) != 2: Usage()

    else:
        statFileSize = os.stat(sys.argv[1])

        iFileSize = statFileSize.st_size

        if iFileSize == 0:
            print("There is no data in file [{}], 0 byte.".format(sys.argv[1]))

            exit(-1)

        iBytesLeft = iFileSize & 63

        if iBytesLeft == 0: iBytesLeft = iFileSize + 64

        elif iBytesLeft < 54: iBytesLeft = iFileSize - iBytesLeft + 64

        elif iBytesLeft > 53: iBytesLeft = iFileSize - iBytesLeft + 128

        with open(sys.argv[1], "br") as fdData:
            baData = bytearray(fdData.read())

        tPadding = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47,
            53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149,
            151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251,
            15, 25, 35, 45, 55, 65, 75, 85, 95, 105)

        while iFileSize < iBytesLeft:
            for i in range(5):
                baData.append(statFileSize.st_size >> 8 * i & 255)

                iFileSize += 1

            j = 0

            while iFileSize < iBytesLeft - 5:
                baData.append(tPadding[j])

                j += 1

                iFileSize += 1

            for k in range(4, -1, -1):
                baData.append(statFileSize.st_size >> 8 * k & 255)

                iFileSize += 1

        lDigest0 = [1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0]

        lDigest1 = [2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1]

        lDigest2 = [2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0]

        lDigest3 = [1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0]

        for i in range(0, iBytesLeft, 64):
            lTrinary = [];

            for j in range(16):
                lTrinary.append(Ternary( baData[i + 4 * j] + (baData[i + 4 * j + 1] << 8) + (baData[i + 4 * j + 2] << 16) + (baData[i + 4 * j + 3] << 24)))

            MD3Hash(lDigest0, lDigest1, lDigest2, lDigest3, lTrinary)

        for k in range(24):
            print("{:d}{:d}{:d}{:d}".format(lDigest0[k], lDigest1[k], lDigest2[k], lDigest3[k]), sep = "", end = "")

        print()