/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Programing/ComputerOrganization/P4_rlb/ALU.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static int ng8[] = {31, 0};
static int ng9[] = {1, 0};



static void Cont_16_0(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;

LAB0:    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = (t0 + 692U);
    t4 = *((char **)t2);
    memset(t5, 0, 8);
    t2 = (t3 + 4);
    t6 = (t4 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t4);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t2);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t2);
    t15 = *((unsigned int *)t6);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB7;

LAB4:    if (t16 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t5) = 1;

LAB7:    t20 = (t0 + 2784);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 40U);
    t24 = *((char **)t23);
    memset(t24, 0, 8);
    t25 = 1U;
    t26 = t25;
    t27 = (t5 + 4);
    t28 = *((unsigned int *)t5);
    t25 = (t25 & t28);
    t29 = *((unsigned int *)t27);
    t26 = (t26 & t29);
    t30 = (t24 + 4);
    t31 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t31 | t25);
    t32 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t32 | t26);
    xsi_driver_vfirst_trans(t20, 0, 0);
    t33 = (t0 + 2716);
    *((int *)t33) = 1;

LAB1:    return;
LAB6:    t19 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB7;

}

static void Cont_17_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char *t1;
    char *t2;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;

LAB0:    t1 = (t0 + 2232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 600U);
    t6 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t7, 0, 8);
    xsi_vlog_signed_greater(t7, 32, t6, 32, t2, 32);
    memset(t4, 0, 8);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t8) != 0)
        goto LAB6;

LAB7:    t15 = (t4 + 4);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t15);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB8;

LAB9:    t20 = *((unsigned int *)t4);
    t21 = (~(t20));
    t22 = *((unsigned int *)t15);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t15) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t24, 8);

LAB16:    t25 = (t0 + 2820);
    t26 = (t25 + 32U);
    t27 = *((char **)t26);
    t28 = (t27 + 40U);
    t29 = *((char **)t28);
    memset(t29, 0, 8);
    t30 = 1U;
    t31 = t30;
    t32 = (t3 + 4);
    t33 = *((unsigned int *)t3);
    t30 = (t30 & t33);
    t34 = *((unsigned int *)t32);
    t31 = (t31 & t34);
    t35 = (t29 + 4);
    t36 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t36 | t30);
    t37 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t37 | t31);
    xsi_driver_vfirst_trans(t25, 0, 0);
    t38 = (t0 + 2724);
    *((int *)t38) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t14 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB7;

LAB8:    t19 = ((char*)((ng2)));
    goto LAB9;

LAB10:    t24 = ((char*)((ng3)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t19, 1, t24, 1);
    goto LAB16;

LAB14:    memcpy(t3, t19, 8);
    goto LAB16;

}

static void Cont_18_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char *t1;
    char *t2;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;

LAB0:    t1 = (t0 + 2376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 600U);
    t6 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t7, 0, 8);
    xsi_vlog_signed_less(t7, 32, t6, 32, t2, 32);
    memset(t4, 0, 8);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t8) != 0)
        goto LAB6;

LAB7:    t15 = (t4 + 4);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t15);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB8;

LAB9:    t20 = *((unsigned int *)t4);
    t21 = (~(t20));
    t22 = *((unsigned int *)t15);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t15) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t24, 8);

LAB16:    t25 = (t0 + 2856);
    t26 = (t25 + 32U);
    t27 = *((char **)t26);
    t28 = (t27 + 40U);
    t29 = *((char **)t28);
    memset(t29, 0, 8);
    t30 = 1U;
    t31 = t30;
    t32 = (t3 + 4);
    t33 = *((unsigned int *)t3);
    t30 = (t30 & t33);
    t34 = *((unsigned int *)t32);
    t31 = (t31 & t34);
    t35 = (t29 + 4);
    t36 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t36 | t30);
    t37 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t37 | t31);
    xsi_driver_vfirst_trans(t25, 0, 0);
    t38 = (t0 + 2732);
    *((int *)t38) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t14 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB7;

LAB8:    t19 = ((char*)((ng2)));
    goto LAB9;

LAB10:    t24 = ((char*)((ng3)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t19, 1, t24, 1);
    goto LAB16;

LAB14:    memcpy(t3, t19, 8);
    goto LAB16;

}

