module d_flipflop(clk, Q, D);
    // This is a D-flipflop which passes the 8-bits provided data only on the posedge of clk
    input  clk;
    input      [7:0] Q;
    output reg [7:0] D;

    always @(posedge clk)
        D = Q;
endmodule