`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Organisation: BITS Pilani KK Birla GOA CAMPUS 
// Author: Manav Agarwal 
// Role: Student
// Create Date: 27.02.2022 20:23:21
// Design Name: 
// Module Name: fpu_tb
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


module fpu_tb;
reg Clock;
reg [31:0] Data1;
reg [31:0] Data2;
reg In_Data_Valid;
reg op;
wire [31:0] Data_Out;
wire Out_Data_Valid;
// random frequency of clk is chosen for testing purpose
// refer results.pdf for clk frequency
parameter period = 60; 
fpu fpu_testing(
  .Clock(Clock),
  .Data1(Data1),
  .Data2(Data2),
  .In_Data_Valid(In_Data_Valid),
  .op(op),
  .Data_Out(Data_Out),
  .Out_Data_Valid(Out_Data_Valid)
);
initial
	begin
	Clock=0;
	forever
	begin
		#15 Clock = ~Clock;
	end
end
// all the outputs are verified by means of same online calculators as shown in class
// https://www.h-schmidt.net/FloatConverter/IEEE754.html
// http://weitz.de/ieee/
always @(posedge Clock)
begin
    Data1 = 32'b01000001110000011001100110011010;
    Data2 = 32'b00111111100110101110000101001000;
    In_Data_Valid = 1'b1;
	op = 1'b0;
    #period;
    if(Data_Out != 32'b01000001110010110100011110101110 || Out_Data_Valid != 1'b1)
        $display("Test1 Failed");
    else
        $display("Test1 Passed");
    
    Data1 = 32'b01000000101001100110011001100110;
    Data2 = 32'b10111111100110011001100110011010;
    In_Data_Valid = 1'b1;
    op = 1'b0;
    #period;
    if(Data_Out != 32'b01000000100000000000000000000000 || Out_Data_Valid != 1'b1)
        $display("Test2 Failed");
    else
        $display("Test2 Passed");
    
    Data1 = 32'b00111111100011001100110011001101;
    Data2 = 32'b00111111100011001100110011001101;
    In_Data_Valid = 1'b1;
    op = 1'b1;
    #period;
    if(Data_Out != 32'b00111111100110101110000101001000 || Out_Data_Valid != 1'b1)
        $display("Test3 Failed");
    else
        $display("Test3 Passed");
    // irrespective of data and opcode if input valid is 0 it output NaN   
    Data1 = 32'b00111111100011001100110011001101;
    Data2 = 32'b00111111100011001100110011001101;
    In_Data_Valid = 1'b0;
    op = 1'b1;
    #period;
    if(Data_Out != 32'b11111111111111111111111111111111 || Out_Data_Valid != 1'b0)
        $display("Test4 Failed");
    else
        $display("Test4 Passed");
    
    Data1 = 32'b00111111100011001100110011001101;
    Data2 = 32'b00111111100011001100110011001101;
    In_Data_Valid = 1'b0;
    op = 1'b1;
    #period;
    if(Data_Out != 32'b11111111111111111111111111111111 || Out_Data_Valid != 1'b0)
        $display("Test5 Failed");
    else
        $display("Test5 Passed");
    
    Data1 = 32'b01000000101000110011001100110011;
    Data2 = 32'b01000000101000110011001100110011;
    In_Data_Valid = 1'b1;
    op = 1'b1;
    #period;
    if(Data_Out != 32'b01000001110100000001010001111010 || Out_Data_Valid != 1'b1)
        $display("Test6 Failed");
    else
        $display("Test6 Passed");
    
    // multiply by 0
    Data1 = 32'b01000000101000110011001100110011;
    Data2 = 32'b0;
    In_Data_Valid = 1'b1;
    op = 1'b1;
    #period;
    if(Data_Out != 32'b0 || Out_Data_Valid != 1'b1)
        $display("Test7 Failed");
    else
        $display("Test7 Passed");
    // add by 0
    Data1 = 32'b01000000101000110011001100110011;
    Data2 = 32'b0;
    In_Data_Valid = 1'b1;
    op = 1'b0;
    #period;
    if(Data_Out != Data1 || Out_Data_Valid != 1'b1)
        $display("Test8 Failed");
    else
        $display("Test8 Passed");
end
endmodule
