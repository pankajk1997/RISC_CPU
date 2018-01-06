module accum(clk, rst, alu_out, ldac, acc_out);

input  clk, rst, ldac;
input  [7:0] alu_out;
output [7:0] acc_out;
reg    [7:0] acc_out;
    
    always @ (posedge clk or negedge rst) begin

                if (!rst) begin
                    	acc_out <= 0;
                end else if ( ldac == 1) begin
                        acc_out <= alu_out[7:0];
                end                
      end

endmodule


    
