(*********************************************************
* 作者：伍耀晖               Author: YaoHui.Wu           *
* 开源日期：2022年6月11日    Open Source Date: 2022-6-11 *
* 国家：中国                 Country: China              *
*********************************************************)
(* Compiled by free pascal. free pascal website: www.freepascal.org *)

Program MD3Hash;

Type
    TrinaryArray = Array[0..23] Of Byte;

Const
    bShift11 = 2;

    bShift12 = 22;

    bShift13 = 3;

    bShift14 = 21;

    bShift21 = 5;

    bShift22 = 15;

    bShift23 = 7;

    bShift24 = 14;

    bShift31 = 11;

    bShift32 = 12;

    bShift33 = 13;

    bShift34 = 10;

    bShift41 = 17;

    bShift42 = 6;

    bShift43 = 19;

    bShift44 = 4;

    baPadding : Array[0..63] Of Byte = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 15, 25, 35, 45, 55, 65, 75, 85, 95, 105);

Procedure Usage();
Begin
    WriteLn('Usage: MD3Hash YouWantToHash.File');
End;

Procedure Ternary(uiNumeric : LongWord;
                  Var baTrinary : TrinaryArray);
Var
    i : Byte;

Begin
    baTrinary[0] := 0;

    baTrinary[1] := 0;

    baTrinary[2] := 0;

    baTrinary[3] := 0;

    baTrinary[4] := 0;

    baTrinary[5] := 0;

    baTrinary[6] := 0;

    baTrinary[7] := 0;

    baTrinary[8] := 0;

    baTrinary[9] := 0;

    baTrinary[10] := 0;

    baTrinary[11] := 0;

    baTrinary[12] := 0;

    baTrinary[13] := 0;

    baTrinary[14] := 0;

    baTrinary[15] := 0;

    baTrinary[16] := 0;

    baTrinary[17] := 0;

    baTrinary[18] := 0;

    baTrinary[19] := 0;

    baTrinary[20] := 0;

    baTrinary[21] := 0;

    baTrinary[22] := 0;

    baTrinary[23] := 0;

    If uiNumeric <> 0 Then
    Begin
        For i := 23 DownTo 0 Do
        Begin
            baTrinary[i] := uiNumeric Mod 3;

            uiNumeric := uiNumeric Div 3;
        End;
    End;
End;

(*
 0 0 0
 0 1 1
 0 1 2
*)

Procedure TrinaryAnd(Var w : TrinaryArray;
                     Var x : TrinaryArray;
                     Var y : TrinaryArray);
Var
    i : Byte;

Begin
    For i := 0 To 23 Do
    Begin
        If (x[i] = 0) And (y[i] = 0) Then
        Begin
            w[i] := 0;
        End
        Else If (x[i] = 0) And (y[i] = 1) Then
        Begin
            w[i] := 0;
        End
        Else If (x[i] = 0) And (y[i] = 2) Then
        Begin
            w[i] := 0;
        End
        Else If (x[i] = 1) And (y[i] = 0) Then
        Begin
            w[i] := 0;
        End
        Else If (x[i] = 1) And (y[i] = 1) Then
        Begin
            w[i] := 1;
        End
        Else If (x[i] = 1) And (y[i] = 2) Then
        Begin
            w[i] := 1;
        End
        Else If (x[i] = 2) And (y[i] = 0) Then
        Begin
            w[i] := 0;
        End
        Else If (x[i] = 2) And (y[i] = 1) Then
        Begin
            w[i] := 1;
        End
        Else If (x[i] = 2) And (y[i] = 2) Then
        Begin
            w[i] := 2;
        End;
    End;
End;

(*
 0 1 2
 1 1 2
 2 2 2
*)

Procedure TrinaryOr(Var w : TrinaryArray;
                    Var x : TrinaryArray;
                    Var y : TrinaryArray);
Var
    j : Byte;

