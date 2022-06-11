/*********************************************************
* 作者：伍耀晖               Author: YaoHui.Wu           *
* 开源日期：2022年6月11日    Open Source Date: 2022-6-11 *
* 国家：中国                 Country: China              *
*********************************************************/

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>

#define    lShift11    2

#define    lShift12    3

#define    lShift13    4

#define    lShift14    5

#define    lShift21    6

#define    lShift22    7

#define    lShift23    8

#define    lShift24    11

#define    lShift31    10

#define    lShift32    13

#define    lShift33    14

#define    lShift34    17

#define    lShift41    16

#define    lShift42    19

#define    lShift43    22

#define    lShift44    23

void Usage()
{
    printf("Usage: MD3Hash YouWantToHash.File\n");
}

void Ternary(long long lNumeric,
             unsigned char *ucpTrinary)
{
    ucpTrinary[0] = ucpTrinary[1] = ucpTrinary[2] = ucpTrinary[3] = ucpTrinary[4] = ucpTrinary[5] = ucpTrinary[6] = ucpTrinary[7] = ucpTrinary[8] = ucpTrinary[9] = ucpTrinary[10] = ucpTrinary[11] = ucpTrinary[12] = ucpTrinary[13] = ucpTrinary[14] = ucpTrinary[15] = ucpTrinary[16] = ucpTrinary[17] = ucpTrinary[18] = ucpTrinary[19] = ucpTrinary[20] = ucpTrinary[21] = ucpTrinary[22] = ucpTrinary[23] = 0;

    if(lNumeric != 0)
    {
        for(long long i = 23; i > -1; --i)
        {
            ucpTrinary[i] = lNumeric % 3;

            lNumeric /= 3;
        }
    }
}

// 0 0 0
// 0 1 1
// 0 1 2

