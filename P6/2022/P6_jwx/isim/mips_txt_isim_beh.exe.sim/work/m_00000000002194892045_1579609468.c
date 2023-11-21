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
static const char *ng0 = "D:/Programing/ComputerOrganization/P6/P6_jwx/CMP.v";
static int ng1[] = {31, 0};
static int ng2[] = {0, 0};
static int ng3[] = {1, 0};



static void Always_11_0(char *t0)
{
    char t6[8];
    char t15[8];
    char t22[8];
    char t38[8];
    char t52[8];
    char t59[8];
    char t75[8];
    char t83[8];
    char t121[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    char *t24;
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
    unsigned int t36;
    char *t37;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    char *t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    char *t97;
    char *t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    int t107;
    int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    char *t122;
    char *t123;

LAB0:    t1 = (t0 + 1904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(11, ng0);
    t2 = (t0 + 2100);
    *((int *)t2) = 1;
    t3 = (t0 + 1932);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(11, ng0);

LAB5:    xsi_set_current_line(12, ng0);
    xsi_set_current_line(12, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1012);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);

LAB6:    t2 = (t0 + 1012);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_greatereq(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t5);
    t25 = (t11 ^ t12);
    t26 = (t10 | t25);
    t27 = *((unsigned int *)t4);
    t28 = *((unsigned int *)t5);
    t29 = (t27 | t28);
    t30 = (~(t29));
    t31 = (t26 & t30);
    if (t31 != 0)
        goto LAB47;

LAB44:    if (t29 != 0)
        goto LAB46;

LAB45:    *((unsigned int *)t6) = 1;

LAB47:    memset(t15, 0, 8);
    t13 = (t6 + 4);
    t32 = *((unsigned int *)t13);
    t33 = (~(t32));
    t34 = *((unsigned int *)t6);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t13) != 0)
        goto LAB50;

LAB51:    t16 = (t15 + 4);
    t40 = *((unsigned int *)t15);
    t41 = (!(t40));
    t42 = *((unsigned int *)t16);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB52;

LAB53:    memcpy(t52, t15, 8);

LAB54:    t51 = (t52 + 4);
    t105 = *((unsigned int *)t51);
    t106 = (~(t105));
    t109 = *((unsigned int *)t52);
    t110 = (t109 & t106);
    t111 = (t110 != 0);
    if (t111 > 0)
        goto LAB66;

LAB67:
LAB68:    goto LAB2;

LAB7:    xsi_set_current_line(12, ng0);

LAB9:    xsi_set_current_line(13, ng0);
    t13 = (t0 + 600U);
    t14 = *((char **)t13);
    t13 = (t0 + 576U);
    t16 = (t13 + 44U);
    t17 = *((char **)t16);
    t18 = (t0 + 1012);
    t19 = (t18 + 36U);
    t20 = *((char **)t19);
    xsi_vlog_generic_get_index_select_value(t15, 32, t14, t17, 2, t20, 32, 1);
    t21 = ((char*)((ng3)));
    memset(t22, 0, 8);
    t23 = (t15 + 4);
    t24 = (t21 + 4);
    t25 = *((unsigned int *)t15);
    t26 = *((unsigned int *)t21);
    t27 = (t25 ^ t26);
    t28 = *((unsigned int *)t23);
    t29 = *((unsigned int *)t24);
    t30 = (t28 ^ t29);
    t31 = (t27 | t30);
    t32 = *((unsigned int *)t23);
    t33 = *((unsigned int *)t24);
    t34 = (t32 | t33);
    t35 = (~(t34));
    t36 = (t31 & t35);
    if (t36 != 0)
        goto LAB13;

LAB10:    if (t34 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t22) = 1;

LAB13:    memset(t38, 0, 8);
    t39 = (t22 + 4);
    t40 = *((unsigned int *)t39);
    t41 = (~(t40));
    t42 = *((unsigned int *)t22);
    t43 = (t42 & t41);
    t44 = (t43 & 1U);
    if (t44 != 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t39) != 0)
        goto LAB16;

LAB17:    t46 = (t38 + 4);
    t47 = *((unsigned int *)t38);
    t48 = *((unsigned int *)t46);
    t49 = (t47 || t48);
    if (t49 > 0)
        goto LAB18;

LAB19:    memcpy(t83, t38, 8);

