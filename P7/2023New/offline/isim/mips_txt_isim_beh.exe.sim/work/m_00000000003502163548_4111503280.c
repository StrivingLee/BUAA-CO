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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Programing/BUAA-CO/P7/2023New/offline/MDU.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {5U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {10U, 0U};
static unsigned int ng7[] = {4U, 0U};
static unsigned int ng8[] = {7U, 0U};
static unsigned int ng9[] = {8U, 0U};
static unsigned int ng10[] = {9U, 0U};
static unsigned int ng11[] = {0U, 0U, 0U, 0U};
static unsigned int ng12[] = {11U, 0U};
static unsigned int ng13[] = {12U, 0U};



static void Always_27_0(char *t0)
{
    char t13[8];
    char t21[8];
    char t48[16];
    char t49[16];
    char t50[16];
    char t51[8];
    char t52[16];
    char t53[16];
    char t54[16];
    char t55[16];
    char t56[16];
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    int t45;
    char *t46;
    char *t47;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 4288);
    *((int *)t2) = 1;
    t3 = (t0 + 4000);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t2) == 0)
        goto LAB10;

LAB12:    t4 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t4) = 1;

LAB13:    t5 = (t13 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (~(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB14;

LAB15:
LAB16:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(28, ng0);

LAB9:    xsi_set_current_line(29, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    xsi_set_current_line(30, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(31, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB8;

LAB10:    *((unsigned int *)t13) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(34, ng0);

LAB17:    xsi_set_current_line(35, ng0);
    t11 = (t0 + 3048);
    t12 = (t11 + 56U);
    t19 = *((char **)t12);
    t20 = ((char*)((ng1)));
    memset(t21, 0, 8);
    t22 = (t19 + 4);
    t23 = (t20 + 4);
    t24 = *((unsigned int *)t19);
    t25 = *((unsigned int *)t20);
    t26 = (t24 ^ t25);
    t27 = *((unsigned int *)t22);
    t28 = *((unsigned int *)t23);
    t29 = (t27 ^ t28);
    t30 = (t26 | t29);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t23);
    t33 = (t31 | t32);
    t34 = (~(t33));
    t35 = (t30 & t34);
    if (t35 != 0)
        goto LAB21;

LAB18:    if (t33 != 0)
        goto LAB20;

LAB19:    *((unsigned int *)t21) = 1;

LAB21:    t37 = (t21 + 4);
    t38 = *((unsigned int *)t37);
    t39 = (~(t38));
    t40 = *((unsigned int *)t21);
    t41 = (t40 & t39);
    t42 = (t41 != 0);
    if (t42 > 0)
        goto LAB22;

LAB23:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t24 = (~(t18));
    t25 = (t15 & t24);
    if (t25 != 0)
        goto LAB61;

LAB58:    if (t18 != 0)
        goto LAB60;

LAB59:    *((unsigned int *)t13) = 1;

LAB61:    t20 = (t13 + 4);
    t26 = *((unsigned int *)t20);
    t27 = (~(t26));
    t28 = *((unsigned int *)t13);
    t29 = (t28 & t27);
    t30 = (t29 != 0);
    if (t30 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 4, t4, 4, t5, 4);
    t11 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 4, 0LL);

LAB64:
LAB24:    goto LAB16;

LAB20:    t36 = (t21 + 4);
    *((unsigned int *)t21) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB21;

LAB22:    xsi_set_current_line(35, ng0);

LAB25:    xsi_set_current_line(36, ng0);
    t43 = (t0 + 1528U);
    t44 = *((char **)t43);

LAB26:    t43 = ((char*)((ng2)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t43, 4);
    if (t45 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng4)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng5)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng7)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng8)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng9)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng10)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB39;

LAB40:    t2 = ((char*)((ng6)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng12)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng13)));
    t45 = xsi_vlog_unsigned_case_compare(t44, 4, t2, 4);
    if (t45 == 1)
        goto LAB45;

LAB46:
LAB47:    goto LAB24;

LAB27:    xsi_set_current_line(37, ng0);

LAB48:    xsi_set_current_line(38, ng0);
    t46 = ((char*)((ng2)));
    t47 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t47, t46, 0, 0, 1, 0LL);
    xsi_set_current_line(39, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    xsi_vlogtype_sign_extend(t48, 64, t3, 32);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    xsi_vlogtype_sign_extend(t49, 64, t4, 32);
    xsi_vlog_signed_multiply(t50, 64, t48, 64, t49, 64);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t50, 0, 0, 32, 0LL);
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t50, 32, 0, 32, 0LL);
    goto LAB47;

LAB29:    xsi_set_current_line(42, ng0);

LAB49:    xsi_set_current_line(43, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    xsi_vlog_unsigned_multiply(t48, 64, t3, 32, t4, 32);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t48, 0, 0, 32, 0LL);
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t48, 32, 0, 32, 0LL);
    goto LAB47;

LAB31:    xsi_set_current_line(47, ng0);

