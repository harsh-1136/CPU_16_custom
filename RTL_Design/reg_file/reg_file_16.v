`timescale 1ns / 1ps

module reg_file_16(
    input [15:0] datain,
    input [3:0] address,
    input wr,
    input clk,
    output reg [15:0] dataout
    );
    wire[15:0] data_out_s[15:0];
    reg[15:0] wr_s; 
    genvar i;
     generate
        for(i=0;i<16;i=i+1)begin
            reg_16 ins(datain,data_out_s[i],wr_s[i],clk);        
        end
    endgenerate
    always@(*)begin
    
     wr_s = 16'b0;
    case(address)
    
        4'd0:begin
        wr_s[0]=wr;
        dataout=data_out_s[0];
        end
        4'd1:
        begin
        wr_s[1]=wr;
        dataout=data_out_s[1];
        end
        4'd2:
        begin
        wr_s[2]=wr;
        dataout=data_out_s[2];
        end
        4'd3:begin
        wr_s[3]=wr;
        dataout=data_out_s[3];
        end
        4'd4:begin
        wr_s[4]=wr;
        dataout=data_out_s[4];
        end
        4'd5:begin
        wr_s[5]=wr;
        dataout=data_out_s[5];
        end
        4'd6:begin
        wr_s[6]=wr;
        dataout=data_out_s[6];
        end
        4'd7:begin
        wr_s[7]=wr;
        dataout=data_out_s[7];
        end
        4'd8:begin
        wr_s[8]=wr;
        dataout=data_out_s[8];
        end
        4'd9:begin
        wr_s[9]=wr;
        dataout=data_out_s[9];
        end
        4'd10:begin
        wr_s[10]=wr;
        dataout=data_out_s[10];
        end
        4'd11:begin
        wr_s[11]=wr;
        dataout=data_out_s[11];
        end
        4'd12:begin
        wr_s[12]=wr;
        dataout=data_out_s[12];
        end
        4'd13:begin
        wr_s[13]=wr;
        dataout=data_out_s[13];
        end
        4'd14:begin
        wr_s[14]=wr;
        dataout=data_out_s[14];
        end
        4'd15:begin
        wr_s[15]=wr;
        dataout=data_out_s[15];
        end
        endcase
        end
endmodule
