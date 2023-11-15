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
static const char *ng0 = "D:/Programing/ComputerOrganization/P5/zzy/MUX.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {6U, 0U};
static unsigned int ng8[] = {7U, 0U};



static void Initial_118_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(118, ng0);

LAB2:    xsi_set_current_line(119, ng0);
    t1 = (t0 + 600U);
    t2 = *((char **)t1);
    t1 = (t0 + 1564);
    xsi_vlogvar_assign_value(t1, t2, 0, 0, 32);

LAB1:    return;
}

static void Always_121_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 2232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 2428);
    *((int *)t2) = 1;
    t3 = (t0 + 2260);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(121, ng0);

LAB5:    xsi_set_current_line(122, ng0);
    t4 = (t0 + 1336U);
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

LAB18:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB21;

LAB22:
LAB24:
LAB23:    xsi_set_current_line(147, ng0);

LAB34:
LAB25:    goto LAB2;

LAB7:    xsi_set_current_line(123, ng0);

LAB26:    xsi_set_current_line(124, ng0);
    t7 = (t0 + 600U);
    t8 = *((char **)t7);
    t7 = (t0 + 1564);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 32);
    goto LAB25;

LAB9:    xsi_set_current_line(126, ng0);

LAB27:    xsi_set_current_line(127, ng0);
    t3 = (t0 + 692U);
    t4 = *((char **)t3);
    t3 = (t0 + 1564);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB25;

LAB11:    xsi_set_current_line(129, ng0);

LAB28:    xsi_set_current_line(130, ng0);
    t3 = (t0 + 784U);
    t4 = *((char **)t3);
    t3 = (t0 + 1564);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB25;

LAB13:    xsi_set_current_line(132, ng0);

LAB29:    xsi_set_current_line(133, ng0);
    t3 = (t0 + 876U);
    t4 = *((char **)t3);
    t3 = (t0 + 1564);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB25;

LAB15:    xsi_set_current_line(135, ng0);

LAB30:    xsi_set_current_line(136, ng0);
    t3 = (t0 + 968U);
    t4 = *((char **)t3);
    t3 = (t0 + 1564);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB25;

LAB17:    xsi_set_current_line(138, ng0);

LAB31:    xsi_set_current_line(139, ng0);
    t3 = (t0 + 1060U);
    t4 = *((char **)t3);
    t3 = (t0 + 1564);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB25;

LAB19:    xsi_set_current_line(141, ng0);

LAB32:    xsi_set_current_line(142, ng0);
    t3 = (t0 + 1152U);
    t4 = *((char **)t3);
    t3 = (t0 + 1564);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB25;

LAB21:    xsi_set_current_line(144, ng0);

LAB33:    xsi_set_current_line(145, ng0);
    t3 = (t0 + 1244U);
    t4 = *((char **)t3);
    t3 = (t0 + 1564);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB25;

}


extern void work_m_00000000003088431734_0617436522_init()
{
	static char *pe[] = {(void *)Initial_118_0,(void *)Always_121_1};
	xsi_register_didat("work_m_00000000003088431734_0617436522", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000003088431734_0617436522.didat");
	xsi_register_executes(pe);
}
