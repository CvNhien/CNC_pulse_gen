module bai3(clk,WR,LS,N,Pulse,Dir,D,flag_T,f_full);
input clk,WR,LS;
input [7:0] N,D;
output Pulse,Dir,flag_T,f_full;
reg pinout1=0,f_full=0,flag_T=0,preWR=0,clk1=0;
reg [7:0] Nx1=8'h0, Nx2=8'h0, Nx3=8'h0, Nx4=8'h0,Nx=8'h0,acc1;
reg [2:0] Nbuff=3'b0;
reg [10:0] temp=11'b0;
reg [5:0] temp2=6'b0;

initial acc1=8'd10;
assign Dir=D[7];
assign Pulse=~clk1 & pinout1;

always@(posedge clk) begin
preWR <= WR;
if(({preWR,WR}==2'b01)&& D&&(~LS)) begin
	if (Nbuff==0) begin
		Nx1=D;Nbuff=1; end
	else if (Nbuff==1) begin
		Nx2=D;Nbuff=2; end
	else if (Nbuff==2) begin
		Nx3=D;Nbuff=3; end
	else if (Nbuff==3) begin
		Nx4=D;Nbuff=4;f_full=1; end
	else f_full=1;
end
if(temp2<6'd50) temp2= temp2+1;
	else begin
	temp2=1;
	clk1=~clk1;
	end	

if(temp<11'd1049) temp= temp+1;
	else begin
			temp=50;
			flag_T=~flag_T;
		if(LS==1) begin
			Nx=8'h0;
		/*	Nx1=8'h0;Nx2=8'h0;Nx3=8'h0;Nx4=8'h0;Nbuff=3'h0;f_full=0;	*/
			end
		else begin	
			if(Nbuff!=0) begin
			Nx=Nx1;	Nx1=Nx2;	Nx2=Nx3;	Nx3=Nx4;	Nx4=0;
			Nbuff=Nbuff-1;	f_full=0;
			end
			else Nx=8'h0;
		end
	end
	if(LS==1)
	begin
		Nx1=8'h0;	Nx2=8'h0;	Nx3=8'h0;	Nx4=8'h0;	Nbuff=3'h0;
		f_full=0;
	end
end

always@(posedge clk1) begin	
	acc1=acc1+Nx[6:0];
	if(acc1>N) begin
		acc1=acc1-N;pinout1=1;
	end
	else pinout1=0;		

end
endmodule
