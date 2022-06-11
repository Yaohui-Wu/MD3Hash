/'********************************************************
* 作者：伍耀晖               Author: YaoHui.Wu           *
* 开源日期：2022年6月11日    Open Source Date: 2022-6-11 *
* 国家：中国                 Country: China              *
********************************************************'/
' Compiled by free basic. free basic website: www.freebasic.net

#include "file.bi"

Sub Usage()
    Print "Usage: MD3Hash YouWantToHash.File"
End Sub

Sub Ternary(ByVal ulNumeric As ULongInt, ubpTrinary As UByte Pointer)
    ubpTrinary[0] = 0

    ubpTrinary[1] = 0

    ubpTrinary[2] = 0

    ubpTrinary[3] = 0

    ubpTrinary[4] = 0

    ubpTrinary[5] = 0

    ubpTrinary[6] = 0

    ubpTrinary[7] = 0

    ubpTrinary[8] = 0

    ubpTrinary[9] = 0

    ubpTrinary[10] = 0

    ubpTrinary[11] = 0

    ubpTrinary[12] = 0

    ubpTrinary[13] = 0

    ubpTrinary[14] = 0

    ubpTrinary[15] = 0

    ubpTrinary[16] = 0

    ubpTrinary[17] = 0

    ubpTrinary[18] = 0

    ubpTrinary[19] = 0

    ubpTrinary[20] = 0

    ubpTrinary[21] = 0

    ubpTrinary[22] = 0

    ubpTrinary[23] = 0

    If ulNumeric <> 0 Then
        For i As Byte = 23 To 0 Step -1
            ubpTrinary[i] = ulNumeric Mod 3

            ulNumeric \= 3
        Next i
    End If
End Sub

/'
 0 0 0
 0 1 1
 0 1 2
'/

Sub TrinaryAnd(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer)
    For i As UByte = 0 To 23
        If x[i] = 0 AndAlso y[i] = 0 Then
            w[i] = 0
        ElseIf x[i] = 0 AndAlso y[i] = 1 Then
            w[i] = 0
        ElseIf x[i] = 0 AndAlso y[i] = 2 Then
            w[i] = 0
        ElseIf x[i] = 1 AndAlso y[i] = 0 Then
            w[i] = 0
        ElseIf x[i] = 1 AndAlso y[i] = 1 Then
            w[i] = 1
        ElseIf x[i] = 1 AndAlso y[i] = 2 Then
            w[i] = 1
        ElseIf x[i] = 2 AndAlso y[i] = 0 Then
            w[i] = 0
        ElseIf x[i] = 2 AndAlso y[i] = 1 Then
            w[i] = 1
        ElseIf x[i] = 2 AndAlso y[i] = 2 Then
            w[i] = 2
        End If
    Next i
End Sub

/'
 0 1 2
 1 1 2
 2 2 2
'/

Sub TrinaryOr(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer)
    For j As UByte = 0 To 23
        If x[j] = 0 AndAlso y[j] = 0 Then
            w[j] = 0
        ElseIf x[j] = 0 AndAlso y[j] = 1 Then
            w[j] = 1
        ElseIf x[j] = 0 AndAlso y[j] = 2 Then
            w[j] = 2
        ElseIf x[j] = 1 AndAlso y[j] = 0 Then
            w[j] = 1
        ElseIf x[j] = 1 AndAlso y[j] = 1 Then
            w[j] = 1
        ElseIf x[j] = 1 AndAlso y[j] = 2 Then
            w[j] = 2
        ElseIf x[j] = 2 AndAlso y[j] = 0 Then
            w[j] = 2
        ElseIf x[j] = 2 AndAlso y[j] = 1 Then
            w[j] = 2
        ElseIf x[j] = 2 AndAlso y[j] = 2 Then
            w[j] = 2
        End If
    Next j
End Sub

/'
 0 0 2
 1 1 1
 2 2 0
'/

