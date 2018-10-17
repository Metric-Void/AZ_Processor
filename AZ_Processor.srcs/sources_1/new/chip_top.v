`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/16 21:47:20
// Design Name: 
// Module Name: chip_top
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


module chip_top(
    input   wire    clk,
    input   wire    reset
    );
    
    bus bus_01(
        .clk (clk),
        .reset (reset)
    );
    
    rom rom_01(
        .clk (clk),
        .reset (reset)
    );
    
endmodule
