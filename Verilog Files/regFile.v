module regFile(
    clk, updateWeight, reset, Addr1, Addr2, Data1, Data2, 
    theta1, theta1, beta1, beta2, alpha1, alpha2, totalSteps
);

    input  clk;
    input  updateWeight;
    input  reset;
    input  [2:0] Addr1, Addr2;
    input  [7:0] Data1, Data2;
    output [7:0] theta1, theta2, beta1, beta2, alpha1, alpha2;
    output [7:0] totalSteps;

    reg [7:0] registers [7:0];
    initial begin
    registers[0] = 8'd0;  registers[1] = 8'd1;
    registers[2] = 8'd2;  registers[3] = 8'd3;
    registers[4] = 8'd4;  registers[5] = 8'd5;
    registers[6] = 8'd6;  registers[7] = 8'd7;
    end

    integer i;
    always @(posedge clk) begin
        if (updateWeight == 1'b1) begin
            if (reset == 1'b1) begin
                for (i=0; i<8; i++)
                    registers[i] = 8'b0;
            end
            else begin
              registers[Addr1] <= Data1;
              registers[Addr2] <= Data2;
            end
        end
    end
    
    assign theta1     = registers[0];
    assign theta2     = registers[1];
    assign beta1      = registers[2];
    assign beta2      = registers[3];
    assign alpha1     = registers[4];
    assign alpha2     = registers[5];
    assign totalSteps = registers[6];
    
endmodule