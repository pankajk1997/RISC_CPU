module mux2_1(adir, adpc, fch, admem);

input [4:0] adir;
input [4:0] adpc;
input fch;
output [4:0] admem;

reg [4:0] admem;

    always @ (fch,adpc,adir) begin
        
        case (fch)
            1'b1 : admem = adpc; 
          
            1'b0 : admem = adir;
        endcase
    end

endmodule
