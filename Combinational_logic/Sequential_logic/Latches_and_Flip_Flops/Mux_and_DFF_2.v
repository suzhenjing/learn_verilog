module MUXDFF (
	input clk,
    input L,
    input R,
    input E,
    input w,
    output Q
);
   	wire q_out,e_sel,l_sel;
   	assign q_out=Q;
    assign e_sel= E ? w : q_out;
    assign l_sel= L ? R : e_sel;
    always@(posedge clk)begin
    	Q<=l_sel;
    end
endmodule