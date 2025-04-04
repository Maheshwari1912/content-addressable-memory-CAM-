module cam(input clk,input rst,input wr_en,
           input [7:0] srch_data,
           input [7:0] wr_data,
           input [7:0] wr_addr,
           output reg found,
           output reg [3:0] srch_addr
          );
  reg [7:0] mem [15:0];
  integer i;
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      for(i=0;i<16;i=i+1) begin
        mem[i]<=0;
      end
    end
      else if(wr_en) begin
        mem[wr_addr]<=wr_data;
      end
    end
    always@(*) begin
      found<=0;
      srch_addr<=0;
      for(i=0;i<16;i=i+1) begin
        if(mem[i]==srch_data) begin
          found<=1;
          srch_addr<=i;
        end
      end
    end
    endmodule
