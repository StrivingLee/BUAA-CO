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
    work_m_00000000002505355366_0060011589_init();
    work_m_00000000001729342331_3371872028_init();
    work_m_00000000001474613192_2593248389_init();
    work_m_00000000003675876420_2663932823_init();
    work_m_00000000003395548654_2484743739_init();
    work_m_00000000002194892045_1579609468_init();
    work_m_00000000000489317752_0677547683_init();
    work_m_00000000001256730638_4245161272_init();
    work_m_00000000002849979709_1071390700_init();
    work_m_00000000000917243818_2160987429_init();
    work_m_00000000001152278658_1313061432_init();
    work_m_00000000003480809801_3877310806_init();
    work_m_00000000001292392995_1131260308_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001292392995_1131260308");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
