module top_module(
    input        clk,
    input        reset,   // synchronous reset (active high)
    input        ena,     // enable once-per-second
    output reg   pm,      // 0 = AM, 1 = PM
    output reg [7:0] hh,  // BCD: hh = {tens[3:0], ones[3:0]}  (01..12)
    output reg [7:0] mm,  // BCD: 00..59
    output reg [7:0] ss   // BCD: 00..59
);

    // Helper wires for digits
    wire [3:0] ss_ones = ss[3:0];
    wire [3:0] ss_tens = ss[7:4];
    wire [3:0] mm_ones = mm[3:0];
    wire [3:0] mm_tens = mm[7:4];
    wire [3:0] hh_ones = hh[3:0];
    wire [3:0] hh_tens = hh[7:4];

    always @(posedge clk) begin
        if (reset) begin
            // synchronous reset: set 12:00:00 AM
            pm <= 1'b0;          // AM
            hh <= 8'h12;        // BCD 12 -> {1,2} -> 0x12
            mm <= 8'h00;
            ss <= 8'h00;
        end else if (ena) begin
            // Default: keep current values unless changed below
            // Increment seconds in BCD
            if (ss_ones == 4'd9) begin
                // ones -> 0, carry to tens
                if (ss_tens == 4'd5) begin
                    // seconds rollover 59 -> 00, carry to minutes
                    ss <= 8'h00;
                    // increment minutes (BCD)
                    if (mm_ones == 4'd9) begin
                        // ones -> 0, carry to tens
                        if (mm_tens == 4'd5) begin
                            // minutes rollover 59 -> 00, carry to hours
                            mm <= 8'h00;
                            // increment hours (special BCD for 01..12)
                            if (hh == 8'h11) begin
                                // 11 -> 12, toggle pm
                                hh <= 8'h12;
                                pm <= ~pm;
                            end else if (hh == 8'h12) begin
                                // 12 -> 01 (no toggle)
                                hh <= 8'h01;
                            end else begin
                                // general BCD hour increment
                                if (hh_ones == 4'd9) begin
                                    // ones rollover
                                    hh[3:0] <= 4'd0;
                                    hh[7:4] <= hh_tens + 4'd1;
                                end else begin
                                    hh[3:0] <= hh_ones + 4'd1;
                                end
                            end
                        end else begin
                            // increase minute tens
                            mm[7:4] <= mm_tens + 4'd1;
                            mm[3:0] <= 4'd0;
                        end
                    end else begin
                        // increase minute ones
                        mm[3:0] <= mm_ones + 4'd1;
                    end
                end else begin
                    // increase second tens
                    ss[7:4] <= ss_tens + 4'd1;
                    ss[3:0] <= 4'd0;
                end
            end else begin
                // increase second ones only
                ss[3:0] <= ss_ones + 4'd1;
            end
        end
        // else (not enabled): hold values
    end
endmodule
