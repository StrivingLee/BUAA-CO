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
    work_m_00000000003710180207_3224323566_init();
    work_m_00000000003389303556_4144471541_init();
    work_m_00000000003090579431_1621229167_init();
    work_m_00000000000372264533_0886308060_init();
    work_m_00000000001941834676_1785967555_init();
    work_m_00000000000461022950_2924402094_init();
    work_m_00000000002978904756_0757879789_init();
    work_m_00000000003088431734_0617436522_init();
    work_m_00000000001044309988_1875370105_init();
    work_m_00000000001758691647_1265677582_init();
    work_m_00000000000021409437_3877310806_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000021409437_3877310806");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
