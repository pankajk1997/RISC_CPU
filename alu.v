module alu (aclk,mdat,acc_out, opcd, alu_out, zr);

input		aclk;
input 	[7:0]  mdat;
input 	[7:0] acc_out;
input 	[2:0] opcd; 
output 	[7:0] alu_out;
output	        zr;

reg [7:0] a;
wire [7:0] alu_out; 
wire zr;
            
     always  @ ( posedge aclk ) begin

         case (opcd) 
             	3'b000 : begin
                        	a  <= acc_out;                     
                	 end
                    
              	3'b001 : begin
  		                a  <=acc_out;                                        
                          end
                        
		3'b010 : begin
                                a  <= {mdat + acc_out};                      
                         end

                3'b011 : begin
                                a <= {mdat & acc_out};
                                        
                         end

                3'b100 : begin
                                a  <= {mdat ^ acc_out};                          
                         end

                3'b101 : begin
                                a  <= mdat;
                                      
                         end
		3'b110 : begin
                                a  <= acc_out;
                                        
                         end
	
	        3'b111 : begin
        	                a <= acc_out;
                                        
                         end              

                default : begin
                           	a <= 0;
                          end
           endcase

     end

       
assign alu_out = a;

assign zr = &(a);              

                  
endmodule
