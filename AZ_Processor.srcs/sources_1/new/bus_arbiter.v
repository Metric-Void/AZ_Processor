`timescale 1ns / 1ps
`include<stddef.h>
`include<global_config.h>
`include<nettype.h>
`include<bus.h>

/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/16 17:42:50
// Design Name: 
// Module Name: bus_arbiter
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


module bus_arbiter(
    input wire clk,
    input wire reset,
    input wire m0_req_,
    input wire m1_req_,
    input wire m2_req_,
    input wire m3_req_,
    output reg m0_grnt_,
    output reg m1_grnt_,
    output reg m2_grnt_,
    output reg m3_grnt_
    );
    
    reg [1:0] owner;
    
    always @(*) begin
        m0_grnt_ = `DISABLE_;
        m1_grnt_ = `DISABLE_;
        m2_grnt_ = `DISABLE_;
        m3_grnt_ = `DISABLE_;
        
        case(owner)
            `BUS_OWNER_MASTER_0: m0_grnt_ = `ENABLE;
            `BUS_OWNER_MASTER_1: m1_grnt_ = `ENABLE;
            `BUS_OWNER_MASTER_2: m2_grnt_ = `ENABLE;
            `BUS_OWNER_MASTER_3: m3_grnt_ = `ENABLE;
        endcase
    end
    
    always @(posedge clk or `RESET_EDGE reset) begin
        if (reset==`RESET_ENABLE) begin
            owner <= #1 `BUS_OWNER_MASTER_0;
        end else begin
            case (owner)
                `BUS_OWNER_MASTER_0: begin
                    if (m0_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_OWNER_MASTER_0;
                    end else if (m1_req_ == `ENABLE) begin
                        owner <= #1 `BUS_OWNER_MASTER_1;
                    end else if (m2_req_ == `ENABLE) begin
                        owner <= #1 `BUS_OWNER_MASTER_2;
                    end else begin
                        owner <= #1 `BUS_OWNER_MASTER_3;
                    end
                end
                `BUS_OWNER_MASTER_1: begin
                    if (m1_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_OWNER_MASTER_1;
                    end else if (m0_req_ == `ENABLE) begin
                        owner <= #1 `BUS_OWNER_MASTER_0;
                    end else if (m2_req_ == `ENABLE) begin
                        owner <= #1 `BUS_OWNER_MASTER_2;
                    end else begin
                        owner <= #1 `BUS_OWNER_MASTER_3;
                    end
                 end
                 `BUS_OWNER_MASTER_2: begin
                       if (m2_req_ == `ENABLE_) begin
                           owner <= #1 `BUS_OWNER_MASTER_2;
                       end else if (m1_req_ == `ENABLE) begin
                           owner <= #1 `BUS_OWNER_MASTER_1;
                       end else if (m0_req_ == `ENABLE) begin
                           owner <= #1 `BUS_OWNER_MASTER_0;
                       end else begin
                           owner <= #1 `BUS_OWNER_MASTER_3;
                   end
                end
                 `BUS_OWNER_MASTER_3: begin
                      if (m3_req_ == `ENABLE_) begin
                          owner <= #1 `BUS_OWNER_MASTER_3;
                      end else if (m1_req_ == `ENABLE) begin
                          owner <= #1 `BUS_OWNER_MASTER_1;
                      end else if (m0_req_ == `ENABLE) begin
                          owner <= #1 `BUS_OWNER_MASTER_0;
                      end else begin
                          owner <= #1 `BUS_OWNER_MASTER_2;
                  end
               end
            endcase
        end
    end
endmodule