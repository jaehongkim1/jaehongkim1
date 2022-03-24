`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:33:25 03/08/2022
// Design Name:   Bsync
// Module Name:   D:/ISE FILE/BSYNC/Bsync_test.v
// Project Name:  BSYNC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Bsync
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Bsync_test;

	// Inputs
	reg IO_SYS_CLK;
	reg IO_RESET_KEY;
	reg IO_MODE_KEY;
	// Outputs
	wire IO_BSYNC_OUT;
	wire LED1;
	wire LED2;
	// Instantiate the Unit Under Test (UUT)
	Bsync uut (
		.IO_SYS_CLK(IO_SYS_CLK), 
		.IO_RESET_KEY(IO_RESET_KEY), 
		.IO_BSYNC_OUT(IO_BSYNC_OUT), 
		.LED1(LED1),
		.LED2(LED2),
		.IO_MODE_KEY(IO_MODE_KEY)
	);

	always begin
		#1	IO_SYS_CLK = !IO_SYS_CLK;
	end
	
	initial begin
		// Initialize Inputs
		IO_SYS_CLK = 0;
		IO_RESET_KEY = 0;
		IO_MODE_KEY = 1;
		#100
		IO_RESET_KEY = 1;
		#50
		
		IO_MODE_KEY = 0;
		#21000000
		IO_MODE_KEY = 1;
		#3000000000
		IO_MODE_KEY = 0;
		#21000000
		IO_MODE_KEY = 1;
	end
      
endmodule

