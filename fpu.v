`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Organisation: BITS Pilani KK Birla GOA CAMPUS 
// Author: Manav Agarwal 
// Role: Student
// Create Date: 27.02.2022 20:23:21
// Design Name: 
// Module Name: fpu
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


module fpu(
input Clock,
input [31:0] Data1,
input [31:0] Data2,
input In_Data_Valid,
input op,
output [31:0] Data_Out,
output Out_Data_Valid
);
// create separate reg or wire for each subpart
//reg Data_Out_sign;
//reg [7:0] Data_Out_exp;
//reg [23:0] Data_Out_mant;

//reg [31:0] adder_Data1;
//reg [31:0] adder_Data2;
wire [31:0] adder_Data_Out;
wire adder_Data_Out_Valid;
//reg [31:0] mult_Data1;
//reg [31:0] mult_Data2;
wire [31:0] mult_Data_Out;
wire mult_Data_Out_Valid;
//reg [7:0] Data1_exp;
//reg [23:0] Data1_mant;
//reg [7:0] Data2_exp;
//reg [23:0] Data2_mant;
//always @(*)
//begin
//    Data1_exp = Data1[30:23];
//    Data2_exp = Data2[30:23];
//    Data1_mant = {1'b1,Data1[22:0]};
//    Data2_mant = {1'b1,Data2[22:0]};
//end
reg [31:0] Data1_d;
reg [31:0] Data2_d;
reg In_Data_Valid_d;
always @(posedge Clock)
begin
    Data1_d <= Data1;
    Data2_d <= Data2;
    In_Data_Valid_d <= In_Data_Valid;
end
// module instantiations
adder fpu_add(
    .Data1(Data1_d),
    .Data2(Data2_d),
    .In_Data_Valid(In_Data_Valid_d),
    .Data_Out(adder_Data_Out),
    .adder_Data_Out_Valid(adder_Data_Out_Valid)
);
multiplier fpu_mult(
    .clk(Clock),
    .Data1(Data1_d),
    .Data2(Data2_d),
    .In_Data_Valid(In_Data_Valid_d),
    .Data_Out(mult_Data_Out),
    .mult_Data_Out_Valid(mult_Data_Out_Valid)
);
mux_2_to_1 mux(
    .clk(Clock),
    .opcode(op),
    .adder_Data_Out(adder_Data_Out),
    .mult_Data_Out(mult_Data_Out),
    .In_Data_Valid(In_Data_Valid),
    .adder_Data_Out_Valid(adder_Data_Out_Valid),
    .mult_Data_Out_Valid(mult_Data_Out_Valid),
    .Data_Out(Data_Out),
    .Out_Data_Valid(Out_Data_Valid)
);
endmodule
