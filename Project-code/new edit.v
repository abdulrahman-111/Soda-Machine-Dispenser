module a5leha_3la_allah_new(
	input N,D,Q,
	input rst,clk,
	output reg dis,oN,oD,o2D
);

/*  
	Inputs: N (Nickel), D (Dime), Q (Quarter)
    Inputs: rst (Reset), clk (Clock)
    dis (Dispense), oN (Return Nickel),
 	oD (Return Dime), o2D (Return Two Dimes)

*/

reg [5:0] current,next;

parameter s0=0,   // Initial state: 0 cents
		  s5=5,   // State: 5 cents
		  s10=10, // State: 10 cents
		  s15=15,s20=20,s25=25,s30=30,s35=35,s40=40,s45=45;

//Sequential block: Current state transitions

always@(posedge clk ,posedge rst)begin
	if(rst)begin
		current<=s0;   // Asynchronous reset: Go to initial state
	end
	else begin
		current<=next; // Update current state on positive edge of clock
	end
end

//combinational block: next state logic
// Coin inputs: N (Nickel), D (Dime), Q (Quarter)
//3'b100 when nickel inserted , 3'b010 dime inserted , 3'b001 quarter inserted  ,default = no coin inserted

always@(*)begin 

	case(current)
		// Handle coin inputs in state s0
		s0:begin
			case ({N,D,Q})
				3'b100:next=s5;          // Nickel inserted
				3'b010:next=s10;       // Dime inserted
				3'b001:next=s25;     // Quarter inserted
				default:next=s0;   // No coin inserted
			endcase	
		end

		s5:begin
			case ({N,D,Q})
				3'b100:next=s10;
				3'b010:next=s15;
				3'b001:next=s30;
				default: next=s5; // No coin inserted
			endcase	
		end

		s10:begin
			case ({N,D,Q})
				3'b100:next=s15;
				3'b010:next=s20;
				3'b001:next=s35;
				default: next=s10; // No coin inserted
			endcase	
		end

		s15:begin
			case ({N,D,Q})
				3'b100:next=s20;
				3'b010:next=s25;
				3'b001:next=s40;
				default: next=s15; // No coin inserted
			endcase	
		end

		s20:begin
			case ({N,D,Q})
				3'b100:next=s25;
				3'b010:next=s30;
				3'b001:next=s45;
				default: next=s20; // No coin inserted
			endcase	
		end

		s25:begin
			next=s0;	 // Reset to initial state
		end
		s30:begin
			next=s0;     // Reset to initial state
		end 
		s35:begin
			next=s0;     // Reset to initial state
		end
		s40:begin
			next=s0;     // Reset to initial state
		end
		s45:begin
			next=s0;     // Reset to initial state
		end
		default: next =current;// Default case to avoid latches
	endcase
end



// Combinational block: Output logic
// Outputs depend on the current state

always@(*)begin
    // Default output values
	dis=0; oN=0; oD=0; o2D=0; 

	case(current)

		s25:begin
			dis=1;	// Dispense soda
		end

		s30:begin
			dis=1;oN=1;		// Dispense soda + Return 1 Nickel
		end

		s35:begin
			dis=1; oD=1;	// Dispense soda + Return 1 Dime
		end

		s40:begin
			dis=1;oN=1;oD=1;	// Dispense soda + Return 1 Nickel + 1 Dime
		end

		s45:begin
			dis=1;o2D=1;	// Dispense soda + Return 2 Dimes
		end

	endcase
end 
endmodule

