# UART_and_phraser_test
An example of phrasing incoming bytes from an UART

This project demostrates utilisation of a phraser module for formating incoming bytes from an UART.
The phraser module takes the first byte and stores it in the data buffer, the second byte is stored in the address buffer,
and at the falling edge of the second clock pulse, the data is writen to the cheche memmory using the value in the address buffer
as the index.

THe incoming data should be formated in the order; 1. data, 2. address

The UART module is a MIT liscence IP from https://opencores.org/projects/osdvu and I claim no rights to it.

