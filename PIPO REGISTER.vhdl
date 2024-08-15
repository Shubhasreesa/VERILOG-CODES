`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.07.2024 12:27:10
// Design Name: 
// Module Name: REGI_PIPO
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

module REGI_PIPO(
    input [3:0] D,
    input [1:0] sel,
    input clk,
    input rst,
    input XL,
    input XR,
    output [3:0] Q
);
    wire [3:0] S; // Intermediate signals from the multiplexers

    // Instantiate 4-to-1 multiplexers with named port connections
    MUX_41 m0(
        .I0(Q[0]), 
        .I1(XL), 
        .I2(Q[1]), 
        .I3(D[0]), 
        .S0(sel[0]), 
        .S1(sel[1]), 
        .Y(S[0])
    );

    MUX_41 m1(
        .I0(Q[1]), 
        .I1(Q[0]), 
        .I2(Q[2]), 
        .I3(D[1]), 
        .S0(sel[0]), 
        .S1(sel[1]), 
        .Y(S[1])
    );

    MUX_41 m2(
        .I0(Q[2]), 
        .I1(Q[1]), 
        .I2(Q[3]), 
        .I3(D[2]), 
        .S0(sel[0]), 
        .S1(sel[1]), 
        .Y(S[2])
    );

    MUX_41 m3(
        .I0(Q[3]), 
        .I1(Q[2]), 
        .I2(XR), 
        .I3(D[3]), 
        .S0(sel[0]), 
        .S1(sel[1]), 
        .Y(S[3])
    );

    // Instantiate D flip-flops with named port connections
    d_ff D0(
        .d(S[0]), 
        .clk(clk), 
        .reset(rst), 
        .q(Q[0])
    );

    d_ff D1(
        .d(S[1]), 
        .clk(clk), 
        .reset(rst), 
        .q(Q[1])
    );

    d_ff D2(
        .d(S[2]), 
        .clk(clk), 
        .reset(rst), 
        .q(Q[2])
    );

    d_ff D3(
        .d(S[3]), 
        .clk(clk), 
        .reset(rst), 
        .q(Q[3])
    );

endmodule
