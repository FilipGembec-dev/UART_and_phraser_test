`timescale 1ns / 1ps


module top(
    input master_sys_clock, output uart_rxd_out, input uart_txd_in, input [7:0]ja, output [7:0]jb
    );
        
    reg _50MHZ_sys_clock;   //50MHZ system clock net
    
    //100 -> 50 MHZ frequency devider
    always@(posedge master_sys_clock)begin
        _50MHZ_sys_clock <= !_50MHZ_sys_clock;
    end
    
    wire [7:0] rx_byte0;    //incoming byte net
    wire [7:0] tx_byte0;    //outgoing byte net
    
    assign rx_byte0 = tx_byte0; // returning the byte to the sender
    assign transmit0 = received0; //tying the received signal to transmit signal
    
    //UART block
    uart uart_0 (_50MHZ_sys_clock, rst0, rx0, tx0, transmit0, tx_byte0, received0, rx_byte0, is_receiving0, is_transmitting0, recv_error0); //sending uart
   
    wire [7:0] data;
    wire [7:0] address;
    reg [7:0] mem [255:0];
   
    //UART phraser
    data_first_UART_to_memmory(rx_byte0, received0, memmory_write, data, address);

    always@(posedge memmory_write)begin
        mem[address] <= data;
    end

    //assigning the uart pins to outside pins
    assign uart_rxd_out = tx0;  
    assign uart_txd_in = rx0;
    
    assign jb = mem[ja];
    
endmodule
