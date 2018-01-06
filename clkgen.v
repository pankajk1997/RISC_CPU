module clkgen(clk,rstreq,clk1,clk2,fch,rst);

input clk,rstreq;
output clk1,clk2,fch,rst;

wire c1;
reg c2,c3;
reg rst;

	assign c1   = clk && clk;
	assign clk1 = c1;	

	always @(negedge c1 or negedge rstreq) begin

		if (!rstreq) begin
			c2 <= 0;			
		end else begin
			c2 <= ~c2;
		end
	end


	always @(posedge c2 or negedge rstreq) begin
		if(!rstreq) begin
			c3 <= 0;
		end else begin
			c3 <= ~c3;
		end
	end			


	always @(negedge c2 or negedge rstreq) begin
		if(!rstreq) begin
			rst <= 0;
		end else begin
		    if (c3 == 0) begin
			rst <= 1;
		    end
		end
	end 


assign clk2  = c2;
assign fch = c3;


endmodule
