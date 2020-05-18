#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

DMA *dma = (DMA *)0x40000B0;

void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {
    for (int i = 0; i < height; i++) {
        volatile unsigned short c = color;
        dma[3].cnt = 0;
        dma[3].src = &c;
        dma[3].dst = &videoBuffer[OFFSET(row + i, col, SCREENWIDTH)];
        dma[3].cnt = DMA_ON | DMA_SOURCE_FIXED | width;
    }
}

void fillScreen(unsigned short color) {
    volatile unsigned short c = color;
    dma[3].cnt = 0;
    dma[3].src = &c;
    dma[3].dst = videoBuffer;
    dma[3].cnt = DMA_ON | DMA_SOURCE_FIXED | 38400;
}

void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;
    dma[channel].src = &src;
    dma[channel].dst = &dst;
    dma[channel].cnt = cnt | DMA_ON;
}

int collision(int rowA, int colA, int heightA, int widthA,
    int rowB, int colB, int heightB, int widthB) {

    return (rowA < (rowB + heightB - 1)) && ((rowA + heightA - 1) > (rowB))
        && (((colA) < (colB + widthB - 1)) && (colA + widthA - 1) > (colB));
}