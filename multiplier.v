`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Organisation: BITS Pilani KK Birla GOA CAMPUS 
// Author: Manav Agarwal 
// Role: Student
// Create Date: 27.02.2022 20:23:21
// Design Name: 
// Module Name: multiplier
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


module multiplier(
input clk,
input [31:0] Data1,
input [31:0] Data2,
input In_Data_Valid,
output [31:0] Data_Out,
output mult_Data_Out_Valid
);
reg [7:0] Data1_exp;
reg [23:0] Data1_mant;

reg [7:0] Data2_exp;
reg [23:0] Data2_mant;

reg Data_Out_sign;
reg [7:0] Data_Out_exp;
reg Data_Out_exp_OF;
reg [47:0] Data_Out_mant; // if not numbers has 24th bit 1
//reg [47:0] temp_res;
assign Data_Out = {Data_Out_sign, Data_Out_exp, Data_Out_mant[45:23]};
assign mult_Data_Out_Valid = (Data_Out_exp_OF == 1'b1 ? 0: (((Data_Out_exp != 8'd0 || (Data_Out_exp == 8'b0 && Data_Out_mant == 23'b0))&& Data_Out_exp != 8'd255) ? 1 : 0));

always @(*)
begin
    Data1_exp = Data1[30:23];
    Data1_mant = {1'b1,Data1[22:0]};
    Data2_exp = Data2[30:23];
    Data2_mant = {1'b1,Data2[22:0]};

end

always @(*)
begin
    if(In_Data_Valid == 1'b1)
    begin
        if(Data1_exp == 8'b0 || Data2_exp == 8'b0)
            {Data_Out_sign, Data_Out_exp, Data_Out_mant} = 57'b0;
        else
        begin
            Data_Out_sign = Data1[31] ^ Data2[31];
            {Data_Out_exp_OF,Data_Out_exp} = Data1_exp + Data2_exp - 8'd127;
            Data_Out_mant = Data1_mant * Data2_mant;
            if(Data_Out_mant[47] == 1'b1)
            begin
                Data_Out_exp = Data_Out_exp + 1;
                Data_Out_mant = Data_Out_mant >> 1;
            end
        end
    end else
    begin
        Data_Out_sign = 1'b1;
        Data_Out_exp = 8'b1;
        Data_Out_mant = 23'b1;
    end
end
// exp range i 1 to 254

endmodule
