`timescale 1ns / 1ps
`include<stddef.h>
`include<cpu.h>
`include<isa.h>

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/22 14:16:09
// Design Name: 
// Module Name: gpr
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


module gpr(
    input   wire                    clk,
    input   wire                    reset,
    input   wire[`IsaRegAddrBus]    rd_addr_0,
    output  wire[`WordDataBus]      rd_data_0,
    input   wire[`IsaRegAddrBus]    rd_addr_1,
    output  wire[`WordDataBus]      rd_data_1,
    input   wire                    we_,
    input   wire[`WordDataBus]      wr_addr,
    input   wire[`WordDataBus]      wr_data
    );
    reg[`WordDataBus] gpr[`WordDataBus];
    integer i;
    
    assign rd_data_0 = ((we_ == `ENABLE_) && (wr_addr == rd_addr_0)) ? wr_data : gpr[rd_addr_0];
    assign rd_data_1 = ((we_ == `ENABLE_) && (wr_addr == rd_addr_1)) ? wr_data : gpr[rd_addr_1];
    
    always @(posedge clk or `RESET_EDGE reset) begin
        if (reset == `RESET_ENABLE) begin
            for (i=0; i<`REG_NUM; i = i+1) begin
                gpr[i]  <=  #1 `WORD_DATA_W'h0;
            end
        end else begin
            if (we_ == `ENABLE) begin
                gpr[wr_addr] <= #1 wr_data;
            end
        end
    end
endmodule
