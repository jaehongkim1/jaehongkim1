`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:35 03/08/2022 
// Design Name: 
// Module Name:    Bsync 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Bsync(

	input		IO_SYS_CLK,
	input		IO_RESET_KEY,
	input		IO_MODE_KEY,
	output	reg IO_BSYNC_OUT,
	output	reg LED1,
	output	reg LED2
//	output	LED_MANU,
//	output	LED_AUTO,
//	output	LED_LOAD
	);
reg[33:0]	cnt;
reg			mode;	
reg[33:0]	mo_cnt;
//always?
always @(posedge IO_SYS_CLK)
begin
	cnt <= cnt+1;
	LED1 <= IO_BSYNC_OUT ;
	if (IO_RESET_KEY == 0)
	begin	
		LED1 <= 0;
		LED2 <= 0;
//		LED_MANU <= 0;
//		LED_AUTO <= 1;
//		LED_LOAD <= 0;
		cnt <= 0;
		IO_BSYNC_OUT <= 0;
		mode <= 0;
	end
//mode ют╥б
	else if (IO_MODE_KEY == 0)
	begin
		mo_cnt <= mo_cnt+1;
		if (mo_cnt == 10000000)
		begin
			mode <= mode +1 ;
			mo_cnt <= 0;
			cnt <= 0;
			LED2 <= ~LED2;
		end
		if (mode == 11)
		begin
			mode <= 0;
		end
	end	
	else if (IO_MODE_KEY == 1)
	begin
		mo_cnt <= 0;
	end
	else 
	begin
	case(mode)
	// 55hz
//		if(mode == 0)
	0:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 90909)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 909090)
			begin
				cnt <= 0;
			end
		end
	// 56hz
//		if(mode == 1)
	1:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 89285)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 892857)
			begin
				cnt <= 0;
			end		
		end
	// 57hz
//		if(mode == 2)
	2:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 87719)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 877192)
			begin
				cnt <= 0;
			end		
		end
	// 58hz
//		if(mode == 3)
	3:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 86206)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 862068)
			begin
				cnt <= 0;
			end		
		end
	// 59hz
//		if(mode == 4)
	4:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 84745)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 847457)
			begin
				cnt <= 0;
			end		
		end
	// 60hz
//		if(mode == 5)
	5:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 83333)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 833333)
			begin
				cnt <= 0;
			end	
		end
	// 61hz
//		if(mode == 6)
	6:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 80000)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 819672)
			begin
				cnt <= 0;
			end	
		end
	// 62hz
//		if(mode == 7)
	7:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 80645)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 806451)
			begin
				cnt <= 0;
			end		
		end
	// 63hz
//		if(mode == 8)
	8:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 79365)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 793650)
			begin
				cnt <= 0;
			end		
		end
	// 64hz
//		if(mode == 9)
	9:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 78125)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 781250)
			begin
				cnt <= 0;
			end
		end
	// 65hz
//		if(mode == 10)
	10:
		begin
			if(cnt == 0)
			begin
				IO_BSYNC_OUT <= 1;
			end
			if(cnt == 76923)
			begin
				IO_BSYNC_OUT <= ~IO_BSYNC_OUT;
			end
			if(cnt == 769230)
			begin
				cnt <= 0;
			end
		end
	default :
	begin
			mode <= 0;
	end
	endcase
	end
end	
	


endmodule
