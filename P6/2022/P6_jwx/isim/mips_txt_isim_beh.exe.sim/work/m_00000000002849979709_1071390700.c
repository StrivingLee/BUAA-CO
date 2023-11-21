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
static const char *ng0 = "D:/Programing/ComputerOrganization/P6/P6_jwx/E_MandD.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static int ng7[] = {0, 0, 0, 0};
static unsigned int ng8[] = {0U, 0U};
static int ng9[] = {3, 0};
static int ng10[] = {5, 0};
static int ng11[] = {2, 0};
static int ng12[] = {4, 0};
static int ng13[] = {10, 0};
static int ng14[] = {7, 0};
static int ng15[] = {8, 0};



static void Cont_20_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 2548U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 1564);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 3244);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 3176);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_21_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 2692U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 1656);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 3280);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 3184);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Always_23_2(char *t0)
{
    char t8[8];
    char t33[16];
    char t36[16];
    char t38[16];
    char t40[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
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
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    int t32;
    char *t34;
    char *t35;
    char *t37;

LAB0:    t1 = (t0 + 2836U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 3192);
    *((int *)t2) = 1;
    t3 = (t0 + 2864);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(23, ng0);

LAB5:    xsi_set_current_line(24, ng0);
    t4 = (t0 + 1748);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB9;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t8) = 1;

LAB9:    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB10;

LAB11:
LAB12:    goto LAB2;

LAB8:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(24, ng0);

LAB13:    xsi_set_current_line(25, ng0);
    t30 = (t0 + 968U);
    t31 = *((char **)t30);

LAB14:    t30 = ((char*)((ng2)));
    t32 = xsi_vlog_unsigned_case_compare(t31, 4, t30, 4);
    if (t32 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng4)));
    t32 = xsi_vlog_unsigned_case_compare(t31, 4, t2, 4);
    if (t32 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t32 = xsi_vlog_unsigned_case_compare(t31, 4, t2, 4);
    if (t32 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng6)));
    t32 = xsi_vlog_unsigned_case_compare(t31, 4, t2, 4);
    if (t32 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB12;

LAB15:    xsi_set_current_line(26, ng0);

LAB24:    xsi_set_current_line(27, ng0);
    t34 = (t0 + 784U);
    t35 = *((char **)t34);
    xsi_vlogtype_sign_extend(t33, 64, t35, 32);
    t34 = (t0 + 876U);
    t37 = *((char **)t34);
    xsi_vlogtype_sign_extend(t36, 64, t37, 32);
    xsi_vlog_signed_multiply(t38, 64, t33, 64, t36, 64);
    t34 = (t0 + 1840);
    xsi_vlogvar_assign_value(t34, t38, 0, 0, 64);
    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1840);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 8);
    t7 = (t4 + 12);
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 0);
    *((unsigned int *)t5) = t14;
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 4294967295U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 4294967295U);
    t9 = (t0 + 1932);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1840);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 0);
    *((unsigned int *)t5) = t14;
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 4294967295U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 4294967295U);
    t7 = (t0 + 2024);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 32);
    xsi_set_current_line(30, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1472);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB23;

LAB17:    xsi_set_current_line(32, ng0);

LAB25:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 784U);
    t4 = *((char **)t3);
    t3 = (t0 + 876U);
    t5 = *((char **)t3);
    memset(t40, 0, 8);
    xsi_vlog_signed_mod(t40, 32, t4, 32, t5, 32);
    t3 = (t0 + 1932);
    xsi_vlogvar_assign_value(t3, t40, 0, 0, 32);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 876U);
    t4 = *((char **)t2);
    memset(t40, 0, 8);
    xsi_vlog_signed_divide(t40, 32, t3, 32, t4, 32);
    t2 = (t0 + 2024);
    xsi_vlogvar_assign_value(t2, t40, 0, 0, 32);
    xsi_set_current_line(35, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1472);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB23;

LAB19:    xsi_set_current_line(37, ng0);

LAB26:    xsi_set_current_line(38, ng0);
    t3 = (t0 + 784U);
    t4 = *((char **)t3);
    t3 = (t0 + 876U);
    t5 = *((char **)t3);
    xsi_vlog_unsigned_multiply(t33, 64, t4, 32, t5, 32);
    t3 = (t0 + 1840);
    xsi_vlogvar_assign_value(t3, t33, 0, 0, 64);
    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1840);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 8);
    t7 = (t4 + 12);
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t7);
    t14 = (t13 >> 0);
    *((unsigned int *)t5) = t14;
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 4294967295U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 4294967295U);
    t9 = (t0 + 1932);
    xsi_vlogvar_assign_value(t9, t8, 0, 0, 32);
    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1840);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t8, 0, 8);
    t5 = (t8 + 4);
    t6 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t6);
    t14 = (t13 >> 0);
    *((unsigned int *)t5) = t14;
    t15 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t15 & 4294967295U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 4294967295U);
    t7 = (t0 + 2024);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 32);
    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1472);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB23;

