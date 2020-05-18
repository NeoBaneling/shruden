# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 40 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 78 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 118 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "main.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 4 "main.c" 2
# 1 "game.h" 1

typedef struct {
    int row;
    int col;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} PLAYER;


typedef struct {
    int row;
    int col;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} ENEMY;


typedef struct {
    int row;
    int col;
    int vRow;
    int vCol;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} OBSTACLE;


typedef struct {
    int row;
    int col;
    unsigned short color;
    int active;
} COIN;






extern PLAYER player;
extern ENEMY enemy;
extern OBSTACLE obstacle;
extern COIN coins[8];
extern int coinsRemaining;


void initGame();
void updateGame();
void drawInit();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initCoins();
void updateCoin(COIN*);
void drawCoin(COIN*);

void initEnemy();
void updateEnemy();
void drawEnemy();

void initObstacle();
void updateObstacle();
void drawObstacle();

void drawWin();
void drawLose();

void checkPlayerWallCollision();
void checkEnemyWallCollision();
void checkObstacleCollision();
void checkPlayerCoinCollision();
void checkPlayerEnemyCollision();
# 5 "main.c" 2


enum States {START, GAME, PAUSE, WIN, LOSE};
int state;
unsigned short oldButtons;
unsigned short buttons;


void goToStartState();
void goToGameState();
void goToPauseState();
void goToWinState();
void goToLoseState();

void startState();
void gameState();
void pauseState();
void winState();
void loseState();

void initialize();

int main() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    initialize();

    while (1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch(state) {
            case(START):
                startState();
                break;
            case(GAME):
                gameState();
                break;
            case(PAUSE):
                pauseState();
                break;
            case(WIN):
                winState();
                break;
            case(LOSE):
                loseState();
                break;
        }
    }
}


void startState() {
    initGame();
    if (((!(~oldButtons & ((1<<3))) && (~buttons & ((1<<3)))))) {
        drawInit();
        goToGameState();
    }
    if (((!(~oldButtons & ((1<<2))) && (~buttons & ((1<<2)))))) {
        goToPauseState();
    }
}


void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (((!(~oldButtons & ((1<<3))) && (~buttons & ((1<<3)))))) {
        goToPauseState();
    }
    if (coinsRemaining == 0) {
        goToWinState();
    }
    if (coinsRemaining == -1) {
        goToLoseState();
    }
}


void pauseState() {
    if (((!(~oldButtons & ((1<<3))) && (~buttons & ((1<<3)))))) {
        waitForVBlank();
        drawInit();
        goToGameState();
    }
    if (((!(~oldButtons & ((1<<2))) && (~buttons & ((1<<2)))))) {
        goToStartState();
    }
}


void winState() {
    waitForVBlank();
    drawWin();
    if (((!(~oldButtons & ((1<<3))) && (~buttons & ((1<<3)))))) {
        goToStartState();
    }
}


void loseState() {
    waitForVBlank();
    drawLose();
    if (((!(~oldButtons & ((1<<3))) && (~buttons & ((1<<3)))))) {
        goToStartState();
    }
}


void goToStartState() {
    state = START;
    waitForVBlank();
    fillScreen(((15) | (4)<<5 | (21)<<10));
    drawRect(54, 90, 16, 62, ((31) | (31)<<5 | (31)<<10));
    drawString(58, 100, "SHRUDEN", ((0) | (31)<<5 | (31)<<10));
    drawString(57, 99, "SHRUDEN", ((15) | (4)<<5 | (21)<<10));
    drawString(130, 66, "Press START to Play", ((31) | (31)<<5 | (31)<<10));
    drawString(142, 36, "Press SELECT for Instructions", ((31) | (31)<<5 | (31)<<10));
}


void goToGameState() {
    waitForVBlank();
    drawGame();
    state = GAME;
}


void goToPauseState() {
    state = PAUSE;
    waitForVBlank();
    fillScreen(((31) | (31)<<5 | (31)<<10));
    drawRect(16, 6, 94, 240 - 12, ((15) | (4)<<5 | (21)<<10));
    drawString(24, 9, "Use UP, DOWN, LEFT, and RIGHT to move", ((31) | (31)<<5 | (31)<<10));
    drawString(60, 60, "Collect COINS to win", ((31) | (31)<<5 | (31)<<10));
    drawString(96, 42, "Don't let ENEMIES touch you", ((31) | (31)<<5 | (31)<<10));
    drawString(130, 54, "Press START to Continue", ((15) | (4)<<5 | (21)<<10));
    drawString(142, 66, "Press SELECT to End", ((15) | (4)<<5 | (21)<<10));
}


void goToWinState() {
    state = WIN;
    waitForVBlank();
    fillScreen(((0) | (31)<<5 | (0)<<10));
    drawString(110, 88, "Press START", ((31) | (31)<<5 | (31)<<10));
}


void goToLoseState() {
    state = LOSE;
    waitForVBlank();
    fillScreen(0);
    drawString(110, 88, "Press START", ((31) | (31)<<5 | (31)<<10));
}


void initialize() {

    goToStartState();
}