static void Always_20_3(char *t0)
{
    char t10[8];
    char t37[8];
    char t43[8];
    char t50[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;

LAB0:    t1 = (t0 + 2520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 2740);
    *((int *)t2) = 1;
    t3 = (t0 + 2548);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(20, ng0);

LAB5:    xsi_set_current_line(21, ng0);
    t4 = (t0 + 784U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB21:    goto LAB2;

LAB7:    xsi_set_current_line(23, ng0);
    t7 = (t0 + 600U);
    t8 = *((char **)t7);
    t7 = (t0 + 692U);
    t9 = *((char **)t7);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t8, 32, t9, 32);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t10, 0, 0, 32);
    goto LAB21;

LAB9:    xsi_set_current_line(25, ng0);
    t3 = (t0 + 600U);
    t4 = *((char **)t3);
    t3 = (t0 + 692U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB21;

LAB11:    xsi_set_current_line(27, ng0);
    t3 = (t0 + 600U);
    t4 = *((char **)t3);
    t3 = (t0 + 692U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    *((unsigned int *)t10) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t10 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t8);
    t16 = (t14 | t15);
    *((unsigned int *)t9) = t16;
    t17 = *((unsigned int *)t9);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB22;

LAB23:
LAB24:    t21 = (t0 + 1380);
    xsi_vlogvar_assign_value(t21, t10, 0, 0, 32);
    goto LAB21;

LAB13:    xsi_set_current_line(29, ng0);
    t3 = (t0 + 600U);
    t4 = *((char **)t3);
    t3 = (t0 + 692U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t10 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t8);
    t16 = (t14 | t15);
    *((unsigned int *)t9) = t16;
    t17 = *((unsigned int *)t9);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB25;

LAB26:
LAB27:    t35 = (t0 + 1380);
    xsi_vlogvar_assign_value(t35, t10, 0, 0, 32);
    goto LAB21;

LAB15:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 692U);
    t4 = *((char **)t3);
    t3 = (t0 + 876U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 32, t4, 32, t7, 5);
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB21;

LAB17:    xsi_set_current_line(32, ng0);

LAB28:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 692U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t10, 0, 8);
    t7 = (t4 + 4);
    t8 = (t3 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t3);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t7);
    t15 = *((unsigned int *)t8);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t8);
    t20 = (t18 | t19);
    t23 = (~(t20));
    t24 = (t17 & t23);
    if (t24 != 0)
        goto LAB32;

LAB29:    if (t20 != 0)
        goto LAB31;

LAB30:    *((unsigned int *)t10) = 1;

LAB32:    t21 = (t10 + 4);
    t25 = *((unsigned int *)t21);
    t27 = (~(t25));
    t28 = *((unsigned int *)t10);
    t29 = (t28 & t27);
    t31 = (t29 != 0);
    if (t31 > 0)
        goto LAB33;

LAB34:    xsi_set_current_line(34, ng0);

LAB36:    xsi_set_current_line(35, ng0);
    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1472);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB37:    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t7 = ((char*)((ng1)));
    memset(t10, 0, 8);
    xsi_vlog_signed_greatereq(t10, 32, t4, 32, t7, 32);
    t8 = (t10 + 4);
    t11 = *((unsigned int *)t8);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB38;

LAB39:
LAB35:    goto LAB21;

LAB22:    t19 = *((unsigned int *)t10);
    t20 = *((unsigned int *)t9);
    *((unsigned int *)t10) = (t19 | t20);
    goto LAB24;

LAB25:    t19 = *((unsigned int *)t10);
    t20 = *((unsigned int *)t9);
    *((unsigned int *)t10) = (t19 | t20);
    t21 = (t4 + 4);
    t22 = (t7 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t26 = (t25 & t24);
    t27 = *((unsigned int *)t22);
    t28 = (~(t27));
    t29 = *((unsigned int *)t7);
    t30 = (t29 & t28);
    t31 = (~(t26));
    t32 = (~(t30));
    t33 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t33 & t31);
    t34 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t34 & t32);
    goto LAB27;

LAB31:    t9 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB32;

LAB33:    xsi_set_current_line(33, ng0);
    t22 = (t0 + 600U);
    t35 = *((char **)t22);
    t22 = (t0 + 1380);
    xsi_vlogvar_assign_value(t22, t35, 0, 0, 32);
    goto LAB35;

LAB38:    xsi_set_current_line(35, ng0);

LAB40:    xsi_set_current_line(36, ng0);
    t9 = (t0 + 1472);
    t21 = (t9 + 36U);
    t22 = *((char **)t21);
    t35 = (t0 + 692U);
    t36 = *((char **)t35);
    memset(t37, 0, 8);
    t35 = (t22 + 4);
    if (*((unsigned int *)t35) != 0)
        goto LAB42;

LAB41:    t38 = (t36 + 4);
    if (*((unsigned int *)t38) != 0)
        goto LAB42;

