module top_module (
    input clk,
    input slowena,
    input reset,
    output reg [3:0] q);
    always@(posedge clk)begin
        if(reset)begin
        	q<=4'b0;
        end
        else begin
            if(slowena)begin
                q<=(q>=4'b1001)?0:(q+1);
            end
            else begin
            	q<=q;
            end
        end
    end
endmodule
