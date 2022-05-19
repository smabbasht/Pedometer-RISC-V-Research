module instrFetch(
    clk, updateWeights, countSteps, reset, dualUpdateWeights, A, B, Addr1, Addr2, Data1, Data2,
    instruction
);
    input  clk;
    input  reset;
    input  countSteps;
    input  updateWeights;
    input  dualUpdateWeights;
    input  [7 :0] A, B; 
    input  [2 :0] Addr1, Addr2;
    input  [7 :0] Data1, Data2;
    output reg [31: 0] instruction;

    always @(posedge clk) begin
        if(countSteps == 1'b1) begin
            instruction[ 3: 0] = 4'b1100;
            instruction[11: 4] = A;
            instruction[19:12] = B;
            instruction[31:20] = 12'b0; // Waste Bits
        end
        else if(updateWeights ==  1'b1 & reset == 1'b1) begin
            instruction[ 3: 0] =  4'b0010;
            instruction[31: 4] = 28'b0;
        end
        else if(updateWeights == 1'b1 & reset == 1'b0) begin
            if(dualUpdateWeights == 1'b1) begin
                instruction[ 3: 0] = 4'b1010;
                instruction[ 6: 4] = Addr1;
                instruction[14: 7] = Data1;
                instruction[17:15] = Addr2;
                instruction[25:18] = Data2;
                instruction[31:26] = 6'b0; // Waste
            end
            else begin
                instruction[ 3: 0] = 4'b0110;
                instruction[ 6: 4] = Addr1;
                instruction[14: 7] = Data1;
                instruction[17:15] = 3'b111; // Writing at Spare register
                instruction[25:18] = 8'b0;
                instruction[31:26] = 6'b0; // Waste
            end
        end
    end
endmodule