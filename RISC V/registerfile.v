module regfile(clk,rst,we3,a1,a2,a3,wd3,rd1,rd2);
   input clk,rst,we3;
   input [31:0] wd3;
   input [4:0] a1,a2,a3;

   output [31:0] rd1,rd2;

   wire reg [31:0] register[31:0];

   assign rd1= (~rst)? 32'h00000000: register[a1];
   assign rd2= (~rst)? 32'h00000000: register[a2];

   always @(posedge clk) begin
     if (we3 == 1'b1) begin
       register[a3] <= wd3;
     end
   end
   
endmodule