LAB21:    xsi_set_current_line(43, ng0);

LAB27:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 784U);
    t4 = *((char **)t3);
    t3 = (t0 + 876U);
    t5 = *((char **)t3);
    memset(t8, 0, 8);
    xsi_vlog_unsigned_mod(t8, 32, t4, 32, t5, 32);
    t3 = (t0 + 1932);
    xsi_vlogvar_assign_value(t3, t8, 0, 0, 32);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 876U);
    t4 = *((char **)t2);
    memset(t8, 0, 8);
    xsi_vlog_unsigned_divide(t8, 32, t3, 32, t4, 32);
    t2 = (t0 + 2024);
    xsi_vlogvar_assign_value(t2, t8, 0, 0, 32);
    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1472);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB23;

}

static void Always_52_3(char *t0)
{
    char t14[8];
    char t25[8];
    char t40[8];
    char t56[8];
    char t64[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;

LAB0:    t1 = (t0 + 2980U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 3200);
    *((int *)t2) = 1;
    t3 = (t0 + 3008);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(52, ng0);

LAB5:    xsi_set_current_line(53, ng0);
    t4 = (t0 + 692U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(61, ng0);

LAB10:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1748);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);

LAB11:    t5 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 4, t5, 4);
    if (t13 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t13 == 1)
        goto LAB14;

LAB15:
LAB17:
LAB16:    xsi_set_current_line(82, ng0);

LAB89:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1748);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng3)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_minus(t14, 32, t5, 4, t11, 32);
    t12 = (t0 + 1748);
    xsi_vlogvar_assign_value(t12, t14, 0, 0, 4);

LAB18:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(53, ng0);

LAB9:    xsi_set_current_line(54, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1656);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1748);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1840);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 64, 0LL);
    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1932);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2024);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB8;

LAB12:    xsi_set_current_line(63, ng0);

LAB19:    xsi_set_current_line(64, ng0);
    t11 = (t0 + 968U);
    t12 = *((char **)t11);
    t11 = ((char*)((ng3)));
    memset(t14, 0, 8);
    t15 = (t12 + 4);
    t16 = (t11 + 4);
    t6 = *((unsigned int *)t12);
    t7 = *((unsigned int *)t11);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t15);
    t10 = *((unsigned int *)t16);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t15);
    t20 = *((unsigned int *)t16);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB23;

LAB20:    if (t21 != 0)
        goto LAB22;

LAB21:    *((unsigned int *)t14) = 1;

LAB23:    memset(t25, 0, 8);
    t26 = (t14 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (~(t27));
    t29 = *((unsigned int *)t14);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t26) != 0)
        goto LAB26;

LAB27:    t33 = (t25 + 4);
    t34 = *((unsigned int *)t25);
    t35 = (!(t34));
    t36 = *((unsigned int *)t33);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB28;

LAB29:    memcpy(t64, t25, 8);

LAB30:    t92 = (t64 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t64);
    t96 = (t95 & t94);
    t97 = (t96 != 0);
    if (t97 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng11)));
    memset(t14, 0, 8);
    t5 = (t3 + 4);
    t11 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t11);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t5);
    t20 = *((unsigned int *)t11);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB49;

LAB46:    if (t21 != 0)
        goto LAB48;

LAB47:    *((unsigned int *)t14) = 1;

LAB49:    memset(t25, 0, 8);
    t15 = (t14 + 4);
    t27 = *((unsigned int *)t15);
    t28 = (~(t27));
    t29 = *((unsigned int *)t14);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t15) != 0)
        goto LAB52;

LAB53:    t24 = (t25 + 4);
    t34 = *((unsigned int *)t25);
    t35 = (!(t34));
    t36 = *((unsigned int *)t24);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB54;

LAB55:    memcpy(t64, t25, 8);

LAB56:    t70 = (t64 + 4);
    t93 = *((unsigned int *)t70);
    t94 = (~(t93));
    t95 = *((unsigned int *)t64);
    t96 = (t95 & t94);
    t97 = (t96 != 0);
    if (t97 > 0)
        goto LAB68;

LAB69:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng14)));
    memset(t14, 0, 8);
    t5 = (t3 + 4);
    t11 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t11);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t5);
    t20 = *((unsigned int *)t11);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB75;

