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
static const char *ng0 = "D:/Programing/ComputerOrganization/P5/zzy/NPC.v";
static unsigned int ng1[] = {12288U, 0U};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {4, 0};
static unsigned int ng4[] = {1U, 0U};
static int ng5[] = {2, 0};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {3U, 0U};



static void Initial_35_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(35, ng0);

LAB2:    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1380);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB1:    return;
}

static void Always_38_1(char *t0)
{
    char t9[8];
    char t31[8];
    char t34[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
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
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t36;

LAB0:    t1 = (t0 + 2048U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 2244);
    *((int *)t2) = 1;
    t3 = (t0 + 2076);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB5:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 600U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(57, ng0);

LAB31:
LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(40, ng0);

LAB18:    xsi_set_current_line(41, ng0);
    t7 = (t0 + 1060U);
    t8 = *((char **)t7);
    t7 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t8, 32, t7, 32);
    t10 = (t0 + 1380);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 32);
    goto LAB17;

LAB9:    xsi_set_current_line(43, ng0);

LAB19:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 692U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng4)));
    memset(t9, 0, 8);
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
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB23;

LAB20:    if (t20 != 0)
        goto LAB22;

LAB21:    *((unsigned int *)t9) = 1;

LAB23:    t23 = (t9 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t9);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(47, ng0);

LAB28:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1060U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t3, 32, t2, 32);
    t4 = (t0 + 1380);
    xsi_vlogvar_assign_value(t4, t9, 0, 0, 32);

LAB26:    goto LAB17;

LAB11:    xsi_set_current_line(51, ng0);

LAB29:    xsi_set_current_line(52, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 876U);
    t7 = *((char **)t4);
    memset(t31, 0, 8);
    t4 = (t31 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t31) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 0);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t15 & 67108863U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 67108863U);
    t10 = (t0 + 1152U);
    t23 = *((char **)t10);
    memset(t34, 0, 8);
    t10 = (t34 + 4);
    t29 = (t23 + 4);
    t17 = *((unsigned int *)t23);
    t18 = (t17 >> 28);
    *((unsigned int *)t34) = t18;
    t19 = *((unsigned int *)t29);
    t20 = (t19 >> 28);
    *((unsigned int *)t10) = t20;
    t21 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t21 & 15U);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t22 & 15U);
    xsi_vlogtype_concat(t9, 32, 32, 3U, t34, 4, t31, 26, t3, 2);
    t30 = (t0 + 1380);
    xsi_vlogvar_assign_value(t30, t9, 0, 0, 32);
    goto LAB17;

LAB13:    xsi_set_current_line(54, ng0);

LAB30:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 968U);
    t4 = *((char **)t3);
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB17;

LAB22:    t10 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB23;

LAB24:    xsi_set_current_line(44, ng0);

LAB27:    xsi_set_current_line(45, ng0);
    t29 = (t0 + 1152U);
    t30 = *((char **)t29);
    t29 = ((char*)((ng3)));
    memset(t31, 0, 8);
    xsi_vlog_unsigned_add(t31, 32, t30, 32, t29, 32);
    t32 = (t0 + 784U);
    t33 = *((char **)t32);
    t32 = ((char*)((ng5)));
    memset(t34, 0, 8);
    xsi_vlog_unsigned_lshift(t34, 32, t33, 32, t32, 32);
    memset(t35, 0, 8);
    xsi_vlog_unsigned_add(t35, 32, t31, 32, t34, 32);
    t36 = (t0 + 1380);
    xsi_vlogvar_assign_value(t36, t35, 0, 0, 32);
    goto LAB26;

}


extern void work_m_00000000003594154253_0757879789_init()
{
	static char *pe[] = {(void *)Initial_35_0,(void *)Always_38_1};
	xsi_register_didat("work_m_00000000003594154253_0757879789", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000003594154253_0757879789.didat");
	xsi_register_executes(pe);
}