LAB20:    t115 = (t83 + 4);
    t116 = *((unsigned int *)t115);
    t117 = (~(t116));
    t118 = *((unsigned int *)t83);
    t119 = (t118 & t117);
    t120 = (t119 != 0);
    if (t120 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = (t0 + 576U);
    t4 = (t2 + 44U);
    t5 = *((char **)t4);
    t7 = (t0 + 1012);
    t13 = (t7 + 36U);
    t14 = *((char **)t13);
    xsi_vlog_generic_get_index_select_value(t6, 1, t3, t5, 2, t14, 32, 1);
    t16 = (t0 + 692U);
    t17 = *((char **)t16);
    t16 = (t0 + 668U);
    t18 = (t16 + 44U);
    t19 = *((char **)t18);
    t20 = (t0 + 1012);
    t21 = (t20 + 36U);
    t23 = *((char **)t21);
    xsi_vlog_generic_get_index_select_value(t15, 1, t17, t19, 2, t23, 32, 1);
    memset(t22, 0, 8);
    t24 = (t6 + 4);
    t37 = (t15 + 4);
    t8 = *((unsigned int *)t6);
    t9 = *((unsigned int *)t15);
    t10 = (t8 ^ t9);
    t11 = *((unsigned int *)t24);
    t12 = *((unsigned int *)t37);
    t25 = (t11 ^ t12);
    t26 = (t10 | t25);
    t27 = *((unsigned int *)t24);
    t28 = *((unsigned int *)t37);
    t29 = (t27 | t28);
    t30 = (~(t29));
    t31 = (t26 & t30);
    if (t31 != 0)
        goto LAB37;

LAB36:    if (t29 != 0)
        goto LAB38;

LAB39:    t45 = (t22 + 4);
    t32 = *((unsigned int *)t45);
    t33 = (~(t32));
    t34 = *((unsigned int *)t22);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB40;

LAB41:
LAB42:
LAB34:    xsi_set_current_line(12, ng0);
    t2 = (t0 + 1012);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_minus(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1012);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB6;

LAB12:    t37 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t37) = 1;
    goto LAB13;

LAB14:    *((unsigned int *)t38) = 1;
    goto LAB17;

LAB16:    t45 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB17;

LAB18:    t50 = (t0 + 692U);
    t51 = *((char **)t50);
    t50 = (t0 + 668U);
    t53 = (t50 + 44U);
    t54 = *((char **)t53);
    t55 = (t0 + 1012);
    t56 = (t55 + 36U);
    t57 = *((char **)t56);
    xsi_vlog_generic_get_index_select_value(t52, 32, t51, t54, 2, t57, 32, 1);
    t58 = ((char*)((ng3)));
    memset(t59, 0, 8);
    t60 = (t52 + 4);
    t61 = (t58 + 4);
    t62 = *((unsigned int *)t52);
    t63 = *((unsigned int *)t58);
    t64 = (t62 ^ t63);
    t65 = *((unsigned int *)t60);
    t66 = *((unsigned int *)t61);
    t67 = (t65 ^ t66);
    t68 = (t64 | t67);
    t69 = *((unsigned int *)t60);
    t70 = *((unsigned int *)t61);
    t71 = (t69 | t70);
    t72 = (~(t71));
    t73 = (t68 & t72);
    if (t73 != 0)
        goto LAB24;

LAB21:    if (t71 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t59) = 1;

LAB24:    memset(t75, 0, 8);
    t76 = (t59 + 4);
    t77 = *((unsigned int *)t76);
    t78 = (~(t77));
    t79 = *((unsigned int *)t59);
    t80 = (t79 & t78);
    t81 = (t80 & 1U);
    if (t81 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t76) != 0)
        goto LAB27;

LAB28:    t84 = *((unsigned int *)t38);
    t85 = *((unsigned int *)t75);
    t86 = (t84 & t85);
    *((unsigned int *)t83) = t86;
    t87 = (t38 + 4);
    t88 = (t75 + 4);
    t89 = (t83 + 4);
    t90 = *((unsigned int *)t87);
    t91 = *((unsigned int *)t88);
    t92 = (t90 | t91);
    *((unsigned int *)t89) = t92;
    t93 = *((unsigned int *)t89);
    t94 = (t93 != 0);
    if (t94 == 1)
        goto LAB29;

LAB30:
LAB31:    goto LAB20;

LAB23:    t74 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t74) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t75) = 1;
    goto LAB28;

LAB27:    t82 = (t75 + 4);
    *((unsigned int *)t75) = 1;
    *((unsigned int *)t82) = 1;
    goto LAB28;

LAB29:    t95 = *((unsigned int *)t83);
    t96 = *((unsigned int *)t89);
    *((unsigned int *)t83) = (t95 | t96);
    t97 = (t38 + 4);
    t98 = (t75 + 4);
    t99 = *((unsigned int *)t38);
    t100 = (~(t99));
    t101 = *((unsigned int *)t97);
    t102 = (~(t101));
    t103 = *((unsigned int *)t75);
    t104 = (~(t103));
    t105 = *((unsigned int *)t98);
    t106 = (~(t105));
    t107 = (t100 & t102);
    t108 = (t104 & t106);
    t109 = (~(t107));
    t110 = (~(t108));
    t111 = *((unsigned int *)t89);
    *((unsigned int *)t89) = (t111 & t109);
    t112 = *((unsigned int *)t89);
    *((unsigned int *)t89) = (t112 & t110);
    t113 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t113 & t109);
    t114 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t114 & t110);
    goto LAB31;

