`timescale 1ns / 1ps


module data_first_UART_to_memmory(
    input [7:0]incoming_byte, input received, output memmory_write, reg [7:0] data, reg [7:0] address
 );
 
//reg [7:0] data = 0; //register to hold the first byte
//reg [7:0] address = 0;  //register to hold second byte
reg register_pointer = 0;   //register to count the bytes
reg [7:0] memmory [255:0];  //memory to buffer the incoming data

//buffering and counting the incoming bytes
always@(posedge received)begin
    register_pointer <= register_pointer + 1;
    
    if(!register_pointer)begin
        data <= incoming_byte;
    end
    if(register_pointer)begin
        address <= incoming_byte;
    end
end  
/*
//storing buffered bytes to memmory  
always@(negedge received)begin
        if(!register_pointer)begin
            memmory[address] <= data;
        end
    end
*/
assign memmory_write = (!received & !register_pointer);

endmodule


