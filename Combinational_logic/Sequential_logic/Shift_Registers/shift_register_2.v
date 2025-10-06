module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
	wire Q3,Q2,Q1,Q0;
    MUXDFF mux3( KEY[0],KEY[2],SW[3],KEY[1],KEY[3],Q3);
    MUXDFF mux2( KEY[0],KEY[2],SW[2],KEY[1],Q3,Q2);
    MUXDFF mux1( KEY[0],KEY[2],SW[1],KEY[1],Q2,Q1);
    MUXDFF mux0( KEY[0],KEY[2],SW[0],KEY[1],Q1,Q0);
    
    assign LEDR={Q3,Q2,Q1,Q0};
endmodule

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
