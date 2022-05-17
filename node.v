`include "multiplier.v";
`include "adder.v";

module node();
    input  [9: 0] A, B;               // our inputs x and y
    input  [9: 0] multA, multB;       // multipliers supposed to be multiplied with A and B
    output [9: 0] noderesult;         // final output of Node
    wire   [9: 0] mult1Res, mult1Res; // intermediate wires
    
    multiplier mult1(.A(A), .B(multA), .O(mult1Res));
    multiplier mult2(.A(A), .B(multB), .O(mult2Res));
    adder adder1(.A(mult1Res), .B(mult2Res), .O(noderesult));

endmodule