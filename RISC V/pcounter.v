module pc(pc,rst,clk,pc_next);
   input [31:0]pc;
   input rst,clk;

   output reg [31:0] pc_next;

   always @(posedge clk) begin
     if (rst == 1'b0) begin
       pc_next <= 32'h00000000;
     end
     else begin
       pc_next <= pc;
     end    
   end
endmodule