LAB72:    if (t21 != 0)
        goto LAB74;

LAB73:    *((unsigned int *)t14) = 1;

LAB75:    t15 = (t14 + 4);
    t27 = *((unsigned int *)t15);
    t28 = (~(t27));
    t29 = *((unsigned int *)t14);
    t30 = (t29 & t28);
    t31 = (t30 != 0);
    if (t31 > 0)
        goto LAB76;

LAB77:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng15)));
    memset(t14, 0, 8);
    t5 = (t3 + 4);
    t11 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t11);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t5);
    t20 = *((unsigned int *)t11);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB83;

LAB80:    if (t21 != 0)
        goto LAB82;

LAB81:    *((unsigned int *)t14) = 1;

LAB83:    t15 = (t14 + 4);
    t27 = *((unsigned int *)t15);
    t28 = (~(t27));
    t29 = *((unsigned int *)t14);
    t30 = (t29 & t28);
    t31 = (t30 != 0);
    if (t31 > 0)
        goto LAB84;

LAB85:
LAB86:
LAB78:
LAB70:
LAB44:    goto LAB18;

LAB14:    xsi_set_current_line(76, ng0);

LAB88:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 1748);
    t5 = (t3 + 36U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng3)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_minus(t14, 32, t11, 4, t12, 32);
    t15 = (t0 + 1748);
    xsi_vlogvar_assign_value(t15, t14, 0, 0, 4);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1932);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t11 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 32, 0LL);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2024);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t11 = (t0 + 1656);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 32, 0LL);
    goto LAB18;

LAB22:    t24 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB23;

LAB24:    *((unsigned int *)t25) = 1;
    goto LAB27;

LAB26:    t32 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB27;

LAB28:    t38 = (t0 + 968U);
    t39 = *((char **)t38);
    t38 = ((char*)((ng9)));
    memset(t40, 0, 8);
    t41 = (t39 + 4);
    t42 = (t38 + 4);
    t43 = *((unsigned int *)t39);
    t44 = *((unsigned int *)t38);
    t45 = (t43 ^ t44);
    t46 = *((unsigned int *)t41);
    t47 = *((unsigned int *)t42);
    t48 = (t46 ^ t47);
    t49 = (t45 | t48);
    t50 = *((unsigned int *)t41);
    t51 = *((unsigned int *)t42);
    t52 = (t50 | t51);
    t53 = (~(t52));
    t54 = (t49 & t53);
    if (t54 != 0)
        goto LAB34;

LAB31:    if (t52 != 0)
        goto LAB33;

LAB32:    *((unsigned int *)t40) = 1;

LAB34:    memset(t56, 0, 8);
    t57 = (t40 + 4);
    t58 = *((unsigned int *)t57);
    t59 = (~(t58));
    t60 = *((unsigned int *)t40);
    t61 = (t60 & t59);
    t62 = (t61 & 1U);
    if (t62 != 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t57) != 0)
        goto LAB37;

LAB38:    t65 = *((unsigned int *)t25);
    t66 = *((unsigned int *)t56);
    t67 = (t65 | t66);
    *((unsigned int *)t64) = t67;
    t68 = (t25 + 4);
    t69 = (t56 + 4);
    t70 = (t64 + 4);
    t71 = *((unsigned int *)t68);
    t72 = *((unsigned int *)t69);
    t73 = (t71 | t72);
    *((unsigned int *)t70) = t73;
    t74 = *((unsigned int *)t70);
    t75 = (t74 != 0);
    if (t75 == 1)
        goto LAB39;

LAB40:
LAB41:    goto LAB30;

LAB33:    t55 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB34;

LAB35:    *((unsigned int *)t56) = 1;
    goto LAB38;

LAB37:    t63 = (t56 + 4);
    *((unsigned int *)t56) = 1;
    *((unsigned int *)t63) = 1;
    goto LAB38;

LAB39:    t76 = *((unsigned int *)t64);
    t77 = *((unsigned int *)t70);
    *((unsigned int *)t64) = (t76 | t77);
    t78 = (t25 + 4);
    t79 = (t56 + 4);
    t80 = *((unsigned int *)t78);
    t81 = (~(t80));
    t82 = *((unsigned int *)t25);
    t83 = (t82 & t81);
    t84 = *((unsigned int *)t79);
    t85 = (~(t84));
    t86 = *((unsigned int *)t56);
    t87 = (t86 & t85);
    t88 = (~(t83));
    t89 = (~(t87));
    t90 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t90 & t88);
    t91 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t91 & t89);
    goto LAB41;

