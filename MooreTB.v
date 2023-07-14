module Moore1101_tb;

  // Define the clock signal
  reg clk;
  always #5 clk = ~clk;

  // Define the reset signal
  reg reset;
  initial reset = 1'b1;
  always #10 reset = 1'b0;

  // Define the input data signal
  reg in;
  initial in = 1'b0;

  // Instantiate the Moore1101 module
  Moore1101 dut (
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
  );

  // Simulate the input data signal
  initial begin
    clk = 1;
    // Wait for a few clock cycles
    //to stabilize the circuit
    #10;
    // Send the input data "1101100101101"
    in = 1'b1;
    #10;
    in = 1'b1;
    #10;
    in = 1'b0;
    #10;
    in = 1'b1;
    #10;
    in = 1'b1;
    #10;
    in = 1'b0;
    #10;
    in = 1'b0;
    #10;
    in = 1'b1;
    #10;
    in = 1'b0;
    #10;
    in = 1'b1;
    #10;
    in = 1'b1;
    #10;
    in = 1'b0;
	#10;
    in = 1'b1;
    
    // Wait for the output to stabilize
    #50;

    // Stop the simulation
    $finish;
  end
  

endmodule
