//Create a 100-bit binary ripple-carry adder by instantiating 100 full adders. The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out. To encourage you to actually instantiate full adders, also output the carry-out from each full adder in the ripple-carry adder. cout[99] is the final carry-out from the last full adder, and is the carry-out you usually see.

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    wire[99:0]carry;
    full_adder add1(a[0],b[0],cin,sum[0],carry[0]);
    genvar i;
    generate
        for(i=1;i<100;i=i+1) begin:adder_array
            full_adder fa (a[i],b[i],carry[i-1],sum[i],carry[i]);
        end
    endgenerate
    assign cout=carry;
endmodule

module full_adder(
	input a,b,cin,
    output sum,cout
);
    assign sum=a^b^cin;
    assign cout=(a&b)|(a&cin)|(b&cin);
endmodule