LAB45:    if (*((unsigned int *)t22) < *((unsigned int *)t36))
        goto LAB44;

LAB43:    *((unsigned int *)t37) = 1;

LAB44:    t40 = (t37 + 4);
    t16 = *((unsigned int *)t40);
    t17 = (~(t16));
    t18 = *((unsigned int *)t37);
    t19 = (t18 & t17);
    t20 = (t19 != 0);
    if (t20 > 0)
        goto LAB46;

LAB47:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = (t0 + 576U);
    t4 = (t2 + 44U);
    t7 = *((char **)t4);
    t8 = (t0 + 1472);
    t9 = (t8 + 36U);
    t21 = *((char **)t9);
    xsi_vlog_generic_get_index_select_value(t37, 1, t3, t7, 2, t21, 32, 1);
    memset(t10, 0, 8);
    t22 = (t37 + 4);
    t11 = *((unsigned int *)t22);
    t12 = (~(t11));
    t13 = *((unsigned int *)t37);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB54;

LAB52:    if (*((unsigned int *)t22) == 0)
        goto LAB51;

LAB53:    t35 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t35) = 1;

LAB54:    t36 = (t10 + 4);
    t38 = (t37 + 4);
    t16 = *((unsigned int *)t37);
    t17 = (~(t16));
    *((unsigned int *)t10) = t17;
    *((unsigned int *)t36) = 0;
    if (*((unsigned int *)t38) != 0)
        goto LAB56;

LAB55:    t24 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t24 & 1U);
    t25 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t25 & 1U);
    t39 = (t0 + 1380);
    t40 = (t0 + 1380);
    t41 = (t40 + 44U);
    t42 = *((char **)t41);
    t44 = (t0 + 1472);
    t45 = (t44 + 36U);
    t46 = *((char **)t45);
    xsi_vlog_generic_convert_bit_index(t43, t42, 2, t46, 32, 1);
    t47 = (t43 + 4);
    t27 = *((unsigned int *)t47);
    t6 = (!(t27));
    if (t6 == 1)
        goto LAB57;

LAB58:
LAB48:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t7 = ((char*)((ng9)));
    memset(t10, 0, 8);
    xsi_vlog_signed_minus(t10, 32, t4, 32, t7, 32);
    t8 = (t0 + 1472);
    xsi_vlogvar_assign_value(t8, t10, 0, 0, 32);
    goto LAB37;

LAB42:    t39 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB44;

LAB46:    xsi_set_current_line(36, ng0);
    t41 = (t0 + 600U);
    t42 = *((char **)t41);
    t41 = (t0 + 576U);
    t44 = (t41 + 44U);
    t45 = *((char **)t44);
    t46 = (t0 + 1472);
    t47 = (t46 + 36U);
    t48 = *((char **)t47);
    xsi_vlog_generic_get_index_select_value(t43, 1, t42, t45, 2, t48, 32, 1);
    t49 = (t0 + 1380);
    t51 = (t0 + 1380);
    t52 = (t51 + 44U);
    t53 = *((char **)t52);
    t54 = (t0 + 1472);
    t55 = (t54 + 36U);
    t56 = *((char **)t55);
    xsi_vlog_generic_convert_bit_index(t50, t53, 2, t56, 32, 1);
    t57 = (t50 + 4);
    t23 = *((unsigned int *)t57);
    t6 = (!(t23));
    if (t6 == 1)
        goto LAB49;

LAB50:    goto LAB48;

LAB49:    xsi_vlogvar_assign_value(t49, t43, 0, *((unsigned int *)t50), 1);
    goto LAB50;

LAB51:    *((unsigned int *)t10) = 1;
    goto LAB54;

LAB56:    t18 = *((unsigned int *)t10);
    t19 = *((unsigned int *)t38);
    *((unsigned int *)t10) = (t18 | t19);
    t20 = *((unsigned int *)t36);
    t23 = *((unsigned int *)t38);
    *((unsigned int *)t36) = (t20 | t23);
    goto LAB55;

LAB57:    xsi_vlogvar_assign_value(t39, t10, 0, *((unsigned int *)t43), 1);
    goto LAB58;

}


extern void work_m_00000000002766002648_0886308060_init()
{
	static char *pe[] = {(void *)Cont_16_0,(void *)Cont_17_1,(void *)Cont_18_2,(void *)Always_20_3};
	xsi_register_didat("work_m_00000000002766002648_0886308060", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000002766002648_0886308060.didat");
	xsi_register_executes(pe);
}