Sub TrinaryXor(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer)
    For k As UByte = 0 To 23
        If x[k] = 0 AndAlso y[k] = 0 Then
            w[k] = 0
        ElseIf x[k] = 0 AndAlso y[k] = 1 Then
            w[k] = 0
        ElseIf x[k] = 0 AndAlso y[k] = 2 Then
            w[k] = 2
        ElseIf x[k] = 1 AndAlso y[k] = 0 Then
            w[k] = 1
        ElseIf x[k] = 1 AndAlso y[k] = 1 Then
            w[k] = 1
        ElseIf x[k] = 1 AndAlso y[k] = 2 Then
            w[k] = 1
        ElseIf x[k] = 2 AndAlso y[k] = 0 Then
            w[k] = 2
        ElseIf x[k] = 2 AndAlso y[k] = 1 Then
            w[k] = 2
        ElseIf x[k] = 2 AndAlso y[k] = 2 Then
            w[k] = 0
        End If
    Next k
End Sub

/'
 2 0 0
 1 1 1
 0 2 2
'/

Sub TrinaryXand(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer)
    For i As UByte = 0 To 23
        If x[i] = 0 AndAlso y[i] = 0 Then
            w[i] = 2
        ElseIf x[i] = 0 AndAlso y[i] = 1 Then
            w[i] = 0
        ElseIf x[i] = 0 AndAlso y[i] = 2 Then
            w[i] = 0
        Elseif x[i] = 1 AndAlso y[i] = 0 Then
            w[i] = 1
        Elseif x[i] = 1 AndAlso y[i] = 1 Then
            w[i] = 1
        Elseif x[i] = 1 AndAlso y[i] = 2 Then
            w[i] = 1
        Elseif x[i] = 2 AndAlso y[i] = 0 Then
            w[i] = 0
        Elseif x[i] = 2 AndAlso y[i] = 1 Then
            w[i] = 2
        Elseif x[i] = 2 AndAlso y[i] = 2 Then
            w[i] = 2
        End If
    Next i
End Sub

/'
 0 1 2
 1 2 0
 2 0 1
'/

Sub TrinaryAdd(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer)
    For j As UByte = 0 To 23
        If x[j] = 0 AndAlso y[j] = 0 Then
            w[j] = 0
        ElseIf x[j] = 0 AndAlso y[j] = 1 Then
            w[j] = 1
        ElseIf x[j] = 0 AndAlso y[j] = 2 Then
            w[j] = 2
        ElseIf x[j] = 1 AndAlso y[j] = 0 Then
            w[j] = 1
        ElseIf x[j] = 1 AndAlso y[j] = 1 Then
            w[j] = 2
        ElseIf x[j] = 1 AndAlso y[j] = 2 Then
            w[j] = 0
        ElseIf x[j] = 2 AndAlso y[j] = 0 Then
            w[j] = 2
        ElseIf x[j] = 2 AndAlso y[j] = 1 Then
            w[j] = 0
        ElseIf x[j] = 2 AndAlso y[j] = 2 Then
            w[j] = 1
        End If
    Next j
End Sub

/'
 0 0 0
 0 1 2
 0 2 1
'/

Sub TrinaryMultiplication(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer)
    For k As UByte = 0 To 23
        If x[k] = 0 AndAlso y[k] = 0 Then
            w[k] = 0
        ElseIf x[k] = 0 AndAlso y[k] = 1 Then
            w[k] = 0
        ElseIf x[k] = 0 AndAlso y[k] = 2 Then
            w[k] = 0
        ElseIf x[k] = 1 AndAlso y[k] = 0 Then
            w[k] = 0
        ElseIf x[k] = 1 AndAlso y[k] = 1 Then
            w[k] = 1
        ElseIf x[k] = 1 AndAlso y[k] = 2 Then
            w[k] = 2
        ElseIf x[k] = 2 AndAlso y[k] = 0 Then
            w[k] = 0
        ElseIf x[k] = 2 AndAlso y[k] = 1 Then
            w[k] = 2
        ElseIf x[k] = 2 AndAlso y[k] = 2 Then
            w[k] = 1
        End If
    Next k
