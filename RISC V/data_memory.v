module data_memory(clk,we,a,wd,rd);
   input clk,we;
   input[31:0] wd,a;

   output [31:0] rd;

   wire [31:0] data_mem[1023:0];

   assign rd=(we==1'b00)? data_mem[a]:32'h00000000;

   always @(posedge clk) begin
     if (we) begin
       data_mem[a]<=wd;
     end
   end
endmodule