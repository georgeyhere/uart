module demo_tb ();

	reg i_clk, i_rstn;
	wire o_led;
	reg  i_uart_rx;
	wire o_uart_tx;

	demo DUT(
    .i_clk     (i_clk),
    .i_rstn    (i_rstn),
    .o_led     (o_led),
    .i_uart_rx (o_uart_tx),
    .o_uart_tx (o_uart_tx)
	);

	always#(4) i_clk = ~i_clk;

	initial begin
		i_clk  = 0;
		i_rstn = 0;
		#100;
		i_rstn = 1;
	end

endmodule