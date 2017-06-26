#include <stdio.h>
#include <wiringPiSPI.h>
// Configure SPI the interface.
// CHANNEL indicates chip select
int CHANNEL = 1; 
//should match PModADC clock of 10MHz
int BUS_SPEED = 10000000;
wiringPiSPISetup(CHANNEL, BUS_SPEED);
//File Input
FILE *file;
file = fopen('data_file.txt', 'r');
if(file == NULL) {
	perror("Error in opening file");
	return -1;
}
//we need only one character at a time
unsigned char buffer[1]={0};
int character;
while(true) {
	//Read character
	character = fgetc(file);
    //break when we reach file end
	if(fgetc(file)) break; 
	//encode
	buffer[0] = character;
	//send via SPI
	wiringPiSPIDataRW(CHANNEL, buffer, 1);
}
file.close()