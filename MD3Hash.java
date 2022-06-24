/*********************************************************
* 作者：伍耀晖               Author: YaoHui.Wu           *
* 开源日期：2022年6月11日    Open Source Date: 2022-6-11 *
* 国家：中国                 Country: China              *
*********************************************************/

import java.io.*;

public class MD3Hash
{
    private static void Usage()
    {
        System.out.printf("Usage: java MD3Hash YouWantToHash.File\n");
    }

    private static void Ternary(long lNumeric,
                                byte[] baTrinary)
    {
        baTrinary[0] = baTrinary[1] = baTrinary[2] = baTrinary[3] = baTrinary[4] = baTrinary[5] = baTrinary[6] = baTrinary[7] = baTrinary[8] = baTrinary[9] = baTrinary[10] = baTrinary[11] = baTrinary[12] = baTrinary[13] = baTrinary[14] = baTrinary[15] = baTrinary[16] = baTrinary[17] = baTrinary[18] = baTrinary[19] = baTrinary[20] = baTrinary[21] = baTrinary[22] = baTrinary[23] = 0;

        if(lNumeric != 0)
        {
            for(int i = 23; i > -1; --i)
            {
                baTrinary[i] = (byte)(lNumeric % 3 & 255);

                lNumeric /= 3;
            }
        }
    }

// 0 0 0
// 0 1 1
// 0 1 2

    private static void TrinaryAnd(byte[] w,
                                   byte[] x,
                                   byte[] y)
    {
        for(int i = 0; i < 24; ++i)
        {
            if(x[i] == 0 && y[i] == 0)
            {
                w[i] = 0;
            }
            else if(x[i] == 0 && y[i] == 1)
            {
                w[i] = 0;
            }
            else if(x[i] == 0 && y[i] == 2)
            {
                w[i] = 0;
            }
            else if(x[i] == 1 && y[i] == 0)
            {
                w[i] = 0;
            }
            else if(x[i] == 1 && y[i] == 1)
            {
                w[i] = 1;
            }
            else if(x[i] == 1 && y[i] == 2)
            {
                w[i] = 1;
            }
            else if(x[i] == 2 && y[i] == 0)
            {
                w[i] = 0;
            }
            else if(x[i] == 2 && y[i] == 1)
            {
                w[i] = 1;
            }
            else if(x[i] == 2 && y[i] == 2)
            {
                w[i] = 2;
            }
        }
    }

// 0 1 2
// 1 1 2
// 2 2 2

    private static void TrinaryOr(byte[] w,
                                  byte[] x,
                                  byte[] y)
    {
        for(int j = 0; j < 24; ++j)
        {
            if(x[j] == 0 && y[j] == 0)
            {
                w[j] = 0;
            }
            else if(x[j] == 0 && y[j] == 1)
            {
                w[j] = 1;
            }
            else if(x[j] == 0 && y[j] == 2)
            {
                w[j] = 2;
            }
            else if(x[j] == 1 && y[j] == 0)
            {
                w[j] = 1;
            }
            else if(x[j] == 1 && y[j] == 1)
            {
                w[j] = 1;
            }
            else if(x[j] == 1 && y[j] == 2)
            {
                w[j] = 2;
            }
            else if(x[j] == 2 && y[j] == 0)
            {
                w[j] = 2;
            }
            else if(x[j] == 2 && y[j] == 1)
            {
                w[j] = 2;
            }
            else if(x[j] == 2 && y[j] == 2)
            {
                w[j] = 2;
            }
        }
    }

// 0 0 2
// 1 1 1
// 2 2 0

    private static void TrinaryXor(byte[] w,
                                   byte[] x,
                                   byte[] y)
    {
        for(int k = 0; k < 24; ++k)
        {
            if(x[k] == 0 && y[k] == 0)
            {
                w[k] = 0;
            }
            else if(x[k] == 0 && y[k] == 1)
            {
                w[k] = 0;
            }
            else if(x[k] == 0 && y[k] == 2)
            {
                w[k] = 2;
            }
            else if(x[k] == 1 && y[k] == 0)
            {
                w[k] = 1;
            }
            else if(x[k] == 1 && y[k] == 1)
            {
                w[k] = 1;
            }
            else if(x[k] == 1 && y[k] == 2)
            {
                w[k] = 1;
            }
            else if(x[k] == 2 && y[k] == 0)
            {
                w[k] = 2;
            }
            else if(x[k] == 2 && y[k] == 1)
            {
                w[k] = 2;
            }
            else if(x[k] == 2 && y[k] == 2)
            {
                w[k] = 0;
            }
        }
    }

// 2 0 0
// 1 1 1
// 0 2 2

