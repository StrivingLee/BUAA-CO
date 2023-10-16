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
static const char *ng0 = "D:/Xilinx/Project/P1exercise/Q5/expr.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {57, 0};
static int ng3[] = {48, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static int ng6[] = {42, 0};
static int ng7[] = {43, 0};
static unsigned int ng8[] = {3U, 0U};
static int ng9[] = {58, 0};
static int ng10[] = {47, 0};
static int ng11[] = {1, 0};
static int ng12[] = {0, 0};



static void Initial_35_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(35, ng0);

LAB2:    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 2, 0LL);

LAB1:    return;
}

static void Always_39_1(char *t0)
{
    char t14[8];
    char t18[8];
    char t27[8];
    char t31[8];
    char t39[8];
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
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    int t63;
    int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
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
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;

LAB0:    t1 = (t0 + 3640U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 4208);
    *((int *)t2) = 1;
    t3 = (t0 + 3672);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);

LAB5:    xsi_set_current_line(40, ng0);
    t4 = (t0 + 1752U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(42, ng0);

LAB9:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2472);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t13 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB19:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(41, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(44, ng0);

LAB20:    xsi_set_current_line(45, ng0);
    t11 = (t0 + 1912U);
    t12 = *((char **)t11);
    t11 = ((char*)((ng2)));
    memset(t14, 0, 8);
    t15 = (t12 + 4);
    if (*((unsigned int *)t15) != 0)
        goto LAB22;

LAB21:    t16 = (t11 + 4);
    if (*((unsigned int *)t16) != 0)
        goto LAB22;

LAB25:    if (*((unsigned int *)t12) > *((unsigned int *)t11))
        goto LAB23;

LAB24:    memset(t18, 0, 8);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t7 = (~(t6));
    t8 = *((unsigned int *)t14);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t19) != 0)
        goto LAB28;

LAB29:    t21 = (t18 + 4);
    t22 = *((unsigned int *)t18);
    t23 = *((unsigned int *)t21);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB30;

LAB31:    memcpy(t39, t18, 8);

LAB32:    t71 = (t39 + 4);
    t72 = *((unsigned int *)t71);
    t73 = (~(t72));
    t74 = *((unsigned int *)t39);
    t75 = (t74 & t73);
    t76 = (t75 != 0);
    if (t76 > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB47:    goto LAB19;

LAB13:    xsi_set_current_line(50, ng0);

LAB48:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1912U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng6)));
    memset(t14, 0, 8);
    t11 = (t5 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t3);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t22 = (t9 ^ t10);
    t23 = (t8 | t22);
    t24 = *((unsigned int *)t11);
    t33 = *((unsigned int *)t12);
    t34 = (t24 | t33);
    t35 = (~(t34));
    t36 = (t23 & t35);
    if (t36 != 0)
        goto LAB52;

LAB49:    if (t34 != 0)
        goto LAB51;

LAB50:    *((unsigned int *)t14) = 1;

LAB52:    memset(t18, 0, 8);
    t16 = (t14 + 4);
    t37 = *((unsigned int *)t16);
    t40 = (~(t37));
    t41 = *((unsigned int *)t14);
    t42 = (t41 & t40);
    t46 = (t42 & 1U);
    if (t46 != 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t16) != 0)
        goto LAB55;

LAB56:    t19 = (t18 + 4);
    t47 = *((unsigned int *)t18);
    t48 = (!(t47));
    t49 = *((unsigned int *)t19);
    t50 = (t48 || t49);
    if (t50 > 0)
        goto LAB57;

LAB58:    memcpy(t39, t18, 8);

LAB59:    t53 = (t39 + 4);
    t95 = *((unsigned int *)t53);
    t96 = (~(t95));
    t97 = *((unsigned int *)t39);
    t98 = (t97 & t96);
    t99 = (t98 != 0);
    if (t99 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB73:    goto LAB19;

LAB15:    xsi_set_current_line(56, ng0);

LAB74:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 1912U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng9)));
    memset(t14, 0, 8);
    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB76;

LAB75:    t12 = (t3 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB76;

LAB79:    if (*((unsigned int *)t5) < *((unsigned int *)t3))
        goto LAB77;

LAB78:    memset(t18, 0, 8);
    t16 = (t14 + 4);
    t6 = *((unsigned int *)t16);
    t7 = (~(t6));
    t8 = *((unsigned int *)t14);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t16) != 0)
        goto LAB82;

LAB83:    t19 = (t18 + 4);
    t22 = *((unsigned int *)t18);
    t23 = *((unsigned int *)t19);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB84;

LAB85:    memcpy(t39, t18, 8);

LAB86:    t53 = (t39 + 4);
    t72 = *((unsigned int *)t53);
    t73 = (~(t72));
    t74 = *((unsigned int *)t39);
    t75 = (t74 & t73);
    t76 = (t75 != 0);
    if (t76 > 0)
        goto LAB99;

LAB100:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB101:    goto LAB19;

LAB22:    t17 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB24;

LAB23:    *((unsigned int *)t14) = 1;
    goto LAB24;

LAB26:    *((unsigned int *)t18) = 1;
    goto LAB29;

LAB28:    t20 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB29;

LAB30:    t25 = (t0 + 1912U);
    t26 = *((char **)t25);
    t25 = ((char*)((ng3)));
    memset(t27, 0, 8);
    t28 = (t26 + 4);
    if (*((unsigned int *)t28) != 0)
        goto LAB34;

LAB33:    t29 = (t25 + 4);
    if (*((unsigned int *)t29) != 0)
        goto LAB34;

LAB37:    if (*((unsigned int *)t26) < *((unsigned int *)t25))
        goto LAB35;

LAB36:    memset(t31, 0, 8);
    t32 = (t27 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t27);
    t36 = (t35 & t34);
    t37 = (t36 & 1U);
    if (t37 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t32) != 0)
        goto LAB40;

LAB41:    t40 = *((unsigned int *)t18);
    t41 = *((unsigned int *)t31);
    t42 = (t40 & t41);
    *((unsigned int *)t39) = t42;
    t43 = (t18 + 4);
    t44 = (t31 + 4);
    t45 = (t39 + 4);
    t46 = *((unsigned int *)t43);
    t47 = *((unsigned int *)t44);
    t48 = (t46 | t47);
    *((unsigned int *)t45) = t48;
    t49 = *((unsigned int *)t45);
    t50 = (t49 != 0);
    if (t50 == 1)
        goto LAB42;

LAB43:
LAB44:    goto LAB32;

LAB34:    t30 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB36;

LAB35:    *((unsigned int *)t27) = 1;
    goto LAB36;

LAB38:    *((unsigned int *)t31) = 1;
    goto LAB41;

LAB40:    t38 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB41;

LAB42:    t51 = *((unsigned int *)t39);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t39) = (t51 | t52);
    t53 = (t18 + 4);
    t54 = (t31 + 4);
    t55 = *((unsigned int *)t18);
    t56 = (~(t55));
    t57 = *((unsigned int *)t53);
    t58 = (~(t57));
    t59 = *((unsigned int *)t31);
    t60 = (~(t59));
    t61 = *((unsigned int *)t54);
    t62 = (~(t61));
    t63 = (t56 & t58);
    t64 = (t60 & t62);
    t65 = (~(t63));
    t66 = (~(t64));
    t67 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t67 & t65);
    t68 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t68 & t66);
    t69 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t69 & t65);
    t70 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t70 & t66);
    goto LAB44;

LAB45:    xsi_set_current_line(46, ng0);
    t77 = ((char*)((ng4)));
    t78 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t78, t77, 0, 0, 2, 0LL);
    goto LAB47;

LAB51:    t15 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB52;

LAB53:    *((unsigned int *)t18) = 1;
    goto LAB56;

LAB55:    t17 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB56;

LAB57:    t20 = (t0 + 1912U);
    t21 = *((char **)t20);
    t20 = ((char*)((ng7)));
    memset(t27, 0, 8);
    t25 = (t21 + 4);
    t26 = (t20 + 4);
    t51 = *((unsigned int *)t21);
    t52 = *((unsigned int *)t20);
    t55 = (t51 ^ t52);
    t56 = *((unsigned int *)t25);
    t57 = *((unsigned int *)t26);
    t58 = (t56 ^ t57);
    t59 = (t55 | t58);
    t60 = *((unsigned int *)t25);
    t61 = *((unsigned int *)t26);
    t62 = (t60 | t61);
    t65 = (~(t62));
    t66 = (t59 & t65);
    if (t66 != 0)
        goto LAB63;

LAB60:    if (t62 != 0)
        goto LAB62;

LAB61:    *((unsigned int *)t27) = 1;

LAB63:    memset(t31, 0, 8);
    t29 = (t27 + 4);
    t67 = *((unsigned int *)t29);
    t68 = (~(t67));
    t69 = *((unsigned int *)t27);
    t70 = (t69 & t68);
    t72 = (t70 & 1U);
    if (t72 != 0)
        goto LAB64;

LAB65:    if (*((unsigned int *)t29) != 0)
        goto LAB66;

LAB67:    t73 = *((unsigned int *)t18);
    t74 = *((unsigned int *)t31);
    t75 = (t73 | t74);
    *((unsigned int *)t39) = t75;
    t32 = (t18 + 4);
    t38 = (t31 + 4);
    t43 = (t39 + 4);
    t76 = *((unsigned int *)t32);
    t79 = *((unsigned int *)t38);
    t80 = (t76 | t79);
    *((unsigned int *)t43) = t80;
    t81 = *((unsigned int *)t43);
    t82 = (t81 != 0);
    if (t82 == 1)
        goto LAB68;

LAB69:
LAB70:    goto LAB59;

LAB62:    t28 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB63;

LAB64:    *((unsigned int *)t31) = 1;
    goto LAB67;

LAB66:    t30 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB67;

LAB68:    t83 = *((unsigned int *)t39);
    t84 = *((unsigned int *)t43);
    *((unsigned int *)t39) = (t83 | t84);
    t44 = (t18 + 4);
    t45 = (t31 + 4);
    t85 = *((unsigned int *)t44);
    t86 = (~(t85));
    t87 = *((unsigned int *)t18);
    t63 = (t87 & t86);
    t88 = *((unsigned int *)t45);
    t89 = (~(t88));
    t90 = *((unsigned int *)t31);
    t64 = (t90 & t89);
    t91 = (~(t63));
    t92 = (~(t64));
    t93 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t93 & t91);
    t94 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t94 & t92);
    goto LAB70;

LAB71:    xsi_set_current_line(52, ng0);
    t54 = ((char*)((ng8)));
    t71 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t71, t54, 0, 0, 2, 0LL);
    goto LAB73;

LAB76:    t15 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB78;

LAB77:    *((unsigned int *)t14) = 1;
    goto LAB78;

LAB80:    *((unsigned int *)t18) = 1;
    goto LAB83;

LAB82:    t17 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB83;

LAB84:    t20 = (t0 + 1912U);
    t21 = *((char **)t20);
    t20 = ((char*)((ng10)));
    memset(t27, 0, 8);
    t25 = (t21 + 4);
    if (*((unsigned int *)t25) != 0)
        goto LAB88;

LAB87:    t26 = (t20 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB88;

LAB91:    if (*((unsigned int *)t21) > *((unsigned int *)t20))
        goto LAB89;

LAB90:    memset(t31, 0, 8);
    t29 = (t27 + 4);
    t33 = *((unsigned int *)t29);
    t34 = (~(t33));
    t35 = *((unsigned int *)t27);
    t36 = (t35 & t34);
    t37 = (t36 & 1U);
    if (t37 != 0)
        goto LAB92;

LAB93:    if (*((unsigned int *)t29) != 0)
        goto LAB94;

LAB95:    t40 = *((unsigned int *)t18);
    t41 = *((unsigned int *)t31);
    t42 = (t40 & t41);
    *((unsigned int *)t39) = t42;
    t32 = (t18 + 4);
    t38 = (t31 + 4);
    t43 = (t39 + 4);
    t46 = *((unsigned int *)t32);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    *((unsigned int *)t43) = t48;
    t49 = *((unsigned int *)t43);
    t50 = (t49 != 0);
    if (t50 == 1)
        goto LAB96;

LAB97:
LAB98:    goto LAB86;

LAB88:    t28 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB90;

LAB89:    *((unsigned int *)t27) = 1;
    goto LAB90;

LAB92:    *((unsigned int *)t31) = 1;
    goto LAB95;

LAB94:    t30 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB95;

LAB96:    t51 = *((unsigned int *)t39);
    t52 = *((unsigned int *)t43);
    *((unsigned int *)t39) = (t51 | t52);
    t44 = (t18 + 4);
    t45 = (t31 + 4);
    t55 = *((unsigned int *)t18);
    t56 = (~(t55));
    t57 = *((unsigned int *)t44);
    t58 = (~(t57));
    t59 = *((unsigned int *)t31);
    t60 = (~(t59));
    t61 = *((unsigned int *)t45);
    t62 = (~(t61));
    t63 = (t56 & t58);
    t64 = (t60 & t62);
    t65 = (~(t63));
    t66 = (~(t64));
    t67 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t67 & t65);
    t68 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t68 & t66);
    t69 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t69 & t65);
    t70 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t70 & t66);
    goto LAB98;

LAB99:    xsi_set_current_line(58, ng0);
    t54 = ((char*)((ng5)));
    t71 = (t0 + 2472);
    xsi_vlogvar_wait_assign_value(t71, t54, 0, 0, 2, 0LL);
    goto LAB101;

}

static void Cont_68_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char *t1;
    char *t2;
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
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;

LAB0:    t1 = (t0 + 3888U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 2472);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng5)));
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
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t41 = (t0 + 4304);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t45, 0, 8);
    t46 = 1U;
    t47 = t46;
    t48 = (t3 + 4);
    t49 = *((unsigned int *)t3);
    t46 = (t46 & t49);
    t50 = *((unsigned int *)t48);
    t47 = (t47 & t50);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 | t46);
    t53 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t53 | t47);
    xsi_driver_vfirst_trans(t41, 0, 0);
    t54 = (t0 + 4224);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng11)));
    goto LAB13;

LAB14:    t40 = ((char*)((ng12)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t35, 32, t40, 32);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

}


extern void work_m_00000000001683708566_1212989544_init()
{
	static char *pe[] = {(void *)Initial_35_0,(void *)Always_39_1,(void *)Cont_68_2};
	xsi_register_didat("work_m_00000000001683708566_1212989544", "isim/expr_tb_isim_beh.exe.sim/work/m_00000000001683708566_1212989544.didat");
	xsi_register_executes(pe);
}