Begin
    For j := 0 To 23 Do
    Begin
        If (x[j] = 0) And (y[j] = 0) Then
        Begin
            w[j] := 0;
        End
        Else If (x[j] = 0) And (y[j] = 1) Then
        Begin
            w[j] := 1;
        End
        Else If (x[j] = 0) And (y[j] = 2) Then
        Begin
            w[j] := 2;
        End
        Else If (x[j] = 1) And (y[j] = 0) Then
        Begin
            w[j] := 1;
        End
        Else If (x[j] = 1) And (y[j] = 1) Then
        Begin
            w[j] := 1;
        End
        Else If (x[j] = 1) And (y[j] = 2) Then
        Begin
            w[j] := 2;
        End
        Else If (x[j] = 2) And (y[j] = 0) Then
        Begin
            w[j] := 2;
        End
        Else If (x[j] = 2) And (y[j] = 1) Then
        Begin
            w[j] := 2;
        End
        Else If (x[j] = 2) And (y[j] = 2) Then
        Begin
            w[j] := 2;
        End;
    End;
End;

// 0 0 2
// 1 1 1
// 2 2 0

Procedure TrinaryXor(Var w : TrinaryArray;
                     Var x : TrinaryArray;
                     Var y : TrinaryArray);
Var
    k : Byte;

Begin
    For k := 0 To 23 Do
    Begin
        If (x[k] = 0) And (y[k] = 0) Then
        Begin
            w[k] := 0;
        End
        Else If (x[k] = 0) And (y[k] = 1) Then
        Begin
            w[k] := 0;
        End
        Else If (x[k] = 0) And (y[k] = 2) Then
        Begin
            w[k] := 2;
        End
        Else If (x[k] = 1) And (y[k] = 0) Then
        Begin
            w[k] := 1;
        End
        Else If (x[k] = 1) And (y[k] = 1) Then
        Begin
            w[k] := 1;
        End
        Else If (x[k] = 1) And (y[k] = 2) Then
        Begin
            w[k] := 1;
        End
        Else If (x[k] = 2) And (y[k] = 0) Then
        Begin
            w[k] := 2;
        End
        Else If (x[k] = 2) And (y[k] = 1) Then
        Begin
            w[k] := 2;
        End
        Else If (x[k] = 2) And (y[k] = 2) Then
        Begin
            w[k] := 0;
        End;
    End;
End;

(*
 2 0 0
 1 1 1
 0 2 2
*)

Procedure TrinaryXand(Var w : TrinaryArray;
                      Var x : TrinaryArray;
                      Var y : TrinaryArray);
Var
    i : Byte;

Begin
    For i := 0 To 23 Do
    Begin
        If (x[i] = 0) And (y[i] = 0) Then
        Begin
            w[i] := 2;
        End
        Else If (x[i] = 0) And (y[i] = 1) Then
        Begin
            w[i] := 0;
        End
        Else If (x[i] = 0) And (y[i] = 2) Then
        Begin
            w[i] := 0;
        End
        Else If (x[i] = 1) And (y[i] = 0) Then
        Begin
            w[i] := 1;
        End
        Else If (x[i] = 1) And (y[i] = 1) Then
        Begin
            w[i] := 1;
        End
        Else If (x[i] = 1) And (y[i] = 2) Then
        Begin
            w[i] := 1;
        End
        Else If (x[i] = 2) And (y[i] = 0) Then
        Begin
            w[i] := 0;
        End
        Else If (x[i] = 2) And (y[i] = 1) Then
        Begin
            w[i] := 2;
        End
        Else If (x[i] = 2) And (y[i] = 2) Then
        Begin
            w[i] := 2;
        End;
    End;
End;

(*
 0 1 2
 1 2 0
 2 0 1
*)

Procedure TrinaryAdd(Var w : TrinaryArray;
                     Var x : TrinaryArray;
                     Var y : TrinaryArray);
Var
    j : Byte;

