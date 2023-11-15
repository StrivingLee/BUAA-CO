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
static const char *ng0 = "D:/Programing/ComputerOrganization/P5/P5_swc/ALU.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};
static int ng7[] = {32, 0};



static void Cont_12_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 1812U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(12, ng0);
    t2 = (t0 + 692U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 31U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 31U);
    t12 = (t0 + 2204);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 31U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 4);
    t25 = (t0 + 2152);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Always_14_1(char *t0)
{
    char t10[8];
    char t36[8];
    char t37[8];
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
    char *t38;
    char *t39;
    char *t40;

LAB0:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 2160);
    *((int *)t2) = 1;
    t3 = (t0 + 1984);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(14, ng0);

LAB5:    xsi_set_current_line(15, ng0);
    t4 = (t0 + 784U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB21:    goto LAB2;

LAB7:    xsi_set_current_line(17, ng0);
    t7 = (t0 + 600U);
    t8 = *((char **)t7);
    t7 = (t0 + 692U);
    t9 = *((char **)t7);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t8, 32, t9, 32);
    t7 = (t0 + 1196);
    xsi_vlogvar_assign_value(t7, t10, 0, 0, 32);
    goto LAB21;

LAB9:    xsi_set_current_line(19, ng0);
    t3 = (t0 + 600U);
    t4 = *((char **)t3);
    t3 = (t0 + 692U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB21;

LAB11:    xsi_set_current_line(21, ng0);
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
LAB24:    t21 = (t0 + 1196);
    xsi_vlogvar_assign_value(t21, t10, 0, 0, 32);
    goto LAB21;

LAB13:    xsi_set_current_line(23, ng0);
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
LAB27:    t35 = (t0 + 1196);
    xsi_vlogvar_assign_value(t35, t10, 0, 0, 32);
    goto LAB21;

LAB15:    xsi_set_current_line(25, ng0);
    t3 = (t0 + 692U);
    t4 = *((char **)t3);
    t3 = (t0 + 876U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 32, t4, 32, t7, 5);
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB21;

LAB17:    xsi_set_current_line(26, ng0);

LAB28:    xsi_set_current_line(28, ng0);
    t3 = (t0 + 692U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t7 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t7);
    t15 = (t14 >> 0);
    t16 = (t15 & 1);
    *((unsigned int *)t3) = t16;
    t8 = (t10 + 4);
    t17 = *((unsigned int *)t8);
    t18 = (~(t17));
    t19 = *((unsigned int *)t10);
    t20 = (t19 & t18);
    t23 = (t20 != 0);
    if (t23 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t36, 0, 8);
    t2 = (t36 + 4);
    t4 = (t3 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (t11 >> 0);
    t13 = (t12 & 1);
    *((unsigned int *)t36) = t13;
    t14 = *((unsigned int *)t4);
    t15 = (t14 >> 0);
    t16 = (t15 & 1);
    *((unsigned int *)t2) = t16;
    memset(t10, 0, 8);
    t7 = (t36 + 4);
    t17 = *((unsigned int *)t7);
    t18 = (~(t17));
    t19 = *((unsigned int *)t36);
    t20 = (t19 & t18);
    t23 = (t20 & 1U);
    if (t23 != 0)
        goto LAB39;

LAB37:    if (*((unsigned int *)t7) == 0)
        goto LAB36;

LAB38:    t8 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t8) = 1;

LAB39:    t9 = (t10 + 4);
    t24 = *((unsigned int *)t9);
    t25 = (~(t24));
    t27 = *((unsigned int *)t10);
    t28 = (t27 & t25);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB40;

LAB41:
LAB42:
LAB31:    goto LAB21;

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

LAB29:    xsi_set_current_line(28, ng0);

LAB32:    xsi_set_current_line(29, ng0);
    t9 = (t0 + 600U);
    t21 = *((char **)t9);
    t9 = (t0 + 968U);
    t22 = *((char **)t9);
    memset(t36, 0, 8);
    xsi_vlog_unsigned_lshift(t36, 32, t21, 32, t22, 5);
    t9 = (t0 + 1288);
    xsi_vlogvar_assign_value(t9, t36, 0, 0, 32);
    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t7 = (t0 + 600U);
    t8 = *((char **)t7);
    t7 = ((char*)((ng7)));
    t9 = (t0 + 968U);
    t21 = *((char **)t9);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 32, t7, 32, t21, 5);
    memset(t36, 0, 8);
    xsi_vlog_unsigned_rshift(t36, 32, t8, 32, t10, 32);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t36);
    t13 = (t11 | t12);
    *((unsigned int *)t37) = t13;
    t9 = (t4 + 4);
    t22 = (t36 + 4);
    t35 = (t37 + 4);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t22);
    t16 = (t14 | t15);
    *((unsigned int *)t35) = t16;
    t17 = *((unsigned int *)t35);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB33;

