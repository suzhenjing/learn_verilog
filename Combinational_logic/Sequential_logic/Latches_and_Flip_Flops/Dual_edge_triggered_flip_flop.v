module top_module (
    input clk,
    input d,
    output q
);
    reg q_pos; // 这里存储上升沿的数据
    reg q_neg; // 这里存储下降沿的数据

    always @(posedge clk) q_pos <= d;
    always @(negedge clk) q_neg <= d;

    // 输出在上升沿时为 q_pos，在下降沿时为 q_neg
    assign q = clk ? q_pos : q_neg;
endmodule
