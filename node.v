`include "multiplier.v"
`include "adder.v"
`include "d_flipflop.v"

module node(A, B, multA, multB, nodeResult, clk);
    input  [7:0] A, B;               // our inputs x and y
    input  [7:0] multA, multB;       // multipliers supposed to be multiplied with A and B
    input clk; 
    output [7:0] nodeResult;         // final output of Node
    wire   [7:0] mult1Res, mult2Res, ffInput; // intermediate wires
    
    multiplier mult1(.A(A), .B(multA), .O(mult1Res));
    multiplier mult2(.A(B), .B(multB), .O(mult2Res));
    adder adder1(.A(mult1Res), .B(mult2Res), .O(ffInput));
    d_flipflop dff1(.clk(clk), .Q(ffInput), .D(nodeResult));

endmodule