void TrinaryAnd(unsigned char *w,
                unsigned char *x,
                unsigned char *y)
{
    for(long long i = 0; i < 24; ++i)
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

void TrinaryOr(unsigned char *w,
               unsigned char *x,
               unsigned char *y)
{
    for(long long j = 0; j < 24; ++j)
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

void TrinaryXor(unsigned char *w,
                unsigned char *x,
                unsigned char *y)
{
    for(long long k = 0; k < 24; ++k)
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

void TrinaryXand(unsigned char *w,
                 unsigned char *x,
                 unsigned char *y)
{
    for(long long i = 0; i < 24; ++i)
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

void TrinaryAdd(unsigned char *w,
                unsigned char *x,
                unsigned char *y)
{
    for(long long j = 0; j < 24; ++j)
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

void TrinaryMultiplication(unsigned char *w,
                           unsigned char *x,
                           unsigned char *y)
{
    for(long long k = 0; k < 24; ++k)
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

void F(unsigned char *w,
       unsigned char *x,
       unsigned char *y,
       unsigned char *z)
{
    TrinaryAnd(w, x, y);

    TrinaryOr(w, w, z);
}

void G(unsigned char *w,
       unsigned char *x,
       unsigned char *y,
       unsigned char *z)
{
    TrinaryAdd(w, x, z);

    TrinaryMultiplication(w, w, y);
}

void H(unsigned char *w,
       unsigned char *x,
       unsigned char *y,
       unsigned char *z)
{
    TrinaryXor(w, x, y);

    TrinaryXand(w, w, z);
}

void I(unsigned char *w,
       unsigned char *x,
       unsigned char *y,
       unsigned char *z)
{
    TrinaryMultiplication(w, y, z);

    TrinaryAdd(w, w, x);
}

void Add(unsigned char *w,
         unsigned char *z)
{
    long long lCarry = 0;

    for(long long i = 0; i < 24; ++i)
    {
        w[i] += z[i] + lCarry;

        if(w[i] > 2)
        {
            w[i] -= 3;

            if(lCarry == 0)
            {
                lCarry = 1;
            }
        }
        else
        {
            lCarry = 0;
        }
    }
}

void RotateShiftLeft(unsigned char *w,
                     long long lBit)
{
    unsigned char ucaSwap[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    for(long long j = 23; j > -1; --j)
    {
        ucaSwap[j] = w[j >= lBit ? j - lBit : 24 - lBit + j];
    }

    for(long long k = 0; k < 24; ++k)
    {
        w[k] = ucaSwap[k];
    }
}

void FF(unsigned char *a,
        unsigned char *b,
        unsigned char *c,
        unsigned char *d,
        unsigned char *e,
        long long lShift,
        const unsigned char *k)
{
    unsigned char ucaTemp[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    F(ucaTemp, b, c, d);

    Add(ucaTemp, a);

    Add(ucaTemp, e);

    Add(ucaTemp, (unsigned char*)k);

    RotateShiftLeft(ucaTemp, lShift);

    Add(ucaTemp, b);

    for(long long i = 0; i < 24; ++i)
    {
        a[i] = ucaTemp[i];
    }
}

void GG(unsigned char *a,
        unsigned char *b,
        unsigned char *c,
        unsigned char *d,
        unsigned char *e,
        long long lShift,
        const unsigned char *k)
{
    unsigned char ucaTemp[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    G(ucaTemp, c, d, a);

    Add(ucaTemp, b);

    Add(ucaTemp, e);

    Add(ucaTemp, (unsigned char*)k);

    RotateShiftLeft(ucaTemp, lShift);

    Add(ucaTemp, c);

    for(long long j = 0; j < 24; ++j)
    {
        b[j] = ucaTemp[j];
    }
}

void HH(unsigned char *a,
        unsigned char *b,
        unsigned char *c,
        unsigned char *d,
        unsigned char *e,
        long long lShift,
        const unsigned char *k)
{
    unsigned char ucaTemp[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    H(ucaTemp, d, a, b);

    Add(ucaTemp, c);

    Add(ucaTemp, e);

    Add(ucaTemp, (unsigned char*)k);

    RotateShiftLeft(ucaTemp, lShift);

    Add(ucaTemp, d);

    for(long long i = 0; i < 24; ++i)
    {
        c[i] = ucaTemp[i];
    }
}

void II(unsigned char *a,
        unsigned char *b,
        unsigned char *c,
        unsigned char *d,
        unsigned char *e,
        long long lShift,
        const unsigned char *k)
{
    unsigned char ucaTemp[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    I(ucaTemp, a, b, c);

    Add(ucaTemp, d);

    Add(ucaTemp, e);

    Add(ucaTemp, (unsigned char*)k);

    RotateShiftLeft(ucaTemp, lShift);

    Add(ucaTemp, a);

    for(long long j = 0; j < 24; ++j)
    {
        d[j] = ucaTemp[j];
    }
}

void MD3Hash(unsigned char *a,
             unsigned char *b,
             unsigned char *c,
             unsigned char *d,
             unsigned char e[][24])
{
    const unsigned char k0[] = {2, 1, 1, 1, 2, 2, 0, 1, 2, 2, 1, 1, 2, 1, 2, 2, 2, 0, 0, 0, 1, 0, 0, 0},

                        k1[] = {1, 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 2, 1, 1, 0, 2, 0, 0, 1, 0, 1, 0, 0, 0},

                        k2[] = {0, 0, 2, 2, 1, 2, 0, 0, 1, 1, 1, 1, 0, 2, 0, 0, 2, 1, 1, 0, 0, 0, 0, 0},

                        k3[] = {1, 1, 1, 0, 1, 0, 0, 2, 1, 1, 2, 0, 2, 1, 1, 1, 0, 1, 2, 2, 0, 0, 0, 0},

                        k4[] = {1, 2, 1, 1, 2, 0, 1, 2, 2, 2, 0, 2, 0, 0, 0, 2, 2, 1, 1, 0, 1, 0, 0, 0},

                        k5[] = {2, 1, 0, 2, 1, 2, 1, 0, 1, 1, 1, 0, 2, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0},

                        k6[] = {2, 0, 0, 1, 0, 0, 1, 0, 0, 1, 2, 1, 2, 2, 1, 1, 2, 0, 1, 2, 0, 0, 0, 0},

                        k7[] = {2, 2, 1, 0, 0, 2, 1, 1, 2, 1, 0, 2, 0, 1, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                        k8[] = {1, 2, 0, 0, 1, 0, 0, 1, 0, 2, 2, 1, 0, 0, 1, 0, 2, 1, 1, 1, 0, 0, 0, 0},

                        k9[] = {2, 1, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, 1, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0},

                        k10[] = {1, 2, 2, 0, 1, 2, 0, 1, 2, 2, 2, 1, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                        k11[] = {1, 1, 0, 2, 2, 0, 1, 2, 2, 2, 0, 1, 1, 2, 1, 1, 2, 2, 2, 1, 0, 0, 0, 0},

                        k12[] = {2, 0, 1, 2, 1, 2, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0},

                        k13[] = {2, 2, 2, 0, 2 ,2, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                        k14[] = {1, 0, 1, 1, 0, 2, 2, 2, 0, 0, 1, 1, 2, 2, 1, 2, 1, 0, 1, 2, 0, 0, 0, 0},

                        k15[] = {0, 1, 2, 0, 2, 1, 1, 1, 1, 2, 0, 2, 1, 1, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0},

                        k16[] = {0, 0, 1, 0, 1, 1, 1, 2, 1, 2 ,0, 2, 2, 0, 2, 2, 2, 1, 1, 0, 1, 0, 0, 0},

                        k17[] = {1, 2, 0, 2, 0, 0, 2, 2, 1, 1, 2, 0, 0, 1, 2, 2, 2, 0, 2, 2, 0, 0, 0, 0},

                        k18[] = {0, 1, 2, 0, 0, 2, 0, 2, 0, 1, 2, 0, 2, 1, 2, 2, 2, 1, 1, 0, 0, 0, 0, 0},

                        k19[] = {1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},

                        k20[] = {1, 2, 1, 0, 2, 2, 1, 0, 0, 2, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 1, 0, 0, 0},

                        k21[] = {2, 0, 0, 1, 2, 0, 2, 0, 1, 2, 1, 1, 2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0},

                        k22[] = {1, 2, 0, 0, 2, 1, 1, 1, 0, 1, 2, 2, 1, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0},

                        k23[] = {2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 2, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0},

                        k24[] = {0, 1, 2, 0, 2, 2, 1, 0, 0, 2, 2, 1, 1, 2, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0},

                        k25[] = {0, 1, 2, 1, 1, 2, 2, 1, 1, 0, 1, 2, 0, 2, 0, 0, 1, 1, 2, 2, 0, 0, 0, 0},

                        k26[] = {2, 1, 2, 0, 1, 1, 2, 1, 2, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 1, 0, 0, 0},

                        k27[] = {2, 2, 0, 1, 1, 0, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0},

                        k28[] = {1, 1, 2, 2, 0, 0, 2, 1, 1, 2, 2, 0, 2, 2, 1, 0, 0, 1, 1, 2, 0, 0, 0, 0},

                        k29[] = {2, 2, 2, 2, 0, 2, 0, 0, 1, 0, 0, 0, 2, 0, 2, 1, 2, 2, 1, 0, 1, 0, 0, 0},

                        k30[] = {1, 2, 2, 0, 1, 0, 1, 1, 2, 2, 2, 0, 1, 2, 2, 0, 1, 1, 1, 1, 0, 0, 0, 0},

                        k31[] = {1, 1, 2, 2, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0},

                        k32[] = {1, 1, 0, 0, 2, 0, 1, 0, 2, 0, 0, 0, 2, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                        k33[] = {2, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 2, 0, 0, 1, 2, 1, 2, 2, 1, 0, 0, 0, 0},

                        k34[] = {1, 0, 0, 0, 0, 2, 2, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 2, 1, 1, 0, 0, 0, 0},

                        k35[] = {1, 1, 1, 0, 2, 2, 0, 0, 0, 2, 2, 0, 2, 1, 2, 2, 2, 2, 1, 0, 1, 0, 0, 0},

                        k36[] = {2, 1, 0, 0, 2, 0, 1, 1, 1, 0, 2, 2, 1, 2, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0},

                        k37[] = {1, 2, 0, 2, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 0, 0, 0},

                        k38[] = {1, 2, 0, 2, 1, 2, 1, 1, 2, 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0, 1, 0, 0, 0},

                        k39[] = {0, 2, 1, 1, 0, 1, 2, 1, 2, 0, 1, 2, 0, 0, 0, 1, 2, 0, 2, 2, 0, 0, 0, 0},

                        k40[] = {0, 0, 0, 0, 0, 1, 0, 2, 1, 1, 2, 2, 0, 1, 1, 2, 0, 2, 1, 0, 0, 0, 0, 0},

                        k41[] = {0, 1, 1, 0, 2, 2, 0, 0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0},

                        k42[] = {2, 1, 1, 0, 0, 2, 0, 0, 0, 2, 1, 0, 2, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 0},

                        k43[] = {0, 2, 2, 2, 0, 1, 0, 0, 2, 1, 0, 0, 2, 2, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0},

                        k44[] = {1, 2, 1, 0, 2, 1, 1, 0, 0, 0, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0},

                        k45[] = {0, 1, 0, 2, 2, 2, 0, 1, 1, 0, 0, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0},

                        k46[] = {1, 0, 1, 2, 1, 2, 1, 1, 1, 0, 0, 2, 2, 2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0},

                        k47[] = {0, 0, 1, 0, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 0, 0, 0, 0},

                        k48[] = {0, 2, 2, 2, 1, 0, 0, 1, 1, 2, 2, 2, 0, 1, 1, 0, 2, 1, 1, 0, 1, 0, 0, 0},

                        k49[] = {2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 0, 0, 0, 0, 0},

                        k50[] = {2, 0, 2, 1, 1, 2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 0, 1, 1, 2, 0, 0, 0, 0},

                        k51[] = {1, 2, 1, 0, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 0, 1, 2, 2, 1, 0, 1, 0, 0, 0},

                        k52[] = {2, 0, 0, 0, 0, 2, 1, 2, 1, 2, 0, 2, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0},

                        k53[] = {1, 0, 2, 0, 2, 1, 2, 2, 1, 2, 2, 2, 0, 2, 0, 2, 1, 0, 0, 2, 0, 0, 0, 0},

                        k54[] = {2, 1, 1, 2, 0, 0, 2, 1, 1, 2, 0, 2, 0, 2, 0, 2, 0, 0, 2, 0, 1, 0, 0, 0},

                        k55[] = {0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 2, 2, 1, 0, 0, 0, 0},

                        k56[] = {1, 2, 0, 1, 1, 2, 1, 1, 0, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0},

                        k57[] = {2, 1, 1, 2, 0, 0, 1, 0, 2, 0, 1, 0, 2, 1, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0},

                        k58[] = {2, 2, 1, 0, 0, 2, 2, 2, 1, 1, 2, 2, 0, 2, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0},

                        k59[] = {0, 1, 0, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0},

                        k60[] = {1, 1, 1, 1, 0, 1, 1, 2, 1, 0, 2, 2, 1, 1, 0, 1, 0, 2, 1, 0, 1, 0, 0, 0},

                        k61[] = {2, 1, 1, 2, 0, 2, 0, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 2, 2, 0, 0, 0, 0},

                        k62[] = {0, 0, 1, 2, 0, 2, 1, 1, 0, 2, 1, 1, 2, 0, 0, 2, 1, 2, 1, 0, 0, 0, 0, 0},

                        k63[] = {2, 0, 2, 0, 2, 2, 1, 0, 0, 2, 0, 1, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0};

    FF(a, b, c, d, e[ 0], lShift11, k0);

    FF(b, c, d, a, e[ 1], lShift12, k1);

    FF(c, d, a, b, e[ 2], lShift13, k2);

    FF(d, a, b, c, e[ 3], lShift14, k3);

    FF(a, b, c, d, e[ 4], lShift11, k4);

    FF(b, c, d, a, e[ 5], lShift12, k5);

    FF(c, d, a, b, e[ 6], lShift13, k6);

    FF(d, a, b, c, e[ 7], lShift14, k7);

    FF(a, b, c, d, e[ 8], lShift11, k8);

    FF(b, c, d, a, e[ 9], lShift12, k9);

    FF(c, d, a, b, e[10], lShift13, k10);

    FF(d, a, b, c, e[11], lShift14, k11);

    FF(a, b, c, d, e[12], lShift11, k12);

    FF(b, c, d, a, e[13], lShift12, k13);

    FF(c, d, a, b, e[14], lShift13, k14);

    FF(d, a, b, c, e[15], lShift14, k15);

    GG(a, b, c, d, e[ 1], lShift21, k16);

    GG(d, a, b, c, e[ 6], lShift22, k17);

    GG(c, d, a, b, e[11], lShift23, k18);

    GG(b, c, d, a, e[ 0], lShift24, k19);

    GG(a, b, c, d, e[ 5], lShift21, k20);

    GG(d, a, b, c, e[10], lShift22, k21);

    GG(c, d, a, b, e[15], lShift23, k22);

    GG(b, c, d, a, e[ 4], lShift24, k23);

    GG(a, b, c, d, e[ 9], lShift21, k24);

    GG(d, a, b, c, e[14], lShift22, k25);

    GG(c, d, a, b, e[ 3], lShift23, k26);

    GG(b, c, d, a, e[ 8], lShift24, k27);

    GG(a, b, c, d, e[13], lShift21, k28);

    GG(d, a, b, c, e[ 2], lShift22, k29);

    GG(c, d, a, b, e[ 7], lShift23, k30);

    GG(b, c, d, a, e[12], lShift24, k31);

    HH(a, b, c, d, e[ 5], lShift31, k32);

    HH(b, c, d, a, e[ 8], lShift32, k33);

    HH(c, d, a, b, e[11], lShift33, k34);

    HH(d, a, b, c, e[14], lShift34, k35);

    HH(a, b, c, d, e[ 1], lShift31, k36);

    HH(b, c, d, a, e[ 4], lShift32, k37);

    HH(c, d, a, b, e[ 7], lShift33, k38);

    HH(d, a, b, c, e[10], lShift34, k39);

    HH(a, b, c, d, e[13], lShift31, k40);

    HH(b, c, d, a, e[ 0], lShift32, k41);

    HH(c, d, a, b, e[ 3], lShift33, k42);

    HH(d, a, b, c, e[ 6], lShift34, k43);

    HH(a, b, c, d, e[ 9], lShift31, k44);

    HH(b, c, d, a, e[12], lShift32, k45);

    HH(c, d, a, b, e[15], lShift33, k46);

    HH(d, a, b, c, e[ 2], lShift34, k47);

    II(a, b, c, d, e[ 0], lShift41, k48);

    II(d, a, b, c, e[ 7], lShift42, k49);

    II(c, d, a, b, e[14], lShift43, k50);

    II(b, c, d, a, e[ 5], lShift44, k51);

    II(a, b, c, d, e[12], lShift41, k52);

    II(d, a, b, c, e[ 3], lShift42, k53);

    II(c, d, a, b, e[10], lShift43, k54);

    II(b, c, d, a, e[ 1], lShift44, k55);

    II(a, b, c, d, e[ 8], lShift41, k56);

    II(d, a, b, c, e[15], lShift42, k57);

    II(c, d, a, b, e[ 6], lShift43, k58);

    II(b, c, d, a, e[13], lShift44, k59);

    II(a, b, c, d, e[ 4], lShift41, k60);

    II(d, a, b, c, e[11], lShift42, k61);

    II(c, d, a, b, e[ 2], lShift43, k62);

    II(b, c, d, a, e[ 9], lShift44, k63);
}

long long main(long long argc,
               char *argv[])
{
    if(argc != 2)
    {
        Usage();
    }
    else
    {
        struct stat tStatFileSize;

        stat(argv[1], &tStatFileSize);

        long long lFileSize = tStatFileSize.st_size;

        if(lFileSize == 0)
        {
            printf("There is no data in file [%s], 0 byte.\n", argv[1]);

            return -1;
        }

        long long lBytesLeft = lFileSize & 63;

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

        unsigned char *ucpData = malloc(lBytesLeft);

        int fdData = open(argv[1], O_BINARY | O_RDONLY, S_IREAD | S_IWRITE);

        read(fdData, ucpData, lFileSize);

        close(fdData);

        const unsigned char ucaPadding[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47,
            53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149,
            151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251,
            15, 25, 35, 45, 55, 65, 75, 85, 95, 105};

        for(long long i = 0; i < 5; ++i)
        {
            ucpData[i + lFileSize] = ((unsigned char*)&lFileSize)[i];
        }

        for(long long j = lFileSize + 5, k = 0; j < lBytesLeft - 5; ++j, ++k)
        {
            ucpData[j] = ucaPadding[k];
        }

        for(long long l = 5; l > 0; --l)
        {
            ucpData[lBytesLeft - l] = ((unsigned char*)&lFileSize)[l - 1];
        }

        unsigned char ucaDigest0[] = {1, 2, 1, 0, 0, 0, 2, 1, 2, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0},

                      ucaDigest1[] = {2, 2, 1, 2, 1, 0, 0, 2, 2, 0, 2, 0, 1, 1, 0, 2, 2, 0, 2, 0, 1, 0, 0, 1},

                      ucaDigest2[] = {2, 1, 2, 2, 2, 0, 1, 2, 1, 1, 2, 0, 0, 0, 1, 0, 2, 0, 2, 0, 0, 2, 1, 0},

                      ucaDigest3[] = {1, 1, 2, 0, 1, 0, 0, 2, 1, 2, 0, 0, 2, 2, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0};

        for(long long i = 0; i < lBytesLeft; i += 64)
        {
            unsigned int *uipData = (unsigned int*)(ucpData + i);

            unsigned char ucaTrinary[16][24];

            for(long long j = 0; j < 16; ++j)
            {
                Ternary(uipData[j], ucaTrinary[j]);
            }

            MD3Hash(ucaDigest0, ucaDigest1, ucaDigest2, ucaDigest3, ucaTrinary);
        }

        for(long long k = 0; k < 24; ++k)
        {
            printf("%hhu%hhu%hhu%hhu", ucaDigest0[k], ucaDigest1[k], ucaDigest2[k], ucaDigest3[k]);
        }

        putchar(10);

        free(ucpData);
    }
}