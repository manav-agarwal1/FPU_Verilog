`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Organisation: BITS Pilani KK Birla GOA CAMPUS 
// Author: Manav Agarwal 
// Role: Student
// Create Date: 27.02.2022 20:23:21
// Design Name: 
// Module Name: normalise_helper
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


module normalise_helper(
input [24:0] Data_Out_mant,
input [7:0] Data_Out_exp,
output reg [24:0] Data_final_mant,
output reg [7:0] Data_final_exp
);
always @(*)
begin
    if(Data_Out_mant[22] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 1;
        Data_final_exp = Data_Out_exp - 8'd1;
    end 
    else if(Data_Out_mant[21] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 2;
        Data_final_exp = Data_Out_exp - 8'd2;
    end 
    else if(Data_Out_mant[20] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 3;
        Data_final_exp = Data_Out_exp - 8'd3;
    end 
    else if(Data_Out_mant[19] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 4;
        Data_final_exp = Data_Out_exp - 8'd4;
    end 
    else if(Data_Out_mant[18] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 5;
        Data_final_exp = Data_Out_exp - 8'd5;
    end 
    else if(Data_Out_mant[17] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 6;
        Data_final_exp = Data_Out_exp - 8'd6;
    end 
    else if(Data_Out_mant[16] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 7;
        Data_final_exp = Data_Out_exp - 8'd7;
    end 
    else if(Data_Out_mant[15] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 8;
        Data_final_exp = Data_Out_exp - 8'd8;
    end 
    else if(Data_Out_mant[14] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 9;
        Data_final_exp = Data_Out_exp - 8'd9;
    end 
    else if(Data_Out_mant[13] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 10;
        Data_final_exp = Data_Out_exp - 8'd10;
    end 
    else if(Data_Out_mant[12] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 11;
        Data_final_exp = Data_Out_exp - 8'd11;
    end 
    else if(Data_Out_mant[11] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 12;
        Data_final_exp = Data_Out_exp - 8'd12;
    end 
    else if(Data_Out_mant[10] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 13;
        Data_final_exp = Data_Out_exp - 8'd13;
    end 
    else if(Data_Out_mant[9] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 14;
        Data_final_exp = Data_Out_exp - 8'd14;
    end
    else if(Data_Out_mant[8] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 15;
        Data_final_exp = Data_Out_exp - 8'd15;
    end
    else if(Data_Out_mant[7] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 16;
        Data_final_exp = Data_Out_exp - 8'd16;
    end
    else if(Data_Out_mant[6] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 17;
        Data_final_exp = Data_Out_exp - 8'd17;
    end
    else if(Data_Out_mant[5] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 18;
        Data_final_exp = Data_Out_exp - 8'd18;
    end
    else if(Data_Out_mant[4] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 19;
        Data_final_exp = Data_Out_exp - 8'd19;
    end
    else if(Data_Out_mant[3] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 20;
        Data_final_exp = Data_Out_exp - 8'd20;
    end
    else if(Data_Out_mant[2] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 21;
        Data_final_exp = Data_Out_exp - 8'd21;
    end
    else if(Data_Out_mant[1] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 22;
        Data_final_exp = Data_Out_exp - 8'd22;
    end
    else if(Data_Out_mant[0] == 1'b1)
    begin
        Data_final_mant = Data_Out_mant << 23;
        Data_final_exp = Data_Out_exp - 8'd23;
    end
end
endmodule
