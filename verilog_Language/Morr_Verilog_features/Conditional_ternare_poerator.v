module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0] ab,cd;
    assign ab = (a > b) ? b : a;      // min(a,b)
    assign cd = (c > d) ? d : c;      // min(c,d)
    assign min = (cd > ab) ? ab : cd; // min(ab,cd)
    // assign intermediate_result1 = compare? true: false;

endmodule
