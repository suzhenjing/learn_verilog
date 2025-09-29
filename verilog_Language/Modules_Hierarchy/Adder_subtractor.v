module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0]low;
    wire [15:0]high;
    wire low_cout;
    wire [31:0]sub_b={32{sub}}^b;
    add16 add16_low(.a(a[15:0]),.b(sub_b[15:0]),.cin(sub),.sum(low),.cout(low_cout));
    add16 add16_high(.a(a[31:16]),.b(sub_b[31:16]),.cin(low_cout),.sum(high),.cout());
    assign sum={high,low};
    
endmodule

//系统已经声明变量
module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

endmodule