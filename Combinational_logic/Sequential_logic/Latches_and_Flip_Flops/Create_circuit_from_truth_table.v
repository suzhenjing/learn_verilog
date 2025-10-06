module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    wire Q_old;
    assign Q_old=(j&~Q)|(~k&Q);
    always @(posedge clk)begin
    	Q<=Q_old;
    end
endmodule
