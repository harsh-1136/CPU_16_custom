`timescale 1ns / 1ps


module right_shift32(
    input  [31:0] a,
    input  [4:0]  b,
    output [31:0] y
    );

    mux_32 inst0  (a,                    b, y[0]);
    mux_32 inst1  ({1'b0,  a[31:1]},     b, y[1]);
    mux_32 inst2  ({2'b0,  a[31:2]},     b, y[2]);
    mux_32 inst3  ({3'b0,  a[31:3]},     b, y[3]);
    mux_32 inst4  ({4'b0,  a[31:4]},     b, y[4]);
    mux_32 inst5  ({5'b0,  a[31:5]},     b, y[5]);
    mux_32 inst6  ({6'b0,  a[31:6]},     b, y[6]);
    mux_32 inst7  ({7'b0,  a[31:7]},     b, y[7]);
    mux_32 inst8  ({8'b0,  a[31:8]},     b, y[8]);
    mux_32 inst9  ({9'b0,  a[31:9]},     b, y[9]);
    mux_32 inst10 ({10'b0, a[31:10]},    b, y[10]);
    mux_32 inst11 ({11'b0, a[31:11]},    b, y[11]);
    mux_32 inst12 ({12'b0, a[31:12]},    b, y[12]);
    mux_32 inst13 ({13'b0, a[31:13]},    b, y[13]);
    mux_32 inst14 ({14'b0, a[31:14]},    b, y[14]);
    mux_32 inst15 ({15'b0, a[31:15]},    b, y[15]);
    mux_32 inst16 ({16'b0, a[31:16]},    b, y[16]);
    mux_32 inst17 ({17'b0, a[31:17]},    b, y[17]);
    mux_32 inst18 ({18'b0, a[31:18]},    b, y[18]);
    mux_32 inst19 ({19'b0, a[31:19]},    b, y[19]);
    mux_32 inst20 ({20'b0, a[31:20]},    b, y[20]);
    mux_32 inst21 ({21'b0, a[31:21]},    b, y[21]);
    mux_32 inst22 ({22'b0, a[31:22]},    b, y[22]);
    mux_32 inst23 ({23'b0, a[31:23]},    b, y[23]);
    mux_32 inst24 ({24'b0, a[31:24]},    b, y[24]);
    mux_32 inst25 ({25'b0, a[31:25]},    b, y[25]);
    mux_32 inst26 ({26'b0, a[31:26]},    b, y[26]);
    mux_32 inst27 ({27'b0, a[31:27]},    b, y[27]);
    mux_32 inst28 ({28'b0, a[31:28]},    b, y[28]);
    mux_32 inst29 ({29'b0, a[31:29]},    b, y[29]);
    mux_32 inst30 ({30'b0, a[31:30]},    b, y[30]);
    mux_32 inst31 ({31'b0, a[31:31]},    b, y[31]);


endmodule
