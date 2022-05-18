`include "node.v"
`include "activation_block.v"

module ExBlock(clk, A, B, funct, totalSteps, theta1, theta2, beta1, beta2, alpha1, alpha2, step, updatedSteps);
    input  [7:0] A, B;  // Our inputs X and Y
    input  [7:0] theta1, theta2, beta1, beta2, alpha1, alpha2; // values of our multipliers already fetched from previous blocks
    input  clk;
    output step;        // Our Final Boolean Output
    wire   [7:0] n1_1out, n1_2out, n2_1out;

    node n1_1(.A(A), .B(B), .multA(theta1), .multB(theta2), .nodeResult(n1_1out), .clk(clk)); // node_FirstLayer_FirstNode  (inner layer nodes)
    node n1_2(.A(A), .B(B), .multA(beta1), .multB(beta2), .nodeResult(n1_2out), .clk(clk)); // node_FirstLayer_SecondNode (inner layer nodes)
    node n2_1(.A(n1_1out), .B(n1_2out), .multA(alpha1), .multB(alpha2), .nodeResult(n2_1out), .clk(clk)); // node_SecondLayer_FirstNode (final layer)
    act_Block actBlock1(.value(n2_1out), .S(step));

endmodule