LAB50:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    memset(t51, 0, 8);
    xsi_vlog_signed_mod(t51, 32, t3, 32, t4, 32);
    t2 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t2, t51, 0, 0, 32, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    memset(t51, 0, 8);
    xsi_vlog_signed_divide(t51, 32, t3, 32, t4, 32);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t51, 0, 0, 32, 0LL);
    goto LAB47;

LAB33:    xsi_set_current_line(53, ng0);

LAB51:    xsi_set_current_line(54, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_mod(t13, 32, t3, 32, t4, 32);
    t2 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t2, t13, 0, 0, 32, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_divide(t13, 32, t3, 32, t4, 32);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t13, 0, 0, 32, 0LL);
    goto LAB47;

LAB35:    xsi_set_current_line(59, ng0);

LAB52:    xsi_set_current_line(60, ng0);
    t3 = (t0 + 1688U);
    t4 = *((char **)t3);
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB47;

LAB37:    xsi_set_current_line(63, ng0);

LAB53:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 1688U);
    t4 = *((char **)t3);
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB47;

LAB39:    xsi_set_current_line(68, ng0);

LAB54:    xsi_set_current_line(69, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    xsi_vlogtype_concat(t48, 64, 64, 2U, t12, 32, t4, 32);
    t19 = ((char*)((ng11)));
    t20 = (t0 + 1688U);
    t22 = *((char **)t20);
    xsi_vlogtype_sign_extend(t52, 64, t22, 32);
    t20 = (t0 + 1848U);
    t23 = *((char **)t20);
    xsi_vlogtype_sign_extend(t53, 64, t23, 32);
    xsi_vlog_signed_multiply(t54, 64, t52, 64, t53, 64);
    xsi_vlog_signed_add(t55, 64, t19, 64, t54, 64);
    xsi_vlog_unsigned_add(t56, 64, t48, 64, t55, 64);
    t20 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t20, t56, 0, 0, 32, 0LL);
    t36 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t36, t56, 32, 0, 32, 0LL);
    goto LAB47;

LAB41:    xsi_set_current_line(74, ng0);

LAB55:    xsi_set_current_line(75, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    xsi_vlogtype_concat(t48, 64, 64, 2U, t12, 32, t4, 32);
    t19 = (t0 + 1688U);
    t20 = *((char **)t19);
    t19 = (t0 + 1848U);
    t22 = *((char **)t19);
    xsi_vlog_unsigned_multiply(t49, 64, t20, 32, t22, 32);
    xsi_vlog_unsigned_add(t50, 64, t48, 64, t49, 64);
    t19 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t19, t50, 0, 0, 32, 0LL);
    t23 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t23, t50, 32, 0, 32, 0LL);
    goto LAB47;

LAB43:    xsi_set_current_line(79, ng0);

LAB56:    xsi_set_current_line(80, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    xsi_vlogtype_concat(t48, 64, 64, 2U, t12, 32, t4, 32);
    t19 = ((char*)((ng11)));
    t20 = (t0 + 1688U);
    t22 = *((char **)t20);
    xsi_vlogtype_sign_extend(t52, 64, t22, 32);
    t20 = (t0 + 1848U);
    t23 = *((char **)t20);
    xsi_vlogtype_sign_extend(t53, 64, t23, 32);
    xsi_vlog_signed_multiply(t54, 64, t52, 64, t53, 64);
    xsi_vlog_signed_add(t55, 64, t19, 64, t54, 64);
    xsi_vlog_unsigned_minus(t56, 64, t48, 64, t55, 64);
    t20 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t20, t56, 0, 0, 32, 0LL);
    t36 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t36, t56, 32, 0, 32, 0LL);
    goto LAB47;

LAB45:    xsi_set_current_line(85, ng0);

LAB57:    xsi_set_current_line(86, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2408);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    xsi_vlogtype_concat(t48, 64, 64, 2U, t12, 32, t4, 32);
    t19 = (t0 + 1688U);
    t20 = *((char **)t19);
    t19 = (t0 + 1848U);
    t22 = *((char **)t19);
    xsi_vlog_unsigned_multiply(t49, 64, t20, 32, t22, 32);
    xsi_vlog_unsigned_minus(t50, 64, t48, 64, t49, 64);
    t19 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t19, t50, 0, 0, 32, 0LL);
    t23 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t23, t50, 32, 0, 32, 0LL);
    goto LAB47;

LAB60:    t19 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB61;

LAB62:    xsi_set_current_line(92, ng0);

LAB65:    xsi_set_current_line(93, ng0);
    t22 = (t0 + 2728);
    t23 = (t22 + 56U);
    t36 = *((char **)t23);
    t37 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 32, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB64;

}


extern void work_m_00000000003502163548_4111503280_init()
{
	static char *pe[] = {(void *)Always_27_0};
	xsi_register_didat("work_m_00000000003502163548_4111503280", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000003502163548_4111503280.didat");
	xsi_register_executes(pe);
}
