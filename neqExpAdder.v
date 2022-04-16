`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Organisation: BITS Pilani KK Birla GOA CAMPUS 
// Author: Manav Agarwal 
// Role: Student
// Create Date: 27.02.2022 20:23:21
// Design Name: 
// Module Name: neqExpAdder
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


module neqExpAdder(
input Data1_sign,
input Data2_sign,
input [7:0] shiftAmnt,
input shiftDirection,
input [23:0] Data1_mant,
input [23:0] Data2_mant,
input [7:0] Data1_exp,
input [7:0] Data2_exp,
output reg [31:0] Data_Out
);
reg Data_Out_sign;
reg [7:0] Data_Out_exp;
reg [24:0] Data_Out_mant; // if not numbers has 24th bit 1
wire [7:0] temp_exp;
wire [24:0] temp_mant; // if not numbers has 24th bit 1
reg [23:0] temp;
// we can call this module in 2 cases
// normalised and unnormalised
//assign Data_Out = {Data_Out_sign, Data_Out_exp, Data_Out_mant[22:0]};

always @(*)
begin
    if(shiftDirection == 1'b0)
    begin
    // A is greater
        Data_Out_exp = Data1_exp;
        Data_Out_sign = Data1_sign;
        temp = Data2_mant >> shiftAmnt;
        if(Data1_sign == Data2_sign)
            Data_Out_mant = Data1_mant + temp;
        else
            Data_Out_mant = Data1_mant - temp;
    end else
    begin
    // B is greater and take 2's compliment of temp_exp
        Data_Out_exp = Data2_exp;
        Data_Out_sign = Data2_sign;
        temp = Data1_mant >> (-shiftAmnt);
        if(Data1_sign == Data2_sign)
            Data_Out_mant = Data2_mant + temp;
        else
            Data_Out_mant = Data2_mant - temp;
    end
    
end
// not needed here
//// exra shifting logic

normalise_helper help(
    .Data_Out_mant(Data_Out_mant),
    .Data_Out_exp(Data_Out_exp),
    .Data_final_mant(temp_mant),
    .Data_final_exp(temp_exp)
);
always @(*)
begin
    Data_Out_exp = Data_Out_exp + {7'b0, Data_Out_mant[24]};
    Data_Out_mant = Data_Out_mant >> Data_Out_mant[24];
    Data_Out = {Data_Out_sign, Data_Out_exp, Data_Out_mant[22:0]};
    if(Data_Out_mant[23] == 1'b0 && Data_Out_exp != 8'b0)
    begin
        Data_Out = {Data_Out_sign, temp_exp, temp_mant[22:0]};
    end
end
endmodule
