//
//
//
module demo 
	(
	input  wire       i_clk,
	input  wire       i_rst,

	output reg [15:0] o_led,

	input  wire       i_uart_rx,
	output wire       o_uart_tx
	);

	reg         uart_wr, nxt_uart_wr;
	reg  [7:0]  uart_wdata, nxt_uart_wdata; 
 
	wire [7:0]  uart_rdata;
	wire        uart_busy, uart_valid;

	reg  [15:0] nxt_led;

	reg  [5:0]  tx_index, nxt_tx_index;
	wire [7:0]  rom_data;

	reg         STATE, NEXT_STATE;
	localparam  STATE_INITIAL = 0,
	            STATE_IDLE    = 1;

	uart_top 
	#(.CLK_FREQ (100_000_000),
	  .BAUD_RATE(115_200))
	uart_i
	(
    .i_clk     (i_clk),
    .i_rstn    (~i_rst),
   
    .i_wr      (uart_wr),
    .i_data    (uart_wdata),
    .o_busy    (uart_busy),
  
    .o_data    (uart_rdata),
    .o_valid   (uart_valid),

    .o_uart_tx (o_uart_tx),
    .i_uart_rx (i_uart_rx)
	);

	rom rom_i (
    .i_clk     (i_clk),
    .i_index   (tx_index),
    .o_data    (rom_data)
	);

	always@* begin
		nxt_uart_wr    = 0;
		nxt_uart_wdata = 0;
		nxt_tx_index   = tx_index;
		nxt_led        = o_led;
		NEXT_STATE     = STATE;

		case(STATE)

			// print to terminal
			STATE_INITIAL: begin
				nxt_uart_wr    = (!uart_busy);
				nxt_uart_wdata = rom_data;

				if(uart_wr && !uart_busy) begin
					nxt_tx_index = tx_index+1;
				end
				NEXT_STATE = (tx_index > 39) ? STATE_IDLE:STATE_INITIAL;
			end

			STATE_IDLE: begin
				if(uart_valid) begin
					case(uart_rdata)
						"0":  nxt_led[0]  = ~o_led[0];
						"1":  nxt_led[1]  = ~o_led[1];
						"2":  nxt_led[2]  = ~o_led[2];
						"3":  nxt_led[3]  = ~o_led[3];
						"4":  nxt_led[4]  = ~o_led[4];
						"5":  nxt_led[5]  = ~o_led[5];
						"6":  nxt_led[6]  = ~o_led[6];
						"7":  nxt_led[7]  = ~o_led[7];
						"8":  nxt_led[8]  = ~o_led[8];
						"9":  nxt_led[9]  = ~o_led[9];
						"a":  nxt_led[10] = ~o_led[10];
						"b":  nxt_led[11] = ~o_led[11];
						"c":  nxt_led[12] = ~o_led[12];
						"d":  nxt_led[13] = ~o_led[13];
						"e":  nxt_led[14] = ~o_led[14];
						"f":  nxt_led[15] = ~o_led[15];
						"\n": nxt_led     = ~o_led;
					endcase
				end
			end

		endcase
	end

	always@(posedge i_clk) begin
		if(i_rst) begin
			uart_wr    <= 0;
			uart_wdata <= 0;
			tx_index   <= 0;
			o_led      <= 0;
			STATE      <= STATE_INITIAL;
		end
		else begin
			uart_wr    <= nxt_uart_wr;
			uart_wdata <= nxt_uart_wdata;
			tx_index   <= nxt_tx_index;
			o_led      <= nxt_led;
			STATE      <= NEXT_STATE;
		end
	end

endmodule