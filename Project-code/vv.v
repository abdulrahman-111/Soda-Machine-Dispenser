module vproj();
reg rst,clk;
reg[2:0]in;
wire dis,oN,oD,o2D;
a5leha_3la_allah dut (.rst(rst),.clk(clk),.in(in),.dis(dis),.oN(oN),.oD(oD),.o2D(o2D));

//clk 
initial begin
	clk=0; 
	forever begin
		#10
		clk=~clk; 
	end
end
//cases

initial begin
rst=1;in=0;
@(negedge clk);
rst=0;


//1st case
repeat(5)begin
in=4;//nickel inserted 
@(negedge clk);
end
in=0;
@(negedge clk);
//2nd case
in=4;//nickel inserted 
@(negedge clk);
repeat(2)begin
in=2;//dime inserted 
@(negedge clk);
end

in=0;
@(negedge clk);


//3rd case
in=4;//nickel inserted 
@(negedge clk);
in=1;//quarter inserted 
@(negedge clk);

in=0;
@(negedge clk);


//4th case
rst=0;
in=4;//nickel inserted 
@(negedge clk);
in=2;//dime inserted 
@(negedge clk);
in=1;//quarter inserted 
@(negedge clk);

in=0;
@(negedge clk);


//5th case
in=4;//nickel inserted 
@(negedge clk);
in=2;//dime inserted 
@(negedge clk);
in=4;//nickel inserted 
@(negedge clk);
in=1;//quarter inserted 
@(negedge clk);


in=0;
@(negedge clk);

//6th case
in=2;//dime inserted 
@(negedge clk);
in=1;//quarter inserted 
@(negedge clk);
@(negedge clk);
in=0;
@(negedge clk);

//5th case again
in=4;//nickel inserted 
@(negedge clk);
in=2;//dime inserted 
@(negedge clk);
in=4;//nickel inserted 
@(negedge clk);
in=1;//quarter inserted 
@(negedge clk);


in=0;
@(negedge clk);

//1st case again 
repeat(5)begin
in=4;//nickel inserted 
@(negedge clk);
end
in=0;
@(negedge clk);
/*
//case to test the reset in between case 1 and transtion to case 4 
repeat(3)begin
in=4;//nickel inserted 
@(negedge clk);
end
//4th case
rst=1;
@(negedge clk);

rst=0;
in=4;//nickel inserted 
@(negedge clk);
in=2;//dime inserted 
@(negedge clk);
in=1;//quarter inserted 
@(negedge clk);
*/
	$stop;
end
endmodule 