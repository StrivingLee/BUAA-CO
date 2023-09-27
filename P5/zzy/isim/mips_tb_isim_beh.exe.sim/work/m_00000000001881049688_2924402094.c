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
static const char *ng0 = "D:/Programing/ComputerOrganization/P5/zzy/DM.v";
static int ng1[] = {0, 0};
static int ng2[] = {4096, 0};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {1, 0};
static unsigned int ng5[] = {1U, 0U};
static const char *ng6 = "%d@%h: *%h <= %h";



static void Initial_37_0(char *t0)
{
    char t5[8];
    char t14[8];
    char t15[8];
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
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(37, ng0);

LAB2:    xsi_set_current_line(38, ng0);
    xsi_set_current_line(38, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1656);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 1656);
    t2 = (t1 + 36U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_less(t5, 32, t3, 32, t4, 32);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:    xsi_set_current_line(41, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 1472);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB6:    xsi_set_current_line(39, ng0);
    t12 = ((char*)((ng3)));
    t13 = (t0 + 1564);
    t16 = (t0 + 1564);
    t17 = (t16 + 44U);
    t18 = *((char **)t17);
    t19 = (t0 + 1564);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    t22 = (t0 + 1656);
    t23 = (t22 + 36U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 1656);
    t2 = (t1 + 36U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng4)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 1656);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_assign_value(t13, t12, 0, *((unsigned int *)t15), t35);
    goto LAB8;

}

static void Always_43_1(char *t0)
{
    char t10[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 2324U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2664);
    *((int *)t2) = 1;
    t3 = (t0 + 2352);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(43, ng0);

LAB5:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1152U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:
LAB9:    goto LAB2;

LAB7:    xsi_set_current_line(45, ng0);

LAB10:    xsi_set_current_line(46, ng0);
    t7 = (t0 + 1564);
    t8 = (t7 + 36U);
    t9 = *((char **)t8);
    t11 = (t0 + 1564);
    t12 = (t11 + 44U);
    t13 = *((char **)t12);
    t14 = (t0 + 1564);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    t18 = (t0 + 600U);
    t19 = *((char **)t18);
    memset(t17, 0, 8);
    t18 = (t17 + 4);
    t20 = (t19 + 4);
    t21 = *((unsigned int *)t19);
    t22 = (t21 >> 2);
    *((unsigned int *)t17) = t22;
    t23 = *((unsigned int *)t20);
    t24 = (t23 >> 2);
    *((unsigned int *)t18) = t24;
    t25 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t25 & 4095U);
    t26 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t26 & 4095U);
    xsi_vlog_generic_get_array_select_value(t10, 32, t9, t13, t16, 2, 1, t17, 12, 2);
    t27 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t27, t10, 0, 0, 32, 0LL);
    goto LAB9;

}

static void Always_50_2(char *t0)
{
    char t6[8];
    char t30[8];
    char t31[8];
    char t45[8];
    char t60[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
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
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    int t39;
    char *t40;
    int t41;
    int t42;
    int t43;
    int t44;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    int t59;

LAB0:    t1 = (t0 + 2468U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2672);
    *((int *)t2) = 1;
    t3 = (t0 + 2496);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(51, ng0);
    t4 = (t0 + 968U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(56, ng0);

LAB20:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB24;

LAB21:    if (t18 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t6) = 1;

LAB24:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(67, ng0);

LAB39:
LAB27:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(51, ng0);

LAB13:    xsi_set_current_line(52, ng0);
    xsi_set_current_line(52, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 1656);
    xsi_vlogvar_assign_value(t29, t28, 0, 0, 32);

LAB14:    t2 = (t0 + 1656);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB15;

LAB16:    goto LAB12;

LAB15:    xsi_set_current_line(52, ng0);

LAB17:    xsi_set_current_line(53, ng0);
    t8 = ((char*)((ng3)));
    t21 = (t0 + 1564);
    t22 = (t0 + 1564);
    t28 = (t22 + 44U);
    t29 = *((char **)t28);
    t32 = (t0 + 1564);
    t33 = (t32 + 40U);
    t34 = *((char **)t33);
    t35 = (t0 + 1656);
    t36 = (t35 + 36U);
    t37 = *((char **)t36);
    xsi_vlog_generic_convert_array_indices(t30, t31, t29, t34, 2, 1, t37, 32, 1);
    t38 = (t30 + 4);
    t14 = *((unsigned int *)t38);
    t39 = (!(t14));
    t40 = (t31 + 4);
    t15 = *((unsigned int *)t40);
    t41 = (!(t15));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB18;

LAB19:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1656);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1656);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB14;

LAB18:    t16 = *((unsigned int *)t30);
    t17 = *((unsigned int *)t31);
    t43 = (t16 - t17);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t21, t8, 0, *((unsigned int *)t31), t44, 0LL);
    goto LAB19;

