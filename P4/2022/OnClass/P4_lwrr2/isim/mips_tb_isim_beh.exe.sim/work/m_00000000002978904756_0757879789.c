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
static const char *ng0 = "D:/Programing/ComputerOrganization/P4_pure/NPC.v";
static int ng1[] = {4, 0};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {2, 0};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {4U, 0U};



static void Cont_16_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 2180U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1060U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t3, 32, t2, 32);
    t5 = (t0 + 2572);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 2520);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Always_18_1(char *t0)
{
    char t9[8];
    char t25[8];
    char t39[8];
    char t55[8];
    char t63[8];
    char t103[8];
    char t106[8];
    char t107[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
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
    char *t37;
    char *t38;
    char *t40;
    char *t41;
    unsigned int t42;
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
    char *t54;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    int t87;
    int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    char *t101;
    char *t102;
    char *t104;
    char *t105;
    char *t108;

LAB0:    t1 = (t0 + 2324U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 2528);
    *((int *)t2) = 1;
    t3 = (t0 + 2352);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(18, ng0);

LAB5:    xsi_set_current_line(19, ng0);
    t4 = (t0 + 600U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1060U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t3, 32, t2, 32);
    t4 = (t0 + 1656);
    xsi_vlogvar_assign_value(t4, t9, 0, 0, 32);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(20, ng0);

LAB16:    xsi_set_current_line(21, ng0);
    t7 = (t0 + 876U);
    t8 = *((char **)t7);
    t7 = ((char*)((ng2)));
    memset(t9, 0, 8);
    t10 = (t8 + 4);
    t11 = (t7 + 4);
    t12 = *((unsigned int *)t8);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t10);
    t16 = *((unsigned int *)t11);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t10);
    t20 = *((unsigned int *)t11);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB20;

LAB17:    if (t21 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t9) = 1;

LAB20:    memset(t25, 0, 8);
    t26 = (t9 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (~(t27));
    t29 = *((unsigned int *)t9);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t26) != 0)
        goto LAB23;

LAB24:    t33 = (t25 + 4);
    t34 = *((unsigned int *)t25);
    t35 = *((unsigned int *)t33);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB25;

LAB26:    memcpy(t63, t25, 8);

LAB27:    t95 = (t63 + 4);
    t96 = *((unsigned int *)t95);
    t97 = (~(t96));
    t98 = *((unsigned int *)t63);
    t99 = (t98 & t97);
    t100 = (t99 != 0);
    if (t100 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t9, 0, 8);
    t4 = (t3 + 4);
    t7 = (t2 + 4);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t2);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t7);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t7);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB45;

LAB42:    if (t21 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t9) = 1;

LAB45:    memset(t25, 0, 8);
    t10 = (t9 + 4);
    t27 = *((unsigned int *)t10);
    t28 = (~(t27));
    t29 = *((unsigned int *)t9);
    t30 = (t29 & t28);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t10) != 0)
        goto LAB48;

LAB49:    t24 = (t25 + 4);
    t34 = *((unsigned int *)t25);
    t35 = *((unsigned int *)t24);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB50;

LAB51:    memcpy(t63, t25, 8);

LAB52:    t69 = (t63 + 4);
    t96 = *((unsigned int *)t69);
    t97 = (~(t96));
    t98 = *((unsigned int *)t63);
    t99 = (t98 & t97);
    t100 = (t99 != 0);
    if (t100 > 0)
        goto LAB64;

LAB65:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 1060U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t3, 32, t2, 32);
    t4 = (t0 + 1656);
    xsi_vlogvar_assign_value(t4, t9, 0, 0, 32);

LAB66:
LAB41:    goto LAB15;

LAB9:    xsi_set_current_line(25, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 1152U);
    t7 = *((char **)t4);
    t4 = (t0 + 1060U);
    t8 = *((char **)t4);
    memset(t39, 0, 8);
    t4 = (t39 + 4);
    t10 = (t8 + 4);
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 28);
    *((unsigned int *)t39) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 >> 28);
    *((unsigned int *)t4) = t15;
    t16 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t16 & 15U);
    t17 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t17 & 15U);
    xsi_vlogtype_concat(t25, 4, 4, 1U, t39, 4);
    xsi_vlogtype_concat(t9, 32, 32, 3U, t25, 4, t7, 26, t3, 2);
    t11 = (t0 + 1656);
    xsi_vlogvar_assign_value(t11, t9, 0, 0, 32);
    goto LAB15;

