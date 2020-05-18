#include "myLib.h"
#include "font.h"
#include "text.h"
#include "game.h"

// Game mechanic variables
enum States {START, GAME, PAUSE, WIN, LOSE};
int state;
unsigned short oldButtons;
unsigned short buttons;

// Prototypes
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

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    initialize();

    while (1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

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

// Controls the start screen
void startState() {
    initGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        drawInit();
        goToGameState();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPauseState();
    }
}

// Controls the game screen
void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPauseState();
    }
    if (coinsRemaining == 0) {
        goToWinState();
    }
    if (coinsRemaining == -1) {
        goToLoseState();
    }
}

// Controls the pause screen
void pauseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        waitForVBlank();
        drawInit();
        goToGameState();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStartState();
    }
}

// Controls the win screen
void winState() {
    waitForVBlank();
    drawWin();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartState();
    }
}

// Controls the lose screen
void loseState() {
    waitForVBlank();
    drawLose();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartState();
    }
}

// Initalizes start state
void goToStartState() {
    state = START;
    waitForVBlank();
    fillScreen(PURPLE);
    drawRect(54, 90, 16, 62, WHITE);
    drawString(58, 100, "SHRUDEN", CYAN);
    drawString(57, 99, "SHRUDEN", PURPLE);
    drawString(130, 66, "Press START to Play", WHITE);
    drawString(142, 36, "Press SELECT for Instructions", WHITE);
}

// Initalizes all game variables
void goToGameState() {
    waitForVBlank();
    drawGame();
    state = GAME;
}

// Initializes pause state
void goToPauseState() {
    state = PAUSE;
    waitForVBlank();
    fillScreen(WHITE);
    drawRect(16, 6, 94, SCREENWIDTH - 12, PURPLE);
    drawString(24, 9, "Use UP, DOWN, LEFT, and RIGHT to move", WHITE);
    drawString(60, 60, "Collect COINS to win", WHITE);
    drawString(96, 42, "Don't let ENEMIES touch you", WHITE);
    drawString(130, 54, "Press START to Continue", PURPLE);
    drawString(142, 66, "Press SELECT to End", PURPLE);
}

// Initalizes win state
void goToWinState() {
    state = WIN;
    waitForVBlank();
    fillScreen(GREEN);
    drawString(110, 88, "Press START", WHITE);
}

// Initalizes lose state
void goToLoseState() {
    state = LOSE;
    waitForVBlank();
    fillScreen(BLACK);
    drawString(110, 88, "Press START", WHITE);
}

// Initializes background
void initialize() {

    goToStartState();
}