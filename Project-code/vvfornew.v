module vprojnew();
// Declare registers and wires
reg rst,clk;
reg N,D,Q;
wire dis,oN,oD,o2D;
// Instantiate the FSM module
a5leha_3la_allah_new dut (
						  .rst(rst), .clk(clk),
						  .N(N), .Q(Q), .D(D),
						  .dis(dis),
						  .oN(oN), .oD(oD), .o2D(o2D)
						  );

 // clock signal
 initial begin
	clk=0; 
	forever begin
		#10
		clk=~clk; 
	end
end

// Testbench to apply input cases
initial begin
 	// Initialize signals
	rst=1; N=0; D=0; Q=0;
	@(negedge clk);		// Wait for a negative clock edge
	rst=0;		// Release reset signal


	// Test Case 1: Insert 5 Nickels

	repeat(5)begin
		assign {N,D,Q} =3'b100; 	//nickel inserted 
		@(negedge clk);
	end

	assign {N,D,Q} =3'b000;			// Clear inputs
	@(negedge clk);

	// Test Case 2: Insert 1 Nickel and 2 Dimes

	assign {N,D,Q} =3'b100; 		//nickel inserted 
	@(negedge clk);
	repeat(2)begin
		assign {N,D,Q} =3'b010; 	//dime inserted 
		@(negedge clk);
	end

	assign {N,D,Q} =3'b000;			// Clear inputs
	@(negedge clk);


	// Test Case 3: Insert 1 Nickel and 1 Quarter
	assign {N,D,Q} =3'b100;//nickel inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b001;//quarter inserted 
	@(negedge clk);

	assign {N,D,Q} =3'b000;			// Clear inputs
	@(negedge clk);


	// Test Case 4: Insert 1 Nickel, 1 Dime, and 1 Quarter
	
	assign {N,D,Q} =3'b100;//nickel inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b010;//dime inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b001;//quarter inserted 
	@(negedge clk);

	assign {N,D,Q} =3'b000;			// Clear inputs
	@(negedge clk);


	// Test Case 5: Insert 1 Nickel, 1 Dime, 1 Nickel, and 1 Quarter

	assign {N,D,Q} =3'b100;//nickel inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b010;//dime inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b100;//nickel inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b001;//quarter inserted 
	@(negedge clk);

	assign {N,D,Q} =3'b000;			// Clear inputs
	@(negedge clk);

	// Test Case 6: Insert 1 Dime and 1 Quarter

	assign {N,D,Q} =3'b010;//dime inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b001;//quarter inserted 
	@(negedge clk);


	assign {N,D,Q} =3'b000;			// Clear inputs
	@(negedge clk);

    // Repeat Test Case 5 for additional validation

	assign {N,D,Q} =3'b100;//nickel inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b010;//dime inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b100;//nickel inserted 
	@(negedge clk);
	assign {N,D,Q} =3'b001;//quarter inserted 
	@(negedge clk);


	assign {N,D,Q} =3'b000;			// Clear inputs
	@(negedge clk);

	// End simulation
	$stop;
end
endmodule 