Begin
    For j := 0 To 23 Do
    Begin
        If (x[j] = 0) And (y[j] = 0) Then
        Begin
            w[j] := 0;
        End
        Else If (x[j] = 0) And (y[j] = 1) Then
        Begin
            w[j] := 1;
        End
        Else If (x[j] = 0) And (y[j] = 2) Then
        Begin
            w[j] := 2;
        End
        Else If (x[j] = 1) And (y[j] = 0) Then
        Begin
            w[j] := 1;
        End
        Else If (x[j] = 1) And (y[j] = 1) Then
        Begin
            w[j] := 2;
        End
        Else If (x[j] = 1) And (y[j] = 2) Then
        Begin
            w[j] := 0;
        End
        Else If (x[j] = 2) And (y[j] = 0) Then
        Begin
            w[j] := 2;
        End
        Else If (x[j] = 2) And (y[j] = 1) Then
        Begin
            w[j] := 0;
        End
        Else If (x[j] = 2) And (y[j] = 2) Then
        Begin
            w[j] := 1;
        End;
    End;
End;

(*
 0 0 0
 0 1 2
 0 2 1
*)

Procedure TrinaryMultiplication(Var w : TrinaryArray;
                                Var x : TrinaryArray;
                                Var y : TrinaryArray);
Var
    k : Byte;

Begin
    For k := 0 To 23 Do
    Begin
        If (x[k] = 0) And (y[k] = 0) Then
        Begin
            w[k] := 0;
        End
        Else If (x[k] = 0) And (y[k] = 1) Then
        Begin
            w[k] := 0;
        End
        Else If (x[k] = 0) And (y[k] = 2) Then
        Begin
            w[k] := 0;
        End
        Else If (x[k] = 1) And (y[k] = 0) Then
        Begin
            w[k] := 0;
        End
        Else If (x[k] = 1) And (y[k] = 1) Then
        Begin
            w[k] := 1;
        End
        Else If (x[k] = 1) And (y[k] = 2) Then
        Begin
            w[k] := 2;
        End
        Else If (x[k] = 2) And (y[k] = 0) Then
        Begin
            w[k] := 0;
        End
        Else If (x[k] = 2) And (y[k] = 1) Then
        Begin
            w[k] := 2;
        End
        Else If (x[k] = 2) And (y[k] = 2) Then
        Begin
            w[k] := 1;
        End;
    End;
End;

Procedure F(Var w : TrinaryArray;
            Var x : TrinaryArray;
            Var y : TrinaryArray;
            Var z : TrinaryArray);
Begin
    TrinaryAnd(w, x, y);

    TrinaryOr(w, w, z);
End;

Procedure G(Var w : TrinaryArray;
            Var x : TrinaryArray;
            Var y : TrinaryArray;
            Var z : TrinaryArray);
Begin
    TrinaryAdd(w, x, z);

    TrinaryMultiplication(w, w, y);
End;

Procedure H(Var w : TrinaryArray;
            Var x : TrinaryArray;
            Var y : TrinaryArray;
            Var z : TrinaryArray);
Begin
    TrinaryXor(w, x, y);

    TrinaryXand(w, w, z);
End;

Procedure I1(Var w : TrinaryArray;
            Var x : TrinaryArray;
            Var y : TrinaryArray;
            Var z : TrinaryArray);
Begin
    TrinaryMultiplication(w, y, z);

    TrinaryAdd(w, w, x);
End;

Procedure Add(Var w : TrinaryArray;
              Var z : TrinaryArray);
Var
    bCarry, i : Byte;

Begin
    bCarry := 0;

    For i := 0 To 23 Do
    Begin
        w[i] := w[i] + z[i] + bCarry;

        If w[i] > 2 Then
        Begin
            w[i] := w[i] - 3;

            If bCarry = 0 Then
            Begin
                bCarry := 1;
            End;
        End
        Else
        Begin
            bCarry := 0;
        End;
    End;
End;

Procedure RotateShiftLeft(Var w : TrinaryArray;
                          bBit: Byte);
Var
    baSwap : TrinaryArray = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    i, j, k : Byte;

Begin
    For i := 23 DownTo 0 Do
    Begin
        If i >= bBit Then j := i - bBit Else j := 24 - bBit + i;

        baSwap[i] := w[j];
    End;

    For k := 0 To 23 Do
    Begin
        w[k] := baSwap[k];
    End;
End;

Procedure FF(Var a : TrinaryArray;
             Var b : TrinaryArray;
             Var c : TrinaryArray;
             Var d : TrinaryArray;
             Var e : TrinaryArray;
             bShift : Byte;
             Var k : TrinaryArray);
