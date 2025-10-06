module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output reg [4:0] q
); 
    reg [4:0] q_reg;
    assign q=q_reg;
    always @(posedge clk)begin
        if(reset)begin
        	q_reg<=5'b1;
        end
        else begin
            q_reg<={1'b0 ^ q_reg[0],
                    q_reg[4],
                    q_reg[3] ^ q_reg[0],
                    q_reg[2],
                    q_reg[1]
            };
        end
    end
endmodule
//5 bit LFSR