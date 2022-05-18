// Code your design here

module adder_final (s, total_in, total_out, reset)
  
  input s;
  input reset;
  input [15:0]total_in; // byte addressable in register file gives two bytes 
  output [15:0] total_out;
  
  always @(*)
    begin 
      if (reset)
        begin 
          total_out = 16'd0;
          
        end
      else
        begin 
          total_out = total_in + s;
        end
      
    end
endmodule
  
  