End Sub

Sub F(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer, z As UByte Pointer)
    TrinaryAnd(w, x, y)

    TrinaryOr(w, w, z)
End Sub

Sub G(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer, z As UByte Pointer)
    TrinaryAdd(w, x, z)

    TrinaryMultiplication(w, w, y)
End Sub

Sub H(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer, z As UByte Pointer)
    TrinaryXor(w, x, y)

    TrinaryXand(w, w, z)
End Sub

Sub I1(w As UByte Pointer, x As UByte Pointer, y As UByte Pointer, z As UByte Pointer)
    TrinaryMultiplication(w, y, z)

    TrinaryAdd(w, w, x)
End Sub

Sub Add(w As UByte Pointer, z As UByte Pointer)
    Dim As Byte bCarry = 0

    For i As UByte = 0 To 23
        w[i] += z[i] + bCarry

        If w[i] > 2 Then
            w[i] -= 3

            If bCarry = 0 Then
                bCarry = 1
            End If
        Else
            bCarry = 0
        End If
    Next i
End Sub

Sub RotateShiftLeft(w As UByte Pointer, bBit As UByte)
    Dim As UByte ubaSwap(23) => {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    For i As Byte = 23 To 0 Step -1
        Dim As UByte j

        If i >= bBit Then
            j = i - bBit
        Else
            j = 24 - bBit + i
        End If

        ubaSwap(i) = w[j]
    Next i

    For k As UByte = 0 To 23
        w[k] = ubaSwap(k)
    Next k
End Sub

Sub FF(a As UByte Pointer, b As UByte Pointer, c As UByte Pointer, d As UByte Pointer, e As UByte Pointer, bShift As UByte, k As UByte Pointer)
    Dim As UByte ubaTemp(23) => {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    F(@ubaTemp(0), b, c, d)

    Add(@ubaTemp(0), a)

    Add(@ubaTemp(0), e)

    Add(@ubaTemp(0), k)

    RotateShiftLeft(@ubaTemp(0), bShift)

    Add(@ubaTemp(0), b)

    For i As UByte = 0 To 23
        a[i] = ubaTemp(i)
    Next i
End Sub

Sub GG(a As UByte Pointer, b As UByte Pointer, c As UByte Pointer, d As UByte Pointer, e As UByte Pointer, bShift As UByte, k As UByte Pointer)
    Dim As UByte ubaTemp(23) => {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    G(@ubaTemp(0), c, d, a)

    Add(@ubaTemp(0), b)

    Add(@ubaTemp(0), e)

    Add(@ubaTemp(0), k)

    RotateShiftLeft(@ubaTemp(0), bShift)

    Add(@ubaTemp(0), c)

    For j As UByte = 0 To 23
        b[j] = ubaTemp(j)
    Next j
End Sub

Sub HH(a As UByte Pointer, b As UByte Pointer, c As UByte Pointer, d As UByte Pointer, e As UByte Pointer, bShift As UByte, k As UByte Pointer)
    Dim As UByte ubaTemp(23) => {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    H(@ubaTemp(0), d, a, b)

    Add(@ubaTemp(0), c)

    Add(@ubaTemp(0), e)

    Add(@ubaTemp(0), k)

    RotateShiftLeft(@ubaTemp(0), bShift)

    Add(@ubaTemp(0), d)

    For i As UByte = 0 To 23
        c[i] = ubaTemp(i)
    Next i
End Sub

Sub II(a As UByte Pointer, b As UByte Pointer, c As UByte Pointer, d As UByte Pointer, e As UByte Pointer, bShift As UByte, k As UByte Pointer)
    Dim As UByte ubaTemp(23) => {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    I1(@ubaTemp(0), a, b, c)

    Add(@ubaTemp(0), d)

    Add(@ubaTemp(0), e)

    Add(@ubaTemp(0), k)

    RotateShiftLeft(@ubaTemp(0), bShift)

    Add(@ubaTemp(0), a)

    For j As UByte = 0 To 23
        d[j] = ubaTemp(j)
    Next j
End Sub

Sub MD3Hash(a As UByte Pointer, b As UByte Pointer, c As UByte Pointer, d As UByte Pointer, e() As UByte)
    Const bShift11 = 2, bShift12 = 3, bShift13 = 4, bShift14 = 5, bShift21 = 6, bShift22 = 7, bShift23 = 8, bShift24 = 11, bShift31 = 10, bShift32 = 13, bShift33 = 14, bShift34 = 17, bShift41 = 16, bShift42 = 19, bShift43 = 22, bShift44 = 23

    Dim As UByte k0(23) => {2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0}

    Dim As UByte k1(23) => {1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0}

    Dim As UByte k2(23) => {0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0}

    Dim As UByte k3(23) => {1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0}

    Dim As UByte k4(23) => {1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0}

    Dim As UByte k5(23) => {2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0}

    Dim As UByte k6(23) => {2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0}

    Dim As UByte k7(23) => {2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte k8(23) => {1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0}

    Dim As UByte k9(23) => {2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0}

    Dim As UByte k10(23) => {1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0}

    Dim As UByte k11(23) => {1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0}

    Dim As UByte k12(23) => {2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0}

    Dim As UByte k13(23) => {2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte k14(23) => {1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0}

    Dim As UByte k15(23) => {0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0}

    Dim As UByte k16(23) => {0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0}

    Dim As UByte k17(23) => {1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0}

    Dim As UByte k18(23) => {0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0}

    Dim As UByte k19(23) => {1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0}

    Dim As UByte k20(23) => {1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0}

    Dim As UByte k21(23) => {2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0}

    Dim As UByte k22(23) => {1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0}

    Dim As UByte k23(23) => {2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0}

    Dim As UByte k24(23) => {0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0}

    Dim As UByte k25(23) => {0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0}

    Dim As UByte k26(23) => {2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0}

    Dim As UByte k27(23) => {2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0}

    Dim As UByte k28(23) => {1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0}

    Dim As UByte k29(23) => {2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte k30(23) => {1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0}

    Dim As UByte k31(23) => {1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0}

    Dim As UByte k32(23) => {1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0}

    Dim As UByte k33(23) => {2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0}

    Dim As UByte k34(23) => {1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0}

    Dim As UByte k35(23) => {1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte k36(23) => {2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0}

    Dim As UByte k37(23) => {1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0}

    Dim As UByte k38(23) => {1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte k39(23) => {0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0}

    Dim As UByte k40(23) => {0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0}

    Dim As UByte k41(23) => {0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0}

    Dim As UByte k42(23) => {2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0}

    Dim As UByte k43(23) => {0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0}

    Dim As UByte k44(23) => {1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0}

    Dim As UByte k45(23) => {0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0}

    Dim As UByte k46(23) => {1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0}

    Dim As UByte k47(23) => {0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0}

    Dim As UByte k48(23) => {0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0}

    Dim As UByte k49(23) => {2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0}

    Dim As UByte k50(23) => {2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0}

    Dim As UByte k51(23) => {1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte k52(23) => {2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0}

    Dim As UByte k53(23) => {1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0}

    Dim As UByte k54(23) => {2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0}

    Dim As UByte k55(23) => {0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0}

    Dim As UByte k56(23) => {1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0}

    Dim As UByte k57(23) => {2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0}

    Dim As UByte k58(23) => {2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0}

    Dim As UByte k59(23) => {0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0}

    Dim As UByte k60(23) => {1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0}

    Dim As UByte k61(23) => {2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0}

    Dim As UByte k62(23) => {0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0}

    Dim As UByte k63(23) => {2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0}

    FF(a, b, c, d, @e( 0, 0), bShift11, @k0(0))

    FF(b, c, d, a, @e( 1, 0), bShift12, @k1(0))

    FF(c, d, a, b, @e( 2, 0), bShift13, @k2(0))

    FF(d, a, b, c, @e( 3, 0), bShift14, @k3(0))

    FF(a, b, c, d, @e( 4, 0), bShift11, @k4(0))

    FF(b, c, d, a, @e( 5, 0), bShift12, @k5(0))

    FF(c, d, a, b, @e( 6, 0), bShift13, @k6(0))

    FF(d, a, b, c, @e( 7, 0), bShift14, @k7(0))

    FF(a, b, c, d, @e( 8, 0), bShift11, @k8(0))

    FF(b, c, d, a, @e( 9, 0), bShift12, @k9(0))

    FF(c, d, a, b, @e(10, 0), bShift13, @k10(0))

    FF(d, a, b, c, @e(11, 0), bShift14, @k11(0))

    FF(a, b, c, d, @e(12, 0), bShift11, @k12(0))

    FF(b, c, d, a, @e(13, 0), bShift12, @k13(0))

    FF(c, d, a, b, @e(14, 0), bShift13, @k14(0))

    FF(d, a, b, c, @e(15, 0), bShift14, @k15(0))

    GG(a, b, c, d, @e( 1, 0), bShift21, @k16(0))

    GG(d, a, b, c, @e( 6, 0), bShift22, @k17(0))

    GG(c, d, a, b, @e(11, 0), bShift23, @k18(0))

    GG(b, c, d, a, @e( 0, 0), bShift24, @k19(0))

    GG(a, b, c, d, @e( 5, 0), bShift21, @k20(0))

    GG(d, a, b, c, @e(10, 0), bShift22, @k21(0))

    GG(c, d, a, b, @e(15, 0), bShift23, @k22(0))

    GG(b, c, d, a, @e( 4, 0), bShift24, @k23(0))

    GG(a, b, c, d, @e( 9, 0), bShift21, @k24(0))

    GG(d, a, b, c, @e(14, 0), bShift22, @k25(0))

    GG(c, d, a, b, @e( 3, 0), bShift23, @k26(0))

    GG(b, c, d, a, @e( 8, 0), bShift24, @k27(0))

    GG(a, b, c, d, @e(13, 0), bShift21, @k28(0))

    GG(d, a, b, c, @e( 2, 0), bShift22, @k29(0))

    GG(c, d, a, b, @e( 7, 0), bShift23, @k30(0))

    GG(b, c, d, a, @e(12, 0), bShift24, @k31(0))

    HH(a, b, c, d, @e( 5, 0), bShift31, @k32(0))

    HH(b, c, d, a, @e( 8, 0), bShift32, @k33(0))

    HH(c, d, a, b, @e(11, 0), bShift33, @k34(0))

    HH(d, a, b, c, @e(14, 0), bShift34, @k35(0))

    HH(a, b, c, d, @e( 1, 0), bShift31, @k36(0))

    HH(b, c, d, a, @e( 4, 0), bShift32, @k37(0))

    HH(c, d, a, b, @e( 7, 0), bShift33, @k38(0))

    HH(d, a, b, c, @e(10, 0), bShift34, @k39(0))

    HH(a, b, c, d, @e(13, 0), bShift31, @k40(0))

    HH(b, c, d, a, @e( 0, 0), bShift32, @k41(0))

    HH(c, d, a, b, @e( 3, 0), bShift33, @k42(0))

    HH(d, a, b, c, @e( 6, 0), bShift34, @k43(0))

    HH(a, b, c, d, @e( 9, 0), bShift31, @k44(0))

    HH(b, c, d, a, @e(12, 0), bShift32, @k45(0))

    HH(c, d, a, b, @e(15, 0), bShift33, @k46(0))

    HH(d, a, b, c, @e( 2, 0), bShift34, @k47(0))

    II(a, b, c, d, @e( 0, 0), bShift41, @k48(0))

    II(d, a, b, c, @e( 7, 0), bShift42, @k49(0))

    II(c, d, a, b, @e(14, 0), bShift43, @k50(0))

    II(b, c, d, a, @e( 5, 0), bShift44, @k51(0))

    II(a, b, c, d, @e(12, 0), bShift41, @k52(0))

    II(d, a, b, c, @e( 3, 0), bShift42, @k53(0))

    II(c, d, a, b, @e(10, 0), bShift43, @k54(0))

    II(b, c, d, a, @e( 1, 0), bShift44, @k55(0))

    II(a, b, c, d, @e( 8, 0), bShift41, @k56(0))

    II(d, a, b, c, @e(15, 0), bShift42, @k57(0))

    II(c, d, a, b, @e( 6, 0), bShift43, @k58(0))

    II(b, c, d, a, @e(13, 0), bShift44, @k59(0))

    II(a, b, c, d, @e( 4, 0), bShift41, @k60(0))

    II(d, a, b, c, @e(11, 0), bShift42, @k61(0))

    II(c, d, a, b, @e( 2, 0), bShift43, @k62(0))

    II(b, c, d, a, @e( 9, 0), bShift44, @k63(0))
End Sub

Sub Main()
    Dim As UByte ubCLAA = 1, k, ubaTrinary(15, 23)

    Dim As Byte l

    Dim As ULongInt ulFileSize, ulBytesLeft, i, j

    Dim As UByte Pointer ubpData

    Dim As UByte ubaPadding(63) => {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 15, 25, 35, 45, 55, 65, 75, 85, 95, 105}

    Dim As UByte ubaDigest0(23) => {1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0}

    Dim As UByte ubaDigest1(23) => {2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1}

    Dim As UByte ubaDigest2(23) => {2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0}

    Dim As UByte ubaDigest3(23) => {1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0}

    Do
        Dim As String strCLA = Command(ubCLAA)

        If Len(strCLA) = 0 Then
            Exit Do
        End If

        ubCLAA += 1
    Loop

    If ubCLAA <> 2 Then
        Usage()
    Else
        ulFileSize = FileLen(Command(1))

        If ulFileSize = 0 Then
            Print "There is no data in file [" & Command(1) & "], 0 byte."

            End -1
        End If

        ulBytesLeft = ulFileSize And 63

        If ulBytesLeft = 0 Then
            ulBytesLeft = ulFileSize + 64
        ElseIf ulBytesLeft < 54 Then
            ulBytesLeft = ulFileSize - ulBytesLeft + 64
        ElseIf ulBytesLeft > 53 Then
            ulBytesLeft = ulFileSize - ulBytesLeft + 128
        End If

        ubpData = New UByte[ulBytesLeft]

        Open Command(1) For Binary Access Read As #3

        Get #3, , *ubpData, ulFileSize

        Close #3

        For i = 0 To 4
            ubpData[i + ulFileSize] = ulFileSize Shr 8 * i
        Next i

        k = 0

        For j = ulFileSize + 5 To ulBytesLeft - 6
            ubpData[j] = ubaPadding(k)

            k += 1
        Next j

        For l = 4 To 0 Step -1
            ubpData[ulBytesLeft - l - 1] = ulFileSize Shr 8 * l
        Next l

        For i = 0 To ulBytesLeft - 1 Step 64
            For j = 0 To 15
                Ternary(ubpData[i + 4 * j] + ubpData[i + 4 * j + 1] Shl 8 + ubpData[i + 4 * j + 2] Shl 16 + ubpData[i + 4 * j + 3] Shl 24, @ubaTrinary(j, 0))
            Next j

            MD3Hash(@ubaDigest0(0), @ubaDigest1(0), @ubaDigest2(0), @ubaDigest3(0), ubaTrinary())
        Next i

        For k = 0 To 23
            Print ubaDigest0(k); ubaDigest1(k); ubaDigest2(k); ubaDigest3(k);
        Next k

        Print

        Delete ubpData
    End If
End Sub

Main()