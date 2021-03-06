`timescale 1ns / 1ps
`include<stddef.h>
`include<bus.h>
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/16 20:34:38
// Design Name: 
// Module Name: bus_addr_dec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bus_addr_dec(
    input   wire[`WordAddrBus]      s_addr,
    output  reg                     s0_cs_,
    output  reg                     s1_cs_,
    output  reg                     s2_cs_,
    output  reg                     s3_cs_,
    output  reg                     s4_cs_,
    output  reg                     s5_cs_,
    output  reg                     s6_cs_,
    output  reg                     s7_cs_
    );
    
    wire [`BusSlaveIndexBus] s_index = s_addr[`BusSlaveIndexLoc];
    
    always @(*) begin
        s0_cs_  =   `DISABLE_;
        s1_cs_  =   `DISABLE_;
        s2_cs_  =   `DISABLE_;
        s3_cs_  =   `DISABLE_;
        s4_cs_  =   `DISABLE_;
        s5_cs_  =   `DISABLE_;
        s6_cs_  =   `DISABLE_;
        s7_cs_  =   `DISABLE_;
        case (s_index)
            `BUS_SLAVE_0:s0_cs_ = `ENABLE_;
            `BUS_SLAVE_1:s1_cs_ = `ENABLE_;
            `BUS_SLAVE_2:s2_cs_ = `ENABLE_;
            `BUS_SLAVE_3:s3_cs_ = `ENABLE_;
            `BUS_SLAVE_4:s4_cs_ = `ENABLE_;
            `BUS_SLAVE_5:s5_cs_ = `ENABLE_;
            `BUS_SLAVE_6:s6_cs_ = `ENABLE_;
            `BUS_SLAVE_7:s7_cs_ = `ENABLE_;
        endcase
    end
    
endmodule
