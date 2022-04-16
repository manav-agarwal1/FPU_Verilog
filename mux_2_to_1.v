`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Organisation: BITS Pilani KK Birla GOA CAMPUS 
// Author: Manav Agarwal 
// Role: Student
// Create Date: 27.02.2022 20:23:21
// Design Name: 
// Module Name: mux_2_to_1
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


module mux_2_to_1(
input clk,
input opcode,
input [31:0] adder_Data_Out,
input [31:0] mult_Data_Out,
input In_Data_Valid,
input adder_Data_Out_Valid,
input mult_Data_Out_Valid,
output reg [31:0] Data_Out,
output reg Out_Data_Valid
);
always @(posedge clk)
begin
    if(In_Data_Valid == 1'b1)
	begin
		if(opcode == 1'b0)
		begin
			if(adder_Data_Out_Valid == 1'b1)
				Data_Out <= adder_Data_Out;
			else
				Data_Out <= 32'hffffffff;
			Out_Data_Valid <= In_Data_Valid & adder_Data_Out_Valid;
		end else
		begin
			if(mult_Data_Out_Valid == 1'b1)
				Data_Out <= mult_Data_Out;
			else
				Data_Out <= 32'hffffffff;
			Out_Data_Valid <= In_Data_Valid & mult_Data_Out_Valid;
		end
	end else
	begin
		Data_Out <= 32'hffffffff;
		Out_Data_Valid <= 0;
	end
end
endmodule
