`timescale 1ns / 1ps
`include<rom.h>
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/17 14:44:16
// Design Name: 
// Module Name: rom
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


module rom(
    input   wire                clk,
    input   wire                reset,
    input   wire                cs_,
    input   wire                as_,
    input   wire[`RomAddrBus]   addr,
    output  wire[`WordDataBus]  rd_data,
    output  reg                 rdy_
    );
    
    blk_mem_gen_0 x_s3e_sprom_01(
        .clka   (clk),
        .addra  (addr),
        .douta  (rd_data)
    );
    
    always @(posedge clk or `RESET_EDGE reset) begin
        if (reset == `RESET_ENABLE) begin
            rdy_ <= #1 `DISABLE_;
        end else begin
            if ((cs_ == `ENABLE_) && (as_ == `ENABLE_)) begin
                rdy_ <= #1 `ENABLE_;
            end else begin
                rdy_ <= #1  `DISABLE_;
            end
        end
    end
endmodule
