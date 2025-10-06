module top_module (
    input clk,
    input resetn,
    input in,
    output out);
    wire w1,w2,w3;
    D_flip ins1(clk,in,resetn,w1);
    D_flip ins2(clk,w1,resetn,w2);
    D_flip ins3(clk,w2,resetn,w3);
    D_flip ins4(clk,w3,resetn,out);

endmodule
//声明一个D触发器
module D_flip (input clk, input D,input resetn, output Q);
    always @(posedge clk)
        begin
            if(!resetn)
                Q <= 1'b0;
            else
            	Q <= D;
        end
endmodule

