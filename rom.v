module rom
	(
	input  wire       i_clk,
 
	input  wire [5:0] i_index,
	output reg  [7:0] o_data
	);

	always@(posedge i_clk) begin
		case(i_index)
			0:  o_data <= "H";
			1:  o_data <= "e";
			2:  o_data <= "l";
			3:  o_data <= "l";
			4:  o_data <= "o";
			5:  o_data <= ",";
			//
			6:  o_data <= " ";
			//
			7:  o_data <= "W";
			8:  o_data <= "o";
			9:  o_data <= "r";
			10: o_data <= "l";
			11: o_data <= "d";
			12: o_data <= "!";
			//
			13: o_data <= " ";
			14: o_data <= "\n";
			15: o_data <= "\r"; 
			//
			16: o_data <= "E";
			17: o_data <= "n";
			18: o_data <= "t";
			19: o_data <= "e";
			20: o_data <= "r";
			//
			21: o_data <= " ";
			//
			22: o_data <= "1";
			//
			23: o_data <= " ";
			//
			24: o_data <= "t";
			25: o_data <= "o";
			//
			26: o_data <= " ";
			//
			27: o_data <= "t";
			28: o_data <= "o";
			29: o_data <= "g";
			30: o_data <= "g";
			31: o_data <= "l";
			32: o_data <= "e";
			//
			33: o_data <= " ";
			//
			34: o_data <= "l";
			35: o_data <= "e";
			36: o_data <= "d";
			//
			37: o_data <= "\n";
			38: o_data <= "\r";
			//


		endcase
	end

endmodule