# uart
 
This is a UART module created to provide basic serial port capabilities. 

__Instantiation Template__
```
uart_top 
#(.CLK_FREQ (), // input clock frequency
  .BAUD_RATE()) // desired baud rate
uart_i
(
.i_clk     (),  // input clock
.i_rstn    (),  // synchronous active low reset

.i_wr      (),  // Tx enable
.i_data    (),  // Tx data
.o_busy    (),  // Tx busy flag; indicates transmit in progress

.o_data    (),  // Rx data
.o_valid   (),  // Rx data valid flag
 
.o_uart_tx (),  // UART Tx pin
.i_uart_rx ()   // UART Rx pin
);
```

<h1> Files in this Repository </h1>

__uart_rx.v__
- UART Rx module

__uart_tx.v__ 
- UART Tx module

__uart_top.v__
- Wraps uart_tx and uart_rx into a single block

__demo.v__
- An example design that toggles LEDs on Nexys 7 dev board based on UART inputs

__rom.v__
- A ROM containing ascii text for demo.v

__uart.xdc__
- Constraints file for demo.v

__demo_tb.v__
- A very barebones testbench that was used to check traces
