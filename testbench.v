module testbench();

reg  clk;
reg rstreq;
reg  ewr;
reg [4:0] ead;
reg [7:0] edat;
wire zr;


int i;

topmodule dut11(clk,rstreq,ewr,ead,edat,zr);



initial begin
	rstreq  =  1;
	#12;	
	@(negedge clk);
	  rstreq = 0;

	#12;	ewr = 1'd1;
	
	#12;    ead = 5'd1;

	//int i ;	
	
	//repeat(31) begin
	for (int i=0; i<32; i = i+1) begin	
		
		ead = i;
		edat   = $random();
		@(negedge clk);
		
	end
	
	  rstreq = 1;
	@(negedge clk);
		


	

		
	#1000;
	$finish;

end




initial begin
		      clk =0;
	forever  # 5  clk = !clk;
end


initial begin
  $fsdbDumpfile("./wave_risccpu.fsdb");
  $fsdbDumpvars(0,testbench);
end


endmodule