LAB23:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB24;

LAB25:    xsi_set_current_line(57, ng0);

LAB28:    xsi_set_current_line(58, ng0);
    t21 = (t0 + 1152U);
    t22 = *((char **)t21);

LAB29:    t21 = ((char*)((ng3)));
    t39 = xsi_vlog_unsigned_case_compare(t22, 2, t21, 2);
    if (t39 == 1)
        goto LAB30;

LAB31:
LAB33:
LAB32:    xsi_set_current_line(63, ng0);

LAB38:
LAB34:    goto LAB27;

LAB30:    xsi_set_current_line(59, ng0);

LAB35:    xsi_set_current_line(60, ng0);
    t28 = (t0 + 692U);
    t29 = *((char **)t28);
    t28 = (t0 + 1564);
    t32 = (t0 + 1564);
    t33 = (t32 + 44U);
    t34 = *((char **)t33);
    t35 = (t0 + 1564);
    t36 = (t35 + 40U);
    t37 = *((char **)t36);
    t38 = (t0 + 600U);
    t40 = *((char **)t38);
    memset(t45, 0, 8);
    t38 = (t45 + 4);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t40);
    t48 = (t47 >> 2);
    *((unsigned int *)t45) = t48;
    t49 = *((unsigned int *)t46);
    t50 = (t49 >> 2);
    *((unsigned int *)t38) = t50;
    t51 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t51 & 4095U);
    t52 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t52 & 4095U);
    xsi_vlog_generic_convert_array_indices(t30, t31, t34, t37, 2, 1, t45, 12, 2);
    t53 = (t30 + 4);
    t54 = *((unsigned int *)t53);
    t41 = (!(t54));
    t55 = (t31 + 4);
    t56 = *((unsigned int *)t55);
    t42 = (!(t56));
    t43 = (t41 && t42);
    if (t43 == 1)
        goto LAB36;

LAB37:    xsi_set_current_line(61, ng0);
    t2 = xsi_vlog_time(t60, 1000.0000000000000, 1000.0000000000000);
    t3 = (t0 + 1060U);
    t4 = *((char **)t3);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    t3 = (t0 + 692U);
    t7 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng6, 5, t0, (char)118, t60, 64, (char)118, t4, 32, (char)118, t5, 32, (char)118, t7, 32);
    goto LAB34;

LAB36:    t57 = *((unsigned int *)t30);
    t58 = *((unsigned int *)t31);
    t44 = (t57 - t58);
    t59 = (t44 + 1);
    xsi_vlogvar_wait_assign_value(t28, t29, 0, *((unsigned int *)t31), t59, 0LL);
    goto LAB37;

}


extern void work_m_00000000001881049688_2924402094_init()
{
	static char *pe[] = {(void *)Initial_37_0,(void *)Always_43_1,(void *)Always_50_2};
	xsi_register_didat("work_m_00000000001881049688_2924402094", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000001881049688_2924402094.didat");
	xsi_register_executes(pe);
}
