`timescale 1ns/1ps

module tb_bcd_7448();

reg [3:0] bcd;
reg LT, BI, RBI;
wire [6:0] seg;

// Instantiate DUT (Device Under Test)
bcd_7448 dut (
    .bcd(bcd),
    .LT(LT),
    .BI(BI),
    .RBI(RBI),
    .seg(seg)
);

initial begin
    // Dump waveform if using GTKWave (optional for Vivado)
    // $dumpfile("bcd_7448.vcd");
    // $dumpvars(0, tb_bcd_7448);

    // Initialize
    LT = 1; BI = 1; RBI = 1; 
    bcd = 4'd0;

    #10 bcd = 4'd1;
    #10 bcd = 4'd2;
    #10 bcd = 4'd3;
    #10 bcd = 4'd4;
    #10 bcd = 4'd5;
    #10 bcd = 4'd6;
    #10 bcd = 4'd7;
    #10 bcd = 4'd8;
    #10 bcd = 4'd9;

    // Test A-F cases (10-15)
    #10 bcd = 4'd10;
    #10 bcd = 4'd11;
    #10 bcd = 4'd12;
    #10 bcd = 4'd13;
    #10 bcd = 4'd14;
    #10 bcd = 4'd15;

    // Test BI Blanking
    #10 BI = 0; // Blanking Input active → display off
    #10 BI = 1;

    // Test LT Lamp Test
    #10 LT = 0; // All segments ON
    #10 LT = 1;

    // Test RBI leading zero blanking
    #10 bcd = 0; RBI = 0; // leading zero → blank
    #10 RBI = 1;          // show zero normally

    #10 $stop;  // End simulation
end

endmodule