LAB32:    xsi_set_current_line(13, ng0);

LAB35:    xsi_set_current_line(14, ng0);
    t122 = ((char*)((ng3)));
    memset(t121, 0, 8);
    xsi_vlog_signed_unary_minus(t121, 32, t122, 32);
    t123 = (t0 + 1012);
    xsi_vlogvar_assign_value(t123, t121, 0, 0, 32);
    xsi_set_current_line(15, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 920);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB34;

LAB37:    *((unsigned int *)t22) = 1;
    goto LAB39;

LAB38:    t39 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(16, ng0);

LAB43:    xsi_set_current_line(17, ng0);
    t46 = ((char*)((ng2)));
    t50 = (t0 + 920);
    xsi_vlogvar_assign_value(t50, t46, 0, 0, 1);
    xsi_set_current_line(18, ng0);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_unary_minus(t6, 32, t2, 32);
    t3 = (t0 + 1012);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 32);
    goto LAB42;

LAB46:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB47;

LAB48:    *((unsigned int *)t15) = 1;
    goto LAB51;

LAB50:    t14 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB51;

LAB52:    t17 = (t0 + 692U);
    t18 = *((char **)t17);
    t17 = ((char*)((ng2)));
    memset(t22, 0, 8);
    t19 = (t18 + 4);
    t20 = (t17 + 4);
    t44 = *((unsigned int *)t18);
    t47 = *((unsigned int *)t17);
    t48 = (t44 ^ t47);
    t49 = *((unsigned int *)t19);
    t62 = *((unsigned int *)t20);
    t63 = (t49 ^ t62);
    t64 = (t48 | t63);
    t65 = *((unsigned int *)t19);
    t66 = *((unsigned int *)t20);
    t67 = (t65 | t66);
    t68 = (~(t67));
    t69 = (t64 & t68);
    if (t69 != 0)
        goto LAB58;

LAB55:    if (t67 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t22) = 1;

LAB58:    memset(t38, 0, 8);
    t23 = (t22 + 4);
    t70 = *((unsigned int *)t23);
    t71 = (~(t70));
    t72 = *((unsigned int *)t22);
    t73 = (t72 & t71);
    t77 = (t73 & 1U);
    if (t77 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t23) != 0)
        goto LAB61;

LAB62:    t78 = *((unsigned int *)t15);
    t79 = *((unsigned int *)t38);
    t80 = (t78 | t79);
    *((unsigned int *)t52) = t80;
    t37 = (t15 + 4);
    t39 = (t38 + 4);
    t45 = (t52 + 4);
    t81 = *((unsigned int *)t37);
    t84 = *((unsigned int *)t39);
    t85 = (t81 | t84);
    *((unsigned int *)t45) = t85;
    t86 = *((unsigned int *)t45);
    t90 = (t86 != 0);
    if (t90 == 1)
        goto LAB63;

LAB64:
LAB65:    goto LAB54;

LAB57:    t21 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB58;

LAB59:    *((unsigned int *)t38) = 1;
    goto LAB62;

LAB61:    t24 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB62;

LAB63:    t91 = *((unsigned int *)t52);
    t92 = *((unsigned int *)t45);
    *((unsigned int *)t52) = (t91 | t92);
    t46 = (t15 + 4);
    t50 = (t38 + 4);
    t93 = *((unsigned int *)t46);
    t94 = (~(t93));
    t95 = *((unsigned int *)t15);
    t107 = (t95 & t94);
    t96 = *((unsigned int *)t50);
    t99 = (~(t96));
    t100 = *((unsigned int *)t38);
    t108 = (t100 & t99);
    t101 = (~(t107));
    t102 = (~(t108));
    t103 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t103 & t101);
    t104 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t104 & t102);
    goto LAB65;

LAB66:    xsi_set_current_line(21, ng0);
    t53 = ((char*)((ng2)));
    t54 = (t0 + 920);
    xsi_vlogvar_assign_value(t54, t53, 0, 0, 1);
    goto LAB68;

}


extern void work_m_00000000002194892045_1579609468_init()
{
	static char *pe[] = {(void *)Always_11_0};
	xsi_register_didat("work_m_00000000002194892045_1579609468", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000002194892045_1579609468.didat");
	xsi_register_executes(pe);
}
