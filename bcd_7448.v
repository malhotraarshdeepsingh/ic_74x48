module bcd_7448(
    input [3:0] bcd,
    input LT, BI, RBI,
    output reg [6:0] seg // a b c d e f g (active LOW)
);

always @(*) begin
    // BI active-low: blank all segments
    if (!BI) begin
        seg = 7'b1111111;  
    end
    // LT active-low: light all segments
    else if (!LT) begin
        seg = 7'b0000000;  
    end
    // RBI logic for leading zero
    else if (!RBI && bcd == 4'd0) begin
        seg = 7'b1111111;  
    end
    else begin
        case(bcd)
            4'd0: seg = 7'b0000001;
            4'd1: seg = 7'b1001111;
            4'd2: seg = 7'b0010010;
            4'd3: seg = 7'b0000110;
            4'd4: seg = 7'b1001100;
            4'd5: seg = 7'b0100100;
            4'd6: seg = 7'b0100000;
            4'd7: seg = 7'b0001111;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0000100;
            4'd10: seg = 7'b0001101;  // A
            4'd11: seg = 7'b0011001;  // b
            4'd12: seg = 7'b0100011;  // C
            4'd13: seg = 7'b1001011;  // d
            4'd14: seg = 7'b0001111;  // E
            4'd15: seg = 7'b0000000;  // F
            default: seg = 7'b1111111;
        endcase
    end
end

endmodule
