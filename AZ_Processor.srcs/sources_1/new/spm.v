`timescale 1ns / 1ps
`include<spm.h>
`include<stddef.h>
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/22 15:28:54
// Design Name: 
// Module Name: spm
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


module spm(
    input   wire                clk,
    input   wire[`SpmAddrBus]   if_spm_addr,
    input   wire                if_spm_as_,
    input   wire                if_spm_rw,
    input   wire[`WordDataBus]  if_spm_wr_data,
    input   wire[`WordDataBus]  if_spm_rd_data,
    input   wire[`SpmAddrBus]   mem_spm_addr,
    input   wire                mem_spm_as_,
    input   wire                mem_spm_rw,
    input   wire[`WordDataBus]  mem_spm_wr_data,
    input   wire[`WordDataBus]  mem_spm_rd_data
    );
    reg wea;
    reg web;
    
    always @(*) begin
        if ((if_spm_as_ == `ENABLE) && (if_spm_rw == `WRITE)) begin
            wea = `MEM_ENABLE;
        end else begin
            wea = `MEM_DISABLE;
        end
        
        if ((mem_spm_as_ == `ENABLE) && (mem_spm_rw == `WRITE)) begin
            wea = `MEM_ENABLE;
        end else begin
            wea = `MEM_DISABLE;
        end
    end
    
    blk_mem_gen_1 x_s3e_dpram (
        .clka (clk),
        .addra (if_spm_addr),
        .dina (if_spm_wr_data),
        .wea (wea),
        .douta (if_spm_rd_data),
        
        .clkb (clk),
        .addrb (mem_spm_addr),
        .dinb (mem_spm_wr_data),
        .web (web),
        .doutb (mem_spm_rd_data)
    );
endmodule
