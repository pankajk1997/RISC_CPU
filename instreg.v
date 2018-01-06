module instreg(clk,rst,ldir,mdat,adir,opcd);

input   clk;
input   ldir;
input	rst;
input   [7:0] mdat;
output  [4:0] adir;
output  [2:0] opcd;
reg     [4:0] adir;
reg 	[2:0] opcd;
    
    always @(posedge clk or negedge rst) begin
	if (!rst) begin	
		opcd <= 0;
		adir <= 0;	
        end else if (ldir == 1) begin
              	opcd <= mdat[7:3] ; 
      	      	adir <= mdat[2:0] ;
        end
    end

endmodule
