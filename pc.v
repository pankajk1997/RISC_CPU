module pc( pclk, rst, adir, ldpc, adpc);
    
input pclk, rst;
input ldpc;
input [4:0] adir;
output [4:0] adpc;

reg [4:0] temp1;

             always @ (posedge pclk or negedge rst) begin

                   if  (!rst) begin

                        temp1 <= 0;

                   end else if  ( ldpc == 1) begin
                        
                        temp1 <= adir;

                   end else begin
                        
                        temp1 <= temp1 + 1;
                   end    
                    
             end


assign adpc = temp1;

endmodule


    
    
