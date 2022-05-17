module act_Block(value, S);
    input  [9:0] value;
    output S;

    assign S = (value>=10'd100) ? 1'b1 : 1'b0; // Any particular condition, will overwrite it once we get a clearer view of outputs
endmodule