    private static void TrinaryXand(byte[] w,
                                    byte[] x,
                                    byte[] y)
    {
        for(int i = 0; i < 24; ++i)
        {
            if(x[i] == 0 && y[i] == 0)
            {
                w[i] = 2;
            }
            else if(x[i] == 0 && y[i] == 1)
            {
                w[i] = 0;
            }
            else if(x[i] == 0 && y[i] == 2)
            {
                w[i] = 0;
            }
            else if(x[i] == 1 && y[i] == 0)
            {
                w[i] = 1;
            }
            else if(x[i] == 1 && y[i] == 1)
            {
                w[i] = 1;
            }
            else if(x[i] == 1 && y[i] == 2)
            {
                w[i] = 1;
            }
            else if(x[i] == 2 && y[i] == 0)
            {
                w[i] = 0;
            }
            else if(x[i] == 2 && y[i] == 1)
            {
                w[i] = 2;
            }
            else if(x[i] == 2 && y[i] == 2)
            {
                w[i] = 2;
            }
        }
    }

// 0 1 2
// 1 2 0
// 2 0 1

    private static void TrinaryAdd(byte[] w,
                                   byte[] x,
                                   byte[] y)
    {
        for(int j = 0; j < 24; ++j)
        {
            if(x[j] == 0 && y[j] == 0)
            {
                w[j] = 0;
            }
            else if(x[j] == 0 && y[j] == 1)
            {
                w[j] = 1;
            }
            else if(x[j] == 0 && y[j] == 2)
            {
                w[j] = 2;
            }
            else if(x[j] == 1 && y[j] == 0)
            {
                w[j] = 1;
            }
            else if(x[j] == 1 && y[j] == 1)
            {
                w[j] = 2;
            }
            else if(x[j] == 1 && y[j] == 2)
            {
                w[j] = 0;
            }
            else if(x[j] == 2 && y[j] == 0)
            {
                w[j] = 2;
            }
            else if(x[j] == 2 && y[j] == 1)
            {
                w[j] = 0;
            }
            else if(x[j] == 2 && y[j] == 2)
            {
                w[j] = 1;
            }
        }
    }

// 0 0 0
// 0 1 2
// 0 2 1

    private static void TrinaryMultiplication(byte[] w,
                                              byte[] x,
                                              byte[] y)
    {
        for(int k = 0; k < 24; ++k)
        {
            if(x[k] == 0 && y[k] == 0)
            {
                w[k] = 0;
            }
            else if(x[k] == 0 && y[k] == 1)
            {
                w[k] = 0;
            }
            else if(x[k] == 0 && y[k] == 2)
            {
                w[k] = 0;
            }
            else if(x[k] == 1 && y[k] == 0)
            {
                w[k] = 0;
            }
            else if(x[k] == 1 && y[k] == 1)
            {
                w[k] = 1;
            }
            else if(x[k] == 1 && y[k] == 2)
            {
                w[k] = 2;
            }
            else if(x[k] == 2 && y[k] == 0)
            {
                w[k] = 0;
            }
            else if(x[k] == 2 && y[k] == 1)
            {
                w[k] = 2;
            }
            else if(x[k] == 2 && y[k] == 2)
            {
                w[k] = 1;
            }
        }
    }

    private static void F(byte[] w,
                          byte[] x,
                          byte[] y,
                          byte[] z)
    {
        TrinaryAnd(w, x, y);

        TrinaryOr(w, w, z);
    }

    private static void G(byte[] w,
                          byte[] x,
                          byte[] y,
                          byte[] z)
    {
        TrinaryAdd(w, x, z);

        TrinaryMultiplication(w, w, y);
    }

    private static void H(byte[] w,
                          byte[] x,
                          byte[] y,
                          byte[] z)
    {
        TrinaryXor(w, x, y);

        TrinaryXand(w, w, z);
    }

    private static void I(byte[] w,
                          byte[] x,
                          byte[] y,
                          byte[] z)
    {
        TrinaryMultiplication(w, y, z);

        TrinaryAdd(w, w, x);
    }

    private static void Add(byte[] w,
                            byte[] z)
    {
        int iCarry = 0;

        for(int i = 0; i < 24; ++i)
        {
            w[i] += z[i] + iCarry;

            if(w[i] > 2)
            {
                w[i] -= 3;

                if(iCarry == 0)
                {
                    iCarry = 1;
                }
            }
            else
            {
                iCarry = 0;
            }
        }
    }

    private static void RotateShiftLeft(byte[] w,
                                        int iBit)
    {
        byte[] baSwap = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

        for(int j = 23; j > -1; --j)
        {
            baSwap[j] = w[j >= iBit ? j - iBit : 24 - iBit + j];
        }

        for(int k = 0; k < 24; ++k)
        {
            w[k] = baSwap[k];
        }
    }

    private static void FF(byte[] a,
                           byte[] b,
                           byte[] c,
                           byte[] d,
                           byte[] e,
                           int iShift,
                           byte[] k)
    {
        byte[] baTemp = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

        F(baTemp, b, c, d);

        Add(baTemp, a);

        Add(baTemp, e);

        Add(baTemp, k);

        RotateShiftLeft(baTemp, iShift);

        Add(baTemp, b);

        for(int i = 0; i < 24; ++i)
        {
            a[i] = baTemp[i];
        }
    }

    private static void GG(byte[] a,
                           byte[] b,
                           byte[] c,
                           byte[] d,
                           byte[] e,
                           int iShift,
                           byte[] k)
    {
        byte[] baTemp = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

        G(baTemp, c, d, a);

        Add(baTemp, b);

        Add(baTemp, e);

        Add(baTemp, k);

        RotateShiftLeft(baTemp, iShift);

        Add(baTemp, c);

        for(int j = 0; j < 24; ++j)
        {
            b[j] = baTemp[j];
        }
    }

    private static void HH(byte[] a,
                           byte[] b,
                           byte[] c,
                           byte[] d,
                           byte[] e,
                           int iShift,
                           byte[] k)
    {
        byte[] baTemp = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

        H(baTemp, d, a, b);

        Add(baTemp, c);

        Add(baTemp, e);

        Add(baTemp, k);

        RotateShiftLeft(baTemp, iShift);

        Add(baTemp, d);

        for(int i = 0; i < 24; ++i)
        {
            c[i] = baTemp[i];
        }
    }

