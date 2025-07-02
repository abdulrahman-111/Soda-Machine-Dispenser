module a5leha_3la_allah(
	input [2:0]in,
	input rst,clk,
	output reg dis,oN,oD,o2D
	);

reg [5:0] current,next;
parameter s0=0,s5=5,s10=10,s15=15,s20=20,s25=25,s30=30,s35=35,s40=40,s45=45;

//sequntial current state transitions
always@(posedge clk ,posedge rst)begin
	if(rst)begin
		current<=s0;
	end
	else begin
		current<=next;
	end
end
//combinational next state\

//in=4 when nickel in =2 dime in=1 quarter /default = no coin inserted

always@(*)begin 
	case(current)
		s0:begin
			case (in)
				3'b100:next=s5;
				3'b010:next=s10;
				3'b001:next=s25;
				default:next=s0;
			endcase	
		end
		s5:begin
			case (in)
				3'b100:next=s10;
				3'b010:next=s15;
				3'b001:next=s30;
				default: next=s5;
			endcase	
		end
		s10:begin
			case (in)
				3'b100:next=s15;
				3'b010:next=s20;
				3'b001:next=s35;
				default: next=s10;
			endcase	
		end
		s15:begin
			case (in)
				3'b100:next=s20;
				3'b010:next=s25;
				3'b001:next=s40;
				default: next=s15;
			endcase	
		end
		s20:begin
			case (in)
				3'b100:next=s25;
				3'b010:next=s30;
				3'b001:next=s45;
				default: next=s20;
			endcase	
		end
		s25:begin
				next=s0;
				
		end
		s30:begin
			next=s0;
		end
		s35:begin
			next=s0;
		end
		s40:begin
			next=s0;
		end
		s45:begin
			next=s0;
		end
		default: next =current;
	endcase
end
//combinational output 

always@(*)begin
dis=0; oN=0; oD=0; o2D=0; 
case(current)
s25:begin
	dis=1;
end
s30:begin
	dis=1;oN=1;
end
s35:begin
	dis=1; oD=1;
end
s40:begin
	dis=1;oN=1;oD=1;
end
s45:begin
	dis=1;o2D=1;
end
endcase
end 
endmodule