Var
    baTemp : TrinaryArray = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    i : Byte;

Begin
    F(baTemp, b, c, d);

    Add(baTemp, a);

    Add(baTemp, e);

    Add(baTemp, k);

    RotateShiftLeft(baTemp, bShift);

    Add(baTemp, b);

    For i := 0 To 23 Do
    Begin
        a[i] := baTemp[i];
    End;
End;

Procedure GG(Var a : TrinaryArray;
             Var b : TrinaryArray;
             Var c : TrinaryArray;
             Var d : TrinaryArray;
             Var e : TrinaryArray;
             bShift : Byte;
             Var k : TrinaryArray);
Var
    baTemp : TrinaryArray = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    j : Byte;

Begin
    G(baTemp, c, d, a);

    Add(baTemp, b);

    Add(baTemp, e);

    Add(baTemp, k);

    RotateShiftLeft(baTemp, bShift);

    Add(baTemp, c);

    for j := 0 To 23 Do
    Begin
        b[j] := baTemp[j];
    End;
End;

Procedure HH(Var a : TrinaryArray;
             Var b : TrinaryArray;
             Var c : TrinaryArray;
             Var d : TrinaryArray;
             Var e : TrinaryArray;
             bShift : Byte;
             Var k : TrinaryArray);
Var
    baTemp : TrinaryArray = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    i : Byte;

Begin
    H(baTemp, d, a, b);

    Add(baTemp, c);

    Add(baTemp, e);

    Add(baTemp, k);

    RotateShiftLeft(baTemp, bShift);

    Add(baTemp, d);

    For i := 0 To 23 Do
    Begin
        c[i] := baTemp[i];
    End;
End;

Procedure II(Var a : TrinaryArray;
             Var b : TrinaryArray;
             Var c : TrinaryArray;
             Var d : TrinaryArray;
             Var e : TrinaryArray;
             bShift : Byte;
             Var k : TrinaryArray);
Var
    baTemp : TrinaryArray = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    j : Byte;

Begin
    I1(baTemp, a, b, c);

    Add(baTemp, d);

    Add(baTemp, e);

    Add(baTemp, k);

    RotateShiftLeft(baTemp, bShift);

    Add(baTemp, a);

    For j := 0 To 23 Do
    Begin
        d[j] := baTemp[j];
    End;
End;

Procedure MD3Hash(Var a : TrinaryArray;
                  Var b : TrinaryArray;
                  Var c : TrinaryArray;
                  Var d : TrinaryArray;
                  Var e : Array Of TrinaryArray);
Const
    k0 : TrinaryArray = (2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0);

    k1 : TrinaryArray = (1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0);

    k2 : TrinaryArray = (0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0);

    k3 : TrinaryArray = (1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0);

    k4 : TrinaryArray = (1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0);

    k5 : TrinaryArray = (2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0);

    k6 : TrinaryArray = (2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0);

    k7 : TrinaryArray = (2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0);

    k8 : TrinaryArray = (1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0);

    k9 : TrinaryArray = (2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0);

    k10 : TrinaryArray = (1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0);

    k11 : TrinaryArray = (1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0);

    k12 : TrinaryArray = (2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0);

    k13 : TrinaryArray = (2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0);

    k14 : TrinaryArray = (1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0);

    k15 : TrinaryArray = (0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0);

    k16 : TrinaryArray = (0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0);

    k17 : TrinaryArray = (1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0);

    k18 : TrinaryArray = (0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0);

    k19 : TrinaryArray = (1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0);

    k20 : TrinaryArray = (1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0);

    k21 : TrinaryArray = (2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0);

    k22 : TrinaryArray = (1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0);

    k23 : TrinaryArray = (2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0);

    k24 : TrinaryArray = (0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0);

    k25 : TrinaryArray = (0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0);

    k26 : TrinaryArray = (2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0);

    k27 : TrinaryArray = (2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);

    k28 : TrinaryArray = (1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0);

    k29 : TrinaryArray = (2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0);

    k30 : TrinaryArray = (1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0);

    k31 : TrinaryArray = (1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0);

    k32 : TrinaryArray = (1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0);

    k33 : TrinaryArray = (2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0);

    k34 : TrinaryArray = (1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0);

    k35 : TrinaryArray = (1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0);

    k36 : TrinaryArray = (2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0);

    k37 : TrinaryArray = (1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0);

    k38 : TrinaryArray = (1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0);

    k39 : TrinaryArray = (0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0);

    k40 : TrinaryArray = (0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0);

    k41 : TrinaryArray = (0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0);

    k42 : TrinaryArray = (2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0);

    k43 : TrinaryArray = (0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0);

    k44 : TrinaryArray = (1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0);

    k45 : TrinaryArray = (0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0);

    k46 : TrinaryArray = (1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0);

    k47 : TrinaryArray = (0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0);

    k48 : TrinaryArray = (0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0);

    k49 : TrinaryArray = (2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0);

    k50 : TrinaryArray = (2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0);

    k51 : TrinaryArray = (1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0);

    k52 : TrinaryArray = (2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0);

    k53 : TrinaryArray = (1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0);

    k54 : TrinaryArray = (2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0);

    k55 : TrinaryArray = (0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0);

    k56 : TrinaryArray = (1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0);

    k57 : TrinaryArray = (2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0);

    k58 : TrinaryArray = (2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0);

    k59 : TrinaryArray = (0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0);

    k60 : TrinaryArray = (1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0);

    k61 : TrinaryArray = (2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0);

    k62 : TrinaryArray = (0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0);

    k63 : TrinaryArray = (2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0);

