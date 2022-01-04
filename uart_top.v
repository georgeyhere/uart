//
//
//
module uart_top 
    #(parameter CLK_FREQ  = 125_000_000,
      parameter BAUD_RATE = 115_200)
    (
    input  wire       i_clk,
    input  wire       i_rstn,
    
    // UART TX control
    input  wire       i_wr,
    input  wire [7:0] i_data,
    output wire       o_busy,

    // UART RX data
    output wire [7:0] o_data,
    output wire       o_valid,

    // UART interface
    output wire       o_uart_tx,
    input  wire       i_uart_rx
    );

    localparam CLKS_PER_BAUD = CLK_FREQ/BAUD_RATE;

    uart_tx 
    #(.CLKS_PER_BAUD(CLKS_PER_BAUD))
    tx_i (
    .i_clk       (i_clk),
    .i_rstn      (i_rstn),
     
    .i_wr        (i_wr),
    .i_data      (i_data),
  
    .o_uart_tx   (o_uart_tx),
    .o_busy      (o_busy)
    );

    uart_rx 
    #(.CLKS_PER_BAUD(CLKS_PER_BAUD))
    rx_i (
    .i_clk       (i_clk),
    .i_rstn      (i_rstn),
 
    .i_rx        (i_uart_rx),
    .o_rx_data   (o_data),
    .o_rx_dvalid (o_valid)
    );


endmodule