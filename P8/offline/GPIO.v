`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Create Date:    22:29:32 12/06/2023 
//////////////////////////////////////////////////////////////////////////////////

module GPIO (
    // dip switch
    input [7:0] dip_switch0,
    input [7:0] dip_switch1,
    input [7:0] dip_switch2,
    input [7:0] dip_switch3,
    input [7:0] dip_switch4,
    input [7:0] dip_switch5,
    input [7:0] dip_switch6,
    input [7:0] dip_switch7,
    // key
    input [7:0] user_key,
    // led
    output [31:0] led_light
);
    wire sel = ^user_key;
    assign led_light = sel ? {dip_switch3,dip_switch2,dip_switch1,dip_switch0} : 
                             {dip_switch7,dip_switch6,dip_switch5,dip_switch4};
endmodule

