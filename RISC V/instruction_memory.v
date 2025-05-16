module mem(a,rst,rd);

  input [31:0]a;
  input rst;

  output [31:0]rd;

  reg [31:0] mem(1023:0);

  assign rd= (rst == 1'b0)? 32'b00000000 : mem[A[31:2]];

endmodule 