Begin
    FF(a, b, c, d, e[ 0], bShift11, k0);

    FF(b, c, d, a, e[ 1], bShift12, k1);

    FF(c, d, a, b, e[ 2], bShift13, k2);

    FF(d, a, b, c, e[ 3], bShift14, k3);

    FF(a, b, c, d, e[ 4], bShift11, k4);

    FF(b, c, d, a, e[ 5], bShift12, k5);

    FF(c, d, a, b, e[ 6], bShift13, k6);

    FF(d, a, b, c, e[ 7], bShift14, k7);

    FF(a, b, c, d, e[ 8], bShift11, k8);

    FF(b, c, d, a, e[ 9], bShift12, k9);

    FF(c, d, a, b, e[10], bShift13, k10);

    FF(d, a, b, c, e[11], bShift14, k11);

    FF(a, b, c, d, e[12], bShift11, k12);

    FF(b, c, d, a, e[13], bShift12, k13);

    FF(c, d, a, b, e[14], bShift13, k14);

    FF(d, a, b, c, e[15], bShift14, k15);

    GG(a, b, c, d, e[ 1], bShift21, k16);

    GG(d, a, b, c, e[ 6], bShift22, k17);

    GG(c, d, a, b, e[11], bShift23, k18);

    GG(b, c, d, a, e[ 0], bShift24, k19);

    GG(a, b, c, d, e[ 5], bShift21, k20);

    GG(d, a, b, c, e[10], bShift22, k21);

    GG(c, d, a, b, e[15], bShift23, k22);

    GG(b, c, d, a, e[ 4], bShift24, k23);

    GG(a, b, c, d, e[ 9], bShift21, k24);

    GG(d, a, b, c, e[14], bShift22, k25);

    GG(c, d, a, b, e[ 3], bShift23, k26);

    GG(b, c, d, a, e[ 8], bShift24, k27);

    GG(a, b, c, d, e[13], bShift21, k28);

    GG(d, a, b, c, e[ 2], bShift22, k29);

    GG(c, d, a, b, e[ 7], bShift23, k30);

    GG(b, c, d, a, e[12], bShift24, k31);

    HH(a, b, c, d, e[ 5], bShift31, k32);

    HH(b, c, d, a, e[ 8], bShift32, k33);

    HH(c, d, a, b, e[11], bShift33, k34);

    HH(d, a, b, c, e[14], bShift34, k35);

    HH(a, b, c, d, e[ 1], bShift31, k36);

    HH(b, c, d, a, e[ 4], bShift32, k37);

    HH(c, d, a, b, e[ 7], bShift33, k38);

    HH(d, a, b, c, e[10], bShift34, k39);

    HH(a, b, c, d, e[13], bShift31, k40);

    HH(b, c, d, a, e[ 0], bShift32, k41);

    HH(c, d, a, b, e[ 3], bShift33, k42);

    HH(d, a, b, c, e[ 6], bShift34, k43);

    HH(a, b, c, d, e[ 9], bShift31, k44);

    HH(b, c, d, a, e[12], bShift32, k45);

    HH(c, d, a, b, e[15], bShift33, k46);

    HH(d, a, b, c, e[ 2], bShift34, k47);

    II(a, b, c, d, e[ 0], bShift41, k48);

    II(d, a, b, c, e[ 7], bShift42, k49);

    II(c, d, a, b, e[14], bShift43, k50);

    II(b, c, d, a, e[ 5], bShift44, k51);

    II(a, b, c, d, e[12], bShift41, k52);

    II(d, a, b, c, e[ 3], bShift42, k53);

    II(c, d, a, b, e[10], bShift43, k54);

    II(b, c, d, a, e[ 1], bShift44, k55);

    II(a, b, c, d, e[ 8], bShift41, k56);

    II(d, a, b, c, e[15], bShift42, k57);

    II(c, d, a, b, e[ 6], bShift43, k58);

    II(b, c, d, a, e[13], bShift44, k59);

    II(a, b, c, d, e[ 4], bShift41, k60);

    II(d, a, b, c, e[11], bShift42, k61);

    II(c, d, a, b, e[ 2], bShift43, k62);

    II(b, c, d, a, e[ 9], bShift44, k63);