LAB34:
LAB35:    t40 = (t0 + 1288);
    xsi_vlogvar_assign_value(t40, t37, 0, 0, 32);
    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t7 = (t0 + 1196);
    xsi_vlogvar_assign_value(t7, t4, 0, 0, 32);
    goto LAB31;

LAB33:    t19 = *((unsigned int *)t37);
    t20 = *((unsigned int *)t35);
    *((unsigned int *)t37) = (t19 | t20);
    t38 = (t4 + 4);
    t39 = (t36 + 4);
    t23 = *((unsigned int *)t38);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t6 = (t25 & t24);
    t27 = *((unsigned int *)t39);
    t28 = (~(t27));
    t29 = *((unsigned int *)t36);
    t26 = (t29 & t28);
    t31 = (~(t6));
    t32 = (~(t26));
    t33 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t33 & t31);
    t34 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t34 & t32);
    goto LAB35;

LAB36:    *((unsigned int *)t10) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(33, ng0);

LAB43:    xsi_set_current_line(34, ng0);
    t21 = (t0 + 600U);
    t22 = *((char **)t21);
    t21 = (t0 + 968U);
    t35 = *((char **)t21);
    memset(t37, 0, 8);
    xsi_vlog_unsigned_rshift(t37, 32, t22, 32, t35, 5);
    t21 = (t0 + 1288);
    xsi_vlogvar_assign_value(t21, t37, 0, 0, 32);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t7 = (t0 + 600U);
    t8 = *((char **)t7);
    t7 = ((char*)((ng7)));
    t9 = (t0 + 968U);
    t21 = *((char **)t9);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 32, t7, 32, t21, 5);
    memset(t36, 0, 8);
    xsi_vlog_unsigned_lshift(t36, 32, t8, 32, t10, 32);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t36);
    t13 = (t11 | t12);
    *((unsigned int *)t37) = t13;
    t9 = (t4 + 4);
    t22 = (t36 + 4);
    t35 = (t37 + 4);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t22);
    t16 = (t14 | t15);
    *((unsigned int *)t35) = t16;
    t17 = *((unsigned int *)t35);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB44;

LAB45:
LAB46:    t40 = (t0 + 1288);
    xsi_vlogvar_assign_value(t40, t37, 0, 0, 32);
    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t7 = (t0 + 1196);
    xsi_vlogvar_assign_value(t7, t4, 0, 0, 32);
    goto LAB42;

LAB44:    t19 = *((unsigned int *)t37);
    t20 = *((unsigned int *)t35);
    *((unsigned int *)t37) = (t19 | t20);
    t38 = (t4 + 4);
    t39 = (t36 + 4);
    t23 = *((unsigned int *)t38);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t6 = (t25 & t24);
    t27 = *((unsigned int *)t39);
    t28 = (~(t27));
    t29 = *((unsigned int *)t36);
    t26 = (t29 & t28);
    t31 = (~(t6));
    t32 = (~(t26));
    t33 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t33 & t31);
    t34 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t34 & t32);
    goto LAB46;

}


extern void work_m_00000000000527495717_0886308060_init()
{
	static char *pe[] = {(void *)Cont_12_0,(void *)Always_14_1};
	xsi_register_didat("work_m_00000000000527495717_0886308060", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000000527495717_0886308060.didat");
	xsi_register_executes(pe);
}
