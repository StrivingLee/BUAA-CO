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
    work_m_00000000003567752708_3224323566_init();
    work_m_00000000000639115972_4235459488_init();
    work_m_00000000001080369677_4144471541_init();
    work_m_00000000001860451302_1579609468_init();
    work_m_00000000004281343338_0757879789_init();
    work_m_00000000003090579431_1621229167_init();
    work_m_00000000001941834676_1785967555_init();
    work_m_00000000003209832553_3239301648_init();
    work_m_00000000004213640658_0886308060_init();
    work_m_00000000002938810841_4049836497_init();
    work_m_00000000000461022950_2924402094_init();
    work_m_00000000000440322112_3677558514_init();
    work_m_00000000002074787158_3877310806_init();
    work_m_00000000002047498008_0258635663_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002047498008_0258635663");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
