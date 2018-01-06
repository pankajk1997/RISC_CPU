module decode(clk1,clk2,fch,rst,opcd,ldir,ldac,mrd,mwr,ldpc,pclk,aclk);

input clk1;
input clk2;
input rst;
input fch;
input [2:0] opcd;

output ldir;
output ldac;
output mrd;
output mwr;
output ldpc;

output pclk;
output aclk;



reg  aclk;
wire [2:0] seq;
reg [7:0] dout;

assign seq = {clk1,clk2,fch};

always @(*) begin

	if(!rst) begin
		dout = 0;
	end else begin

		case(seq) 
			3'b011	: begin
					dout =  6'b000000;
			  	  end 	
			3'b111	: begin
					dout =  6'b000010;
				  end 	
			3'b001	: begin
					dout =  6'b000011;
				  end 	
			3'b101	: begin
					dout =  6'b000011;
				  end 	
			3'b010	: begin
					dout =  6'b000000;
				  end 	
			3'b110	: begin

				   case(opcd) 
	
					3'b010 : begin
							dout =  6'b100010;
				  		  end 	
					3'b011 : begin
							dout =  6'b100010; 
						  end
					3'b100 : begin
							dout =  6'b100010; 
						  end
					3'b101 : begin
							dout =  6'b100010; 
						  end
					default : begin
							dout =  6'b100000; 
						  end
				    endcase
			           end
			3'b000	: begin

				   case(opcd) 
	
					3'b010 : begin
							dout =  6'b010010;
				  		  end 	
					3'b011 : begin
							dout =  6'b010010; 
						  end
					3'b100 : begin
							dout =  6'b010010; 
						  end
					3'b101 : begin
							dout =  6'b010010; 
						  end
					3'b110 : begin
							dout =  6'b000100; 
						  end
					3'b001 : begin
							dout =  6'b100000; 
						  end
					3'b111 : begin
							dout =  6'b001000; 
						  end

					default : begin
							dout =  6'b000000; 
						  end
				    endcase
			           end
			3'b100	: begin

				   case(opcd) 
	
					3'b010 : begin
							dout =  6'b010010;
				  		  end 	
					3'b011 : begin
							dout =  6'b010010; 
						  end
					3'b100 : begin
							dout =  6'b010010; 
						  end
					3'b101 : begin
							dout =  6'b010010; 
						  end
					3'b001 : begin
							dout =  6'b100000; 
						  end
					3'b111 : begin
							dout =  6'b101000; 
						  end
					3'b110 : begin
							dout =  6'b000100; 
						  end

					default : begin
							dout =  6'b000000; 
						  end
				    endcase
				end
		
		endcase
	end
end


assign ldir = dout[0];
assign mrd   = dout[1];
assign mwr  = dout[2];
assign ldpc = dout[3];
assign ldac = dout[4];
assign pclk = dout[5];


always @(*) begin
	if(!rst) begin
		aclk = 0;
	end else begin
		case(seq) 

			3'b100  : aclk = 0;
			
			default : aclk = 1;

		endcase
	end
end


endmodule
