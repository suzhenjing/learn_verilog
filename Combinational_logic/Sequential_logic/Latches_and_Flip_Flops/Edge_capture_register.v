module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output  reg [31:0] out
);

    reg [31:0] old_in;
    always@(posedge clk)begin
        old_in<=in;
        //这里无论reset与否都要更新old_in
        if(reset)begin
        	out=32'b0;
        end
        else begin
			out<=out|(old_in&~in);
        end
    
    end

endmodule
