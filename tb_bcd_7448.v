`timescale 1ns/1ps

module tb_bcd_7448();

reg [3:0] BCD;
reg LT, BI, RBI;
wire [6:0] seg;

// Instantiate DUT
bcd_7448 dut (
    .BCD(BCD),
    .LT(LT),
    .BI(BI),
    .RBI(RBI),
    .seg(seg)
);

initial begin
    $dumpfile("7448.vcd");   // for GTKWave
    $dumpvars(0, tb_ic7448);

    // Default : all control inputs HIGH
    LT  = 1;
    BI  = 1;
    RBI = 1;

    // Test all digits 0-9
    $display("Testing BCD 0-9...");
    for (integer i = 0; i < 10; i = i + 1) begin
        BCD = i;
        #10;
    end

    // Test BI = LOW (blanking)
    $display("Testing BI low blanking...");
    BI = 0;  BCD = 4'd5;  #10;
    BI = 1;

    // Test LT = LOW (lamp test)
    $display("Testing LT low (all ON)...");
    LT = 0; BCD = 4'd3;   #10;
    LT = 1;

    // Test RBI leading zero blanking
    $display("Testing RBI leading-zero blanking...");
    RBI = 0; BCD = 4'd0;  #10;
    RBI = 1;

    // End simulation
    $finish;
end

endmodule