LAB11:    xsi_set_current_line(26, ng0);
    t3 = (t0 + 1336U);
    t4 = *((char **)t3);
    t3 = (t0 + 1656);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB15;

LAB19:    t24 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t25) = 1;
    goto LAB24;

LAB23:    t32 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB24;

LAB25:    t37 = (t0 + 692U);
    t38 = *((char **)t37);
    t37 = ((char*)((ng2)));
    memset(t39, 0, 8);
    t40 = (t38 + 4);
    t41 = (t37 + 4);
    t42 = *((unsigned int *)t38);
    t43 = *((unsigned int *)t37);
    t44 = (t42 ^ t43);
    t45 = *((unsigned int *)t40);
    t46 = *((unsigned int *)t41);
    t47 = (t45 ^ t46);
    t48 = (t44 | t47);
    t49 = *((unsigned int *)t40);
    t50 = *((unsigned int *)t41);
    t51 = (t49 | t50);
    t52 = (~(t51));
    t53 = (t48 & t52);
    if (t53 != 0)
        goto LAB31;

LAB28:    if (t51 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t39) = 1;

LAB31:    memset(t55, 0, 8);
    t56 = (t39 + 4);
    t57 = *((unsigned int *)t56);
    t58 = (~(t57));
    t59 = *((unsigned int *)t39);
    t60 = (t59 & t58);
    t61 = (t60 & 1U);
    if (t61 != 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t56) != 0)
        goto LAB34;

LAB35:    t64 = *((unsigned int *)t25);
    t65 = *((unsigned int *)t55);
    t66 = (t64 & t65);
    *((unsigned int *)t63) = t66;
    t67 = (t25 + 4);
    t68 = (t55 + 4);
    t69 = (t63 + 4);
    t70 = *((unsigned int *)t67);
    t71 = *((unsigned int *)t68);
    t72 = (t70 | t71);
    *((unsigned int *)t69) = t72;
    t73 = *((unsigned int *)t69);
    t74 = (t73 != 0);
    if (t74 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB27;

LAB30:    t54 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t54) = 1;
    goto LAB31;

LAB32:    *((unsigned int *)t55) = 1;
    goto LAB35;

LAB34:    t62 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t62) = 1;
    goto LAB35;

LAB36:    t75 = *((unsigned int *)t63);
    t76 = *((unsigned int *)t69);
    *((unsigned int *)t63) = (t75 | t76);
    t77 = (t25 + 4);
    t78 = (t55 + 4);
    t79 = *((unsigned int *)t25);
    t80 = (~(t79));
    t81 = *((unsigned int *)t77);
    t82 = (~(t81));
    t83 = *((unsigned int *)t55);
    t84 = (~(t83));
    t85 = *((unsigned int *)t78);
    t86 = (~(t85));
    t87 = (t80 & t82);
    t88 = (t84 & t86);
    t89 = (~(t87));
    t90 = (~(t88));
    t91 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t91 & t89);
    t92 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t92 & t90);
    t93 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t93 & t89);
    t94 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t94 & t90);
    goto LAB38;

LAB39:    xsi_set_current_line(21, ng0);
    t101 = (t0 + 1060U);
    t102 = *((char **)t101);
    t101 = ((char*)((ng1)));
    memset(t103, 0, 8);
    xsi_vlog_unsigned_add(t103, 32, t102, 32, t101, 32);
    t104 = (t0 + 1244U);
    t105 = *((char **)t104);
    t104 = ((char*)((ng3)));
    memset(t106, 0, 8);
    xsi_vlog_unsigned_lshift(t106, 32, t105, 32, t104, 32);
    memset(t107, 0, 8);
    xsi_vlog_unsigned_add(t107, 32, t103, 32, t106, 32);
    t108 = (t0 + 1656);
    xsi_vlogvar_assign_value(t108, t107, 0, 0, 32);
    goto LAB41;

LAB44:    t8 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB45;

