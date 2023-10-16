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
static const char *ng0 = "D:/Xilinx/Project/P1/Q4/gray.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {6U, 0U};
static unsigned int ng7[] = {7U, 0U};
static unsigned int ng8[] = {5U, 0U};
static unsigned int ng9[] = {4U, 0U};
static int ng10[] = {1, 0};



static void Cont_32_0(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 1812U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1196);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 2356);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 7U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 2);
    t18 = (t0 + 2296);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_33_1(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 2392);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 2304);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_35_2(char *t0)
{
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
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 2100U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 2312);
    *((int *)t2) = 1;
    t3 = (t0 + 2128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);

LAB5:    xsi_set_current_line(36, ng0);
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

LAB7:    xsi_set_current_line(40, ng0);

LAB10:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:
LAB13:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(36, ng0);

LAB9:    xsi_set_current_line(37, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 3, 0LL);
    xsi_set_current_line(38, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(41, ng0);

LAB14:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 1196);
    t5 = (t4 + 36U);
    t11 = *((char **)t5);

LAB15:    t12 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 3, t12, 3);
    if (t13 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 3, t2, 3);
    if (t13 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 3, t2, 3);
    if (t13 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 3, t2, 3);
    if (t13 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 3, t2, 3);
    if (t13 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 3, t2, 3);
    if (t13 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 3, t2, 3);
    if (t13 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t11, 3, t2, 3);
    if (t13 == 1)
        goto LAB30;

LAB31:
LAB32:    goto LAB13;

LAB16:    xsi_set_current_line(43, ng0);
    t14 = ((char*)((ng3)));
    t15 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t15, t14, 0, 0, 3, 0LL);
    goto LAB32;

LAB18:    xsi_set_current_line(44, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB32;

LAB20:    xsi_set_current_line(45, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB32;

LAB22:    xsi_set_current_line(46, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB32;

LAB24:    xsi_set_current_line(47, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB32;

LAB26:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB32;

LAB28:    xsi_set_current_line(49, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    goto LAB32;

LAB30:    xsi_set_current_line(50, ng0);

LAB33:    xsi_set_current_line(51, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB32;

}


extern void work_m_00000000002564981968_0735672237_init()
{
	static char *pe[] = {(void *)Cont_32_0,(void *)Cont_33_1,(void *)Always_35_2};
	xsi_register_didat("work_m_00000000002564981968_0735672237", "isim/gray_tb_isim_beh.exe.sim/work/m_00000000002564981968_0735672237.didat");
	xsi_register_executes(pe);
}