LAB42:    xsi_set_current_line(64, ng0);

LAB45:    xsi_set_current_line(65, ng0);
    t98 = ((char*)((ng10)));
    t99 = (t0 + 1748);
    xsi_vlogvar_assign_value(t99, t98, 0, 0, 4);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB44;

LAB48:    t12 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB49;

LAB50:    *((unsigned int *)t25) = 1;
    goto LAB53;

LAB52:    t16 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB53;

LAB54:    t26 = (t0 + 968U);
    t32 = *((char **)t26);
    t26 = ((char*)((ng12)));
    memset(t40, 0, 8);
    t33 = (t32 + 4);
    t38 = (t26 + 4);
    t43 = *((unsigned int *)t32);
    t44 = *((unsigned int *)t26);
    t45 = (t43 ^ t44);
    t46 = *((unsigned int *)t33);
    t47 = *((unsigned int *)t38);
    t48 = (t46 ^ t47);
    t49 = (t45 | t48);
    t50 = *((unsigned int *)t33);
    t51 = *((unsigned int *)t38);
    t52 = (t50 | t51);
    t53 = (~(t52));
    t54 = (t49 & t53);
    if (t54 != 0)
        goto LAB60;

LAB57:    if (t52 != 0)
        goto LAB59;

LAB58:    *((unsigned int *)t40) = 1;

LAB60:    memset(t56, 0, 8);
    t41 = (t40 + 4);
    t58 = *((unsigned int *)t41);
    t59 = (~(t58));
    t60 = *((unsigned int *)t40);
    t61 = (t60 & t59);
    t62 = (t61 & 1U);
    if (t62 != 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t41) != 0)
        goto LAB63;

LAB64:    t65 = *((unsigned int *)t25);
    t66 = *((unsigned int *)t56);
    t67 = (t65 | t66);
    *((unsigned int *)t64) = t67;
    t55 = (t25 + 4);
    t57 = (t56 + 4);
    t63 = (t64 + 4);
    t71 = *((unsigned int *)t55);
    t72 = *((unsigned int *)t57);
    t73 = (t71 | t72);
    *((unsigned int *)t63) = t73;
    t74 = *((unsigned int *)t63);
    t75 = (t74 != 0);
    if (t75 == 1)
        goto LAB65;

LAB66:
LAB67:    goto LAB56;

LAB59:    t39 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB60;

LAB61:    *((unsigned int *)t56) = 1;
    goto LAB64;

LAB63:    t42 = (t56 + 4);
    *((unsigned int *)t56) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB64;

LAB65:    t76 = *((unsigned int *)t64);
    t77 = *((unsigned int *)t63);
    *((unsigned int *)t64) = (t76 | t77);
    t68 = (t25 + 4);
    t69 = (t56 + 4);
    t80 = *((unsigned int *)t68);
    t81 = (~(t80));
    t82 = *((unsigned int *)t25);
    t13 = (t82 & t81);
    t84 = *((unsigned int *)t69);
    t85 = (~(t84));
    t86 = *((unsigned int *)t56);
    t83 = (t86 & t85);
    t88 = (~(t13));
    t89 = (~(t83));
    t90 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t90 & t88);
    t91 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t91 & t89);
    goto LAB67;

LAB68:    xsi_set_current_line(67, ng0);

LAB71:    xsi_set_current_line(68, ng0);
    t78 = ((char*)((ng13)));
    t79 = (t0 + 1748);
    xsi_vlogvar_assign_value(t79, t78, 0, 0, 4);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB70;

LAB74:    t12 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB75;

LAB76:    xsi_set_current_line(70, ng0);

LAB79:    xsi_set_current_line(71, ng0);
    t16 = (t0 + 784U);
    t24 = *((char **)t16);
    t16 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t16, t24, 0, 0, 32, 0LL);
    goto LAB78;

LAB82:    t12 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB83;

LAB84:    xsi_set_current_line(72, ng0);

LAB87:    xsi_set_current_line(73, ng0);
    t16 = (t0 + 784U);
    t24 = *((char **)t16);
    t16 = (t0 + 1656);
    xsi_vlogvar_wait_assign_value(t16, t24, 0, 0, 32, 0LL);
    goto LAB86;

}


extern void work_m_00000000002849979709_1071390700_init()
{
	static char *pe[] = {(void *)Cont_20_0,(void *)Cont_21_1,(void *)Always_23_2,(void *)Always_52_3};
	xsi_register_didat("work_m_00000000002849979709_1071390700", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000002849979709_1071390700.didat");
	xsi_register_executes(pe);
}