LAB46:    *((unsigned int *)t25) = 1;
    goto LAB49;

LAB48:    t11 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB49;

LAB50:    t26 = (t0 + 784U);
    t32 = *((char **)t26);
    t26 = ((char*)((ng2)));
    memset(t39, 0, 8);
    t33 = (t32 + 4);
    t37 = (t26 + 4);
    t42 = *((unsigned int *)t32);
    t43 = *((unsigned int *)t26);
    t44 = (t42 ^ t43);
    t45 = *((unsigned int *)t33);
    t46 = *((unsigned int *)t37);
    t47 = (t45 ^ t46);
    t48 = (t44 | t47);
    t49 = *((unsigned int *)t33);
    t50 = *((unsigned int *)t37);
    t51 = (t49 | t50);
    t52 = (~(t51));
    t53 = (t48 & t52);
    if (t53 != 0)
        goto LAB56;

LAB53:    if (t51 != 0)
        goto LAB55;

LAB54:    *((unsigned int *)t39) = 1;

LAB56:    memset(t55, 0, 8);
    t40 = (t39 + 4);
    t57 = *((unsigned int *)t40);
    t58 = (~(t57));
    t59 = *((unsigned int *)t39);
    t60 = (t59 & t58);
    t61 = (t60 & 1U);
    if (t61 != 0)
        goto LAB57;

LAB58:    if (*((unsigned int *)t40) != 0)
        goto LAB59;

LAB60:    t64 = *((unsigned int *)t25);
    t65 = *((unsigned int *)t55);
    t66 = (t64 & t65);
    *((unsigned int *)t63) = t66;
    t54 = (t25 + 4);
    t56 = (t55 + 4);
    t62 = (t63 + 4);
    t70 = *((unsigned int *)t54);
    t71 = *((unsigned int *)t56);
    t72 = (t70 | t71);
    *((unsigned int *)t62) = t72;
    t73 = *((unsigned int *)t62);
    t74 = (t73 != 0);
    if (t74 == 1)
        goto LAB61;

LAB62:
LAB63:    goto LAB52;

LAB55:    t38 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB56;

LAB57:    *((unsigned int *)t55) = 1;
    goto LAB60;

LAB59:    t41 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t41) = 1;
    goto LAB60;

LAB61:    t75 = *((unsigned int *)t63);
    t76 = *((unsigned int *)t62);
    *((unsigned int *)t63) = (t75 | t76);
    t67 = (t25 + 4);
    t68 = (t55 + 4);
    t79 = *((unsigned int *)t25);
    t80 = (~(t79));
    t81 = *((unsigned int *)t67);
    t82 = (~(t81));
    t83 = *((unsigned int *)t55);
    t84 = (~(t83));
    t85 = *((unsigned int *)t68);
    t86 = (~(t85));
    t6 = (t80 & t82);
    t87 = (t84 & t86);
    t89 = (~(t6));
    t90 = (~(t87));
    t91 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t91 & t89);
    t92 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t92 & t90);
    t93 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t93 & t89);
    t94 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t94 & t90);
    goto LAB63;

LAB64:    xsi_set_current_line(22, ng0);
    t77 = (t0 + 1060U);
    t78 = *((char **)t77);
    t77 = ((char*)((ng1)));
    memset(t103, 0, 8);
    xsi_vlog_unsigned_add(t103, 32, t78, 32, t77, 32);
    t95 = (t0 + 1244U);
    t101 = *((char **)t95);
    t95 = ((char*)((ng3)));
    memset(t106, 0, 8);
    xsi_vlog_unsigned_lshift(t106, 32, t101, 32, t95, 32);
    memset(t107, 0, 8);
    xsi_vlog_unsigned_add(t107, 32, t103, 32, t106, 32);
    t102 = (t0 + 1656);
    xsi_vlogvar_assign_value(t102, t107, 0, 0, 32);
    goto LAB66;

}


extern void work_m_00000000002978904756_0757879789_init()
{
	static char *pe[] = {(void *)Cont_16_0,(void *)Always_18_1};
	xsi_register_didat("work_m_00000000002978904756_0757879789", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000002978904756_0757879789.didat");
	xsi_register_executes(pe);
}
