`include "node.v";
`include "activation_block.v";

module ExBlock();
    input  [9:0] A, B;  // Our inputs X and Y
    input  [2:0] funct; // Determines the type of instructions
    input  [9:0] theta1_1, theta1_2, theta2_1, theta2_2, alpha1, alpha2; // values of our multipliers already fetched from previous blocks
    output step;        // Our Final Boolean Output
    wire   [9:0] n1_1out, n1_2out, n2_1out;

    if (funct == 3'd1) // Normal Counting Instruction
        begin
            node n1_1(.A(A), .B(B), .multA(theta1_1), .multB(theta1_2), .nodeResult(n1_1out)); // node_FirstLayer_FirstNode  (inner layer nodes)
            node n1_2(.A(A), .B(B), .multA(theta2_1), .multB(theta2_2), .nodeResult(n1_2out)); // node_FirstLayer_SecondNode (inner layer nodes)
            node n2_1(.A(n1_1out), .B(n1_2out), .multA(alpha1), .multB(alpha2), .nodeResult(n2_1out)); // node_SecondLayer_FirstNode (final layer)
            act_Block actBlock1(.value(n2_1out), .bool(step));
        end
    else if (funct == 3'd0) // Reset Instruction
        begin
        //   relevant code
        end
    else if (funct == 3'd2) // Update Weights Instruction
        begin
        //   relevant code
        end
endmodule