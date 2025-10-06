module top_module (
    input clk,
    input reset,
    output reg OneHertz,
    output reg [2:0] c_enable
); 
    wire [3:0] Q1,Q2,Q3;
    

    always@(posedge clk)begin
        if(reset)begin
        	OneHertz<=0;
            c_enable<=1;
        end
        else begin
            if(Q1==4'd8)begin
            	c_enable<=3'd3;
                if(Q2==4'd9 && Q1==4'd8)begin
                	c_enable<=3'd7;
                    if(Q3==4'd9)begin
                    	OneHertz<=1;
                    end
                end
            end
            else begin
            	OneHertz<=0;
            	c_enable<=1;
            end
        end
    end
    bcdcount counter0(clk,reset,c_enable[0],Q1);
    bcdcount counter1(clk,reset,c_enable[1],Q2);
    bcdcount counter2(clk,reset,c_enable[2],Q3);
    
    
endmodule

//这是一个0~9的计数器
module bcdcount (
	input clk,
	input reset,
	input enable,
	output reg [3:0] Q
);
endmodule