End;

Var
    fdData : File;

    i, j, ulFileSize, ulBytesLeft : QWord;

    bpData : PByte;

    k, l : Byte;

    baDigest0 : TrinaryArray = (1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0);

    baDigest1 : TrinaryArray = (2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1);

    baDigest2 : TrinaryArray = (2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0);

    baDigest3 : TrinaryArray = (1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0);

    baTrinary : Array[0..15] Of TrinaryArray;

Begin
    If ParamCount <> 1 Then
    Begin
        Usage();
    End
    Else
    Begin
        Assign(fdData, ParamStr(1));

        Reset(fdData, 1);

        ulFileSize := FileSize(fdData);

        If ulFileSize = 0 Then
        Begin
            WriteLn('There is no data in file [', ParamStr(1), '], 0 byte.');

            Halt(-1);
        End;

        ulBytesLeft := ulFileSize And 63;

        If ulBytesLeft = 0 Then
        Begin
            ulBytesLeft := ulFileSize + 64;
        End
        Else If ulBytesLeft < 54 Then
        Begin
            ulBytesLeft := ulFileSize - ulBytesLeft + 64;
        End
        Else If ulBytesLeft > 53 Then
        Begin
            ulBytesLeft := ulFileSize - ulBytesLeft + 128;
        End;

        bpData := GetMem(ulBytesLeft);

        BlockRead(fdData, bpData^, ulFileSize);

        Close(fdData);

        For i := 0 To 4 Do
        Begin
            bpData[i + ulFileSize] := ulFileSize Shr (8 * i);
        End;

        k := 0;

        For j := ulFileSize + 5 To ulBytesLeft - 6 Do
        Begin
            bpData[j] := baPadding[k];

            k := k + 1;
        End;

        For l := 4 DownTo 0 Do
        Begin
            bpData[ulBytesLeft - l - 1] := ulFileSize Shr (8 * l);
        End;

        i := 0;

        While i < ulBytesLeft Do
        Begin
            For j := 0 To 15 Do
            Begin
                Ternary(bpData[i + 4 * j] + (bpData[i + 4 * j + 1] << 8) + (bpData[i + 4 * j + 2] << 16) + (bpData[i + 4 * j + 3] << 24), baTrinary[j]);
            End;

            MD3Hash(baDigest0, baDigest1, baDigest2, baDigest3, baTrinary);

            i := i + 64;
        End;

        For k := 0 To 23 Do
        Begin
            Write(baDigest0[k], baDigest1[k], baDigest2[k], baDigest3[k]);
        End;

        WriteLn();

        FreeMem(bpData);
    End;
End.