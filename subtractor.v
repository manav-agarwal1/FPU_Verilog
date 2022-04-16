`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Organisation: BITS Pilani KK Birla GOA CAMPUS 
// Author: Manav Agarwal 
// Role: Student
// Create Date: 27.02.2022 20:23:21
// Design Name: 
// Module Name: subtractor
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


module subtractor(
input [7:0] A,
input [7:0] B,
output [7:0] res,
output sign);

assign {sign, res} = A-B;
endmodule
