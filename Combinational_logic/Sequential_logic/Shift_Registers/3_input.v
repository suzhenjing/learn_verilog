module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z
);
    reg [7:0] Q;
    always @(posedge clk) begin
        if (enable)
            Q <= { Q[6:0], S }; 
        else
            Q <= Q; 
    end
    assign Z = Q[{A,B,C}];
endmodule
//可以不实例寄存器，直接用一个数组代替，之前使用D_ff的module实例化了8个，不如用数组来。