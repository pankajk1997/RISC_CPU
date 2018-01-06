module memory(rst,mrd,mwr,ewr,mad,ead,edat,mdat);

input rst;
input mrd;
input mwr;
input ewr;
input [4:0] mad;
input [4:0] ead;
input [7:0] edat;

inout [7:0] mdat;


reg [7:0] memr [31:0] ;
reg [7:0] temp;

always @(*) begin

	if (!rst) begin
		if(ewr == 1) begin
			memr[ead] <= edat;
		end
	end else begin
		if(mwr == 1) begin
			memr[mad] <= mdat;
		end else if (mrd == 1) begin
			temp <= memr[mad];
		end else begin
			temp <= 'bzzzzzzzz;
		end
	end
end

assign mdat = temp;

endmodule