    private static void II(byte[] a,
                           byte[] b,
                           byte[] c,
                           byte[] d,
                           byte[] e,
                           int iShift,
                           byte[] k)
    {
        byte[] baTemp = new byte[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

        I(baTemp, a, b, c);

        Add(baTemp, d);

        Add(baTemp, e);

        Add(baTemp, k);

        RotateShiftLeft(baTemp, iShift);

        Add(baTemp, a);

        for(int j = 0; j < 24; ++j)
        {
            d[j] = baTemp[j];
        }
    }

    private static void MD3HashCode(byte[] a,
                                    byte[] b,
                                    byte[] c,
                                    byte[] d,
                                    byte[][] e)
    {
        final int iShift11 = 2, iShift12 = 22, iShift13 = 3, iShift14 = 21, iShift21 = 5, iShift22 = 15, iShift23 = 7, iShift24 = 14, iShift31 = 11, iShift32 = 12, iShift33  = 13, iShift34 = 10, iShift41 = 17, iShift42 = 6, iShift43 = 19, iShift44 = 4;

        final byte[] k0 = {2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0},

                     k1 = {1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0},

                     k2 = {0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0},

                     k3 = {1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0},

                     k4 = {1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0},

                     k5 = {2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0},

                     k6 = {2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0},

                     k7 = {2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                     k8 = {1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0},

                     k9 = {2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0},

                    k10 = {1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                    k11 = {1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0},

                    k12 = {2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0},

                    k13 = {2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                    k14 = {1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0},

                    k15 = {0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0},

                    k16 = {0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0},

                    k17 = {1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0},

                    k18 = {0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0},

                    k19 = {1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},

                    k20 = {1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0},

                    k21 = {2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0},

                    k22 = {1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0},

                    k23 = {2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0},

                    k24 = {0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0},

                    k25 = {0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0},

                    k26 = {2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0},

                    k27 = {2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},

                    k28 = {1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0},

                    k29 = {2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0},

                    k30 = {1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0},

                    k31 = {1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0},

                    k32 = {1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                    k33 = {2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0},

                    k34 = {1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0},

                    k35 = {1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                    k36 = {2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0},

                    k37 = {1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0},

                    k38 = {1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0},

                    k39 = {0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0},

                    k40 = {0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0},

                    k41 = {0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0},

                    k42 = {2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0},

                    k43 = {0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0},

                    k44 = {1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0},

                    k45 = {0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0},

                    k46 = {1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0},

                    k47 = {0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0},

                    k48 = {0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0},

                    k49 = {2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0},

                    k50 = {2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0},

                    k51 = {1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0},

                    k52 = {2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0},

                    k53 = {1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0},

                    k54 = {2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                    k55 = {0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0},

                    k56 = {1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0},

                    k57 = {2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0},

                    k58 = {2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0},

                    k59 = {0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0},

                    k60 = {1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0},

                    k61 = {2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0},

                    k62 = {0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0},

                    k63 = {2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0};

        FF(a, b, c, d, e[ 0], iShift11, k0);

        FF(b, c, d, a, e[ 1], iShift12, k1);

        FF(c, d, a, b, e[ 2], iShift13, k2);

        FF(d, a, b, c, e[ 3], iShift14, k3);

        FF(a, b, c, d, e[ 4], iShift11, k4);

        FF(b, c, d, a, e[ 5], iShift12, k5);

        FF(c, d, a, b, e[ 6], iShift13, k6);

        FF(d, a, b, c, e[ 7], iShift14, k7);

        FF(a, b, c, d, e[ 8], iShift11, k8);

        FF(b, c, d, a, e[ 9], iShift12, k9);

        FF(c, d, a, b, e[10], iShift13, k10);

        FF(d, a, b, c, e[11], iShift14, k11);

        FF(a, b, c, d, e[12], iShift11, k12);

        FF(b, c, d, a, e[13], iShift12, k13);

        FF(c, d, a, b, e[14], iShift13, k14);

        FF(d, a, b, c, e[15], iShift14, k15);

        GG(a, b, c, d, e[ 1], iShift21, k16);

        GG(d, a, b, c, e[ 6], iShift22, k17);

        GG(c, d, a, b, e[11], iShift23, k18);

        GG(b, c, d, a, e[ 0], iShift24, k19);

        GG(a, b, c, d, e[ 5], iShift21, k20);

        GG(d, a, b, c, e[10], iShift22, k21);

        GG(c, d, a, b, e[15], iShift23, k22);

        GG(b, c, d, a, e[ 4], iShift24, k23);

        GG(a, b, c, d, e[ 9], iShift21, k24);

        GG(d, a, b, c, e[14], iShift22, k25);

        GG(c, d, a, b, e[ 3], iShift23, k26);

        GG(b, c, d, a, e[ 8], iShift24, k27);

        GG(a, b, c, d, e[13], iShift21, k28);

        GG(d, a, b, c, e[ 2], iShift22, k29);

        GG(c, d, a, b, e[ 7], iShift23, k30);

        GG(b, c, d, a, e[12], iShift24, k31);

        HH(a, b, c, d, e[ 5], iShift31, k32);

        HH(b, c, d, a, e[ 8], iShift32, k33);

        HH(c, d, a, b, e[11], iShift33, k34);

        HH(d, a, b, c, e[14], iShift34, k35);

        HH(a, b, c, d, e[ 1], iShift31, k36);

        HH(b, c, d, a, e[ 4], iShift32, k37);

        HH(c, d, a, b, e[ 7], iShift33, k38);

        HH(d, a, b, c, e[10], iShift34, k39);

        HH(a, b, c, d, e[13], iShift31, k40);

        HH(b, c, d, a, e[ 0], iShift32, k41);

        HH(c, d, a, b, e[ 3], iShift33, k42);

        HH(d, a, b, c, e[ 6], iShift34, k43);

        HH(a, b, c, d, e[ 9], iShift31, k44);

        HH(b, c, d, a, e[12], iShift32, k45);

        HH(c, d, a, b, e[15], iShift33, k46);

        HH(d, a, b, c, e[ 2], iShift34, k47);

        II(a, b, c, d, e[ 0], iShift41, k48);

        II(d, a, b, c, e[ 7], iShift42, k49);

        II(c, d, a, b, e[14], iShift43, k50);

        II(b, c, d, a, e[ 5], iShift44, k51);

        II(a, b, c, d, e[12], iShift41, k52);

        II(d, a, b, c, e[ 3], iShift42, k53);

        II(c, d, a, b, e[10], iShift43, k54);

        II(b, c, d, a, e[ 1], iShift44, k55);

        II(a, b, c, d, e[ 8], iShift41, k56);

        II(d, a, b, c, e[15], iShift42, k57);

        II(c, d, a, b, e[ 6], iShift43, k58);

        II(b, c, d, a, e[13], iShift44, k59);

        II(a, b, c, d, e[ 4], iShift41, k60);

        II(d, a, b, c, e[11], iShift42, k61);

        II(c, d, a, b, e[ 2], iShift43, k62);

        II(b, c, d, a, e[ 9], iShift44, k63);
    }

    public static void main(String[] args)
    {
        if(args.length != 1)
        {
            Usage();
        }
        else
        {
            File fdData = new File(args[0]);

            long lFileSize = fdData.length();

            if(lFileSize == 0)
            {
                System.out.printf("There is no data in file [%s], 0 byte.\n", args[0]);

                System.exit(-1);
            }

            long lBytesLeft = lFileSize & 63;

            if(lBytesLeft == 0)
            {
                lBytesLeft = lFileSize + 64;
            }
            else if(lBytesLeft < 54)
            {
                lBytesLeft = lFileSize - lBytesLeft + 64;
            }
            else if(lBytesLeft > 53)
            {
                lBytesLeft = lFileSize - lBytesLeft + 128;
            }

            byte[] baData = new byte[(int)lBytesLeft];

            try
            {
                FileInputStream fisData = new FileInputStream(fdData);

                fisData.read(baData, 0, (int)lFileSize);

                fisData.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }

            final byte[] baPadding = {(byte)2, (byte)3, (byte)5, (byte)7, (byte)11, (byte)13, (byte)17, (byte)19, (byte)23, (byte)29, (byte)31, (byte)37,
                (byte)41, (byte)43, (byte)47, (byte)53, (byte)59, (byte)61, (byte)67, (byte)71, (byte)73, (byte)79, (byte)83, (byte)89, (byte)97,
                (byte)101, (byte)103, (byte)107, (byte)109, (byte)113, (byte)127, (byte)131, (byte)137, (byte)139, (byte)149,
                (byte)151, (byte)157, (byte)163, (byte)167, (byte)173, (byte)179, (byte)181, (byte)191, (byte)193, (byte)197,
                (byte)199, (byte)211, (byte)223, (byte)227, (byte)229, (byte)233, (byte)239, (byte)241, (byte)251,
                (byte)15, (byte)25, (byte)35, (byte)45, (byte)55, (byte)65, (byte)75, (byte)85, (byte)95, (byte)105};

            for(int i = 0; i < 5; ++i)
            {
                baData[i + (int)lFileSize] = (byte)(lFileSize >>> 8 * i & 255);
            }

            for(int j = (int)(lFileSize + 5), k = 0; j < (int)(lBytesLeft - 5); ++j, ++k)
            {
                baData[j] = baPadding[k];
            }

            for(int l = 5; l > 0; --l)
            {
                baData[(int)(lBytesLeft - l)] = (byte)(lFileSize >>> 8 * (l - 1) & 255);
            }

            byte[] baDigest0 = {1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0},

                   baDigest1 = {2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1},

                   baDigest2 = {2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0},

                   baDigest3 = {1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0};

            for(int i = 0; i < (int)lBytesLeft; i += 64)
            {
                byte[][] baTrinary = new byte[16][24];

                for(int j = 0; j < 16; ++j)
                {
                    Ternary(((long)baData[i + 4 * j] & 255) + (((long)baData[i + 4 * j + 1] & 255) << 8) + (((long)baData[i + 4 * j + 2] & 255) << 16) + (((long)baData[i + 4 * j + 3] & 255) << 24), baTrinary[j]);
                }

                MD3HashCode(baDigest0, baDigest1, baDigest2, baDigest3, baTrinary);
            }

            for(int k = 0; k < 24; ++k)
            {
                System.out.printf("%d%d%d%d", baDigest0[k], baDigest1[k], baDigest2[k], baDigest3[k]);
            }

            System.out.println();
        }
    }
}