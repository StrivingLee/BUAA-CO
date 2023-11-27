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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000001185610_3224323566_init();
    work_m_00000000001686228363_4235459488_init();
    work_m_00000000002221722723_4144471541_init();
    work_m_00000000000095680510_1579609468_init();
    work_m_00000000001800105195_0757879789_init();
    work_m_00000000003090579431_1621229167_init();
    work_m_00000000001941834676_1785967555_init();
    work_m_00000000003471256693_3239301648_init();
    work_m_00000000001169704630_4111503280_init();
    work_m_00000000002143028794_0886308060_init();
    work_m_00000000003400181342_4049836497_init();
    work_m_00000000000997777124_4140825114_init();
    work_m_00000000001683527503_2694143388_init();
    work_m_00000000001915976592_3975733304_init();
    work_m_00000000001993913734_3677558514_init();
    work_m_00000000002705323947_3856312063_init();
    work_m_00000000000481105186_0156190743_init();
    work_m_00000000000056312757_0053799672_init();
    work_m_00000000000975545770_3877310806_init();
    work_m_00000000002148573628_1131260308_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002148573628_1131260308");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
