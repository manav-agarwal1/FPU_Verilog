`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Organisation: BITS Pilani KK Birla GOA CAMPUS 
// Author: Manav Agarwal 
// Role: Student
// Create Date: 27.02.2022 20:23:21
// Design Name: 
// Module Name: adder
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


module adder(
input [31:0] Data1,
input [31:0] Data2,
input In_Data_Valid,
output reg [31:0] Data_Out,
output adder_Data_Out_Valid
);
reg [7:0] Data1_exp;
reg [23:0] Data1_mant;

reg [7:0] Data2_exp;
reg [23:0] Data2_mant;

wire [31:0] neqExpAddOp;

wire [7:0] shiftAmnt;
reg [23:0] temp;

wire shiftDirection;
//wire [7:0] temp_exp;
//assign {shiftDirection, temp_exp} = Data1_exp - Data2_exp;
//assign shiftAmnt = (shiftDirection == 1'b0 ? temp_exp : -temp_res);
//assign  Data_Out = (Data1[30:23] == 8'b0 ? Data2 : (Data2[30:23] == 8'b0 ? Data1 : (shiftAmnt == 1'b0 ? eqExpAddOp : neqExpAddOp))); // mux
assign adder_Data_Out_Valid = (((Data_Out[30:23] != 8'd0 || (Data_Out[30:23] == 8'b0 && Data_Out[22:0] == 23'b0)) && Data_Out[30:23] != 8'd255) ? 1 : 0); // mux

subtractor test(
    .A(Data1_exp),
    .B(Data2_exp),
    .res(shiftAmnt),
    .sign(shiftDirection)
);
neqExpAdder test2(
    .Data1_sign(Data1[31]),
    .Data2_sign(Data2[31]),
    .shiftAmnt(shiftAmnt),
    .shiftDirection(shiftDirection),
    .Data1_mant(Data1_mant),
    .Data2_mant(Data2_mant),
    .Data1_exp(Data1_exp),
    .Data2_exp(Data2_exp),
    .Data_Out(neqExpAddOp)
);

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
        if(Data1_exp == 8'b0)
            Data_Out = Data2;
        else if(Data2_exp == 8'b0)
            Data_Out = Data1;
        else // all corner cases done
        begin
//            if(shiftAmnt == 8'b0)
//                Data_Out = eqExpAddOp;
//            else
              Data_Out = neqExpAddOp;
        end
    end else
        Data_Out = 32'b1;
end
endmodule
