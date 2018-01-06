module topmodule(clk,rstreq,ewr,ead,edat,zr);

input clk;
input rstreq;
input  ewr;
input [4:0] ead;
input [7:0] edat;
output zr;
wire zr;

wire clk1;
wire clk2;
wire fch;
wire rst;
wire [7:0] alu_out;
wire [7:0] acc_out;
wire ldac;
wire ldir;
wire [7:0] mdat;
wire [4:0] adir;
wire [2:0] opcd;
wire [4:0] adpc;
wire [4:0] admem;
wire ldpc;
wire pclk;
wire aclk;
wire mrd;
wire mwr;
//wire [4:0] mad;


iobuffer io1( .clk2(clk2), .mrd(mrd) , .fch(fch), .alu_out(alu_out), .mdat(mdat));

accum    accum1( .clk(clk1), .rst(rst), .alu_out(alu_out), .ldac(ldac) , .acc_out(acc_out));

clkgen   clkgen1( .clk(clk), .rstreq(rstreq), .clk1(clk1), .clk2(clk2), .fch(fch), .rst(rst));

decode   decoder1( .clk1(clk1),.clk2(clk2),.fch(fch), .rst(rst), .opcd(opcd),.ldir(ldir),.ldac(ldac),.mrd(mrd),.mwr(mwr),.ldpc(ldpc),.pclk(pclk),.aclk(aclk));

instreg  instreg1( .clk(clk1) , .rst(rst), .ldir(ldir), .mdat(mdat), .adir(adir), .opcd(opcd));

alu      alu1( .aclk(aclk) , .mdat(mdat) , .acc_out(acc_out) , .opcd(opcd) , .alu_out(alu_out) , .zr(zr) );

memory   mem1(.rst(rst) , .mrd(mrd) , .mwr(mwr) , .ewr(ewr), .mad(admem), .ead(ead), .edat(edat), .mdat(mdat));

pc       pc1( .pclk(pclk), .rst(rst), .adir(adir), .ldpc(ldpc), .adpc(adpc));

mux2_1   mux2( .adir(adir), .adpc(adpc), .fch(fch) , .admem(admem));


endmodule

