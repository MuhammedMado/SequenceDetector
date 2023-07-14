module Moore1101(input clk,
                   input reset,
                   input in,
                   output reg out);  
  
// Define the states
  parameter [2:0] S0 = 3'b000;
  parameter [2:0] S1 = 3'b001;
  parameter [2:0] S2 = 3'b010;
  parameter [2:0] S3 = 3'b011;
  parameter [2:0] S4 = 3'b100;
  
  reg [2:0] state;
  
  // Sequential logic for state transition
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      out <= 1'b0;
      state <= S0;
    end
    else
      begin
      case(state)
        S0: begin
          out <=1'b0;
          if(in)
            state <= S1;
        end
        S1: begin
          out <= 1'b0;
          if(in)  
            state <= S2;
          else
            state <= S0;
        end
        S2: begin
          out <= 1'b0;
          if(~in)
            state <= S3;
        end
        S3: begin
          out <= 1'b0;
          if(in)
            state <= S4;
          else
            state <= S0;
        end
        S4: begin
          out <= 1'b1;
          if(in)
            state <= S2;
          else
            state <= S0;
        end
      endcase
    end
  end
endmodule
