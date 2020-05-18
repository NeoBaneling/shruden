#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
PLAYER player;
ENEMY enemy;
OBSTACLE obstacle;
COIN coins[COINCOUNT];
int coinsRemaining;

void initGame() {
    initPlayer();
    initCoins();
    initEnemy();
    initObstacle();
}

// Updates game logic
void updateGame() {
    updatePlayer();
    updateEnemy();
    updateObstacle();

    // collision checks
    checkPlayerWallCollision();
    checkEnemyWallCollision();
    checkObstacleCollision();
    checkPlayerCoinCollision();
    checkPlayerEnemyCollision();
}

void drawInit() {
    fillScreen(BG_COLOR);
    // Border
    drawRect(0, 0, SCREENHEIGHT, 2, PURPLE);
    drawRect(0, SCREENWIDTH - 2, SCREENHEIGHT, 2, PURPLE);
    drawRect(0, 0, 2, SCREENWIDTH, PURPLE);
    drawRect(SCREENHEIGHT - 2, 0, 2, SCREENWIDTH, PURPLE);
}

// Redraws all game logic
void drawGame() {
    for (int i = 0; i < COINCOUNT; i++) {
        if (coins[i].active) {
            drawCoin(&coins[i]);
        }
    }
    drawPlayer();
    drawObstacle();
    drawEnemy();

    // Update Player, Enemy, and Obstacle previous variables
    player.oldRow = player.row;
    player.oldCol = player.col;

    enemy.oldRow = enemy.row;
    enemy.oldCol = enemy.col;

    obstacle.oldRow = obstacle.row;
    obstacle.oldCol = obstacle.col;
}

// Initializes player variables
void initPlayer() {
    player.row = SCREENHEIGHT / 2 - 4;
    player.col = SCREENWIDTH / 3 - 4;
    player.height = 8;
    player.oldRow = 2;
    player.oldCol = 2;
    player.color1 = CYAN;
    player.color2 = BLUE;
}

// Updates player variables based on input
void updatePlayer() {
    if (BUTTON_HELD(BUTTON_UP)) {
        player.row -= 2;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.col -= 2;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.col += 2;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.row += 2;
    }
}

// Draw Player Icon
void drawPlayer() {
    int row = player.row;
    int col = player.col;
    int height = player.height;
    unsigned short color1 = player.color1;
    unsigned short color2 = player.color2;

    // Erase old player
    drawRect(player.oldRow, player.oldCol, height, height, BG_COLOR);

    // Draw current player
    drawRect(row, col, height, height, color1);

    // Eyebrows
    drawRect(row + 1, col + 1, 1, 2, color2);
    drawRect(row + 1, col + 5, 1, 2, color2);

    // Eyes
    drawRect(row + 2, col + 1, 2, 2, WHITE);
    drawRect(row + 2, col + 5, 2, 2, WHITE);

    // Mouth
    drawRect(row + 6, col + 5, 1, 1, color2);

    // Pupils
    int pupilUp = (row < player.oldRow) ? -1 : 0;
    int pupilRight = (col > player.oldCol) ? 1 : 0;
    int pupilLeft = (col < player.oldCol) ? -1 : 0;
    drawRect(row + 3 + pupilUp, col + 2 + pupilLeft, 1, 1, BLACK);
    drawRect(row + 3 + pupilUp, col + 5 + pupilRight, 1, 1, BLACK);
}

// Initialize coins in coins array
void initCoins() {
    coinsRemaining = COINCOUNT;
    for (int i = 0; i < COINCOUNT; i++) {
        coins[i].row = rand() % 140 + 10;
        coins[i].col = rand() % 200 + 20;
        coins[i].color = GREEN;
        coins[i].active = 1;
    }
}

// Updates a passed in coin to inactive
void updateCoin(COIN* coin) {
    coin -> active = 0;
    drawRect(coin -> row, coin -> col, 6, 3, WHITE);
}

// Draw Coin Icon
void drawCoin(COIN* coin) {
    drawRect(coin -> row, coin -> col, 6, 3, coin -> color);
}

// Initializes enemy variables
void initEnemy() {
    enemy.row = 60;
    enemy.col = 180;
    enemy.height = 16;
    enemy.oldRow = 2;
    enemy.oldCol = 2;
    enemy.color1 = RED;
    enemy.color2 = COLOR(9,0,0);
}

// Updates the enemy's position based on player position
void updateEnemy() {
    if (player.row - player.height / 2 < enemy.row) {
        enemy.row -= 1;
    }
    if (player.row - player.height / 2 > enemy.row) {
        enemy.row += 1;
    }
    if (player.col - player.height / 2 < enemy.col) {
        enemy.col -= 1;
    }
    if (player.col - player.height / 2 > enemy.col) {
        enemy.col += 1;
    }
}

// Draw Enemy Icon
void drawEnemy() {
    int row = enemy.row;
    int col = enemy.col;
    int height = enemy.height;
    unsigned short color1 = enemy.color1;
    unsigned short color2 = enemy.color2;

    // Erase old enemy
    drawRect(enemy.oldRow, enemy.oldCol, height, height, BG_COLOR);

    // Draw current enemy
    drawRect(row, col, height, height, color1);
    // Eyebrows
    drawRect(row + 2, col + 1, 1, 1, color2);
    drawRect(row + 3, col + 2, 1, 4, color2);
    drawRect(row + 4, col + 6, 1, 1, color2);
    drawRect(row + 2, col + 14, 1, 1, color2);
    drawRect(row + 3, col + 10, 1, 4, color2);
    drawRect(row + 4, col + 9, 1, 1, color2);

    // Angry eyes
    drawRect(row + 4, col + 2, 4, 4, WHITE);
    drawRect(row + 4, col + 10, 4, 4, WHITE);

    // Angry disappointed mouth
    drawRect(row + 13, col + 2, 1, 1, color2);
    drawRect(row + 13, col + 13, 1, 1, color2);
    drawRect(row + 12, col + 3, 1, 10, color2);

    // Angry Pupils
    int pupilUp = (row < enemy.oldRow) ? -2 : 0;
    int pupilLeft = (col < enemy.oldCol) ? -2 : 0;
    int pupilRight = (col > enemy.oldCol) ? 2 : 0;
    drawRect(row + 6 + pupilUp, col + 4 + pupilLeft, 2, 2, BLACK);
    drawRect(row + 6 + pupilUp, col + 10 + pupilRight, 2, 2, BLACK);
}


// Initializes obstacle variables
void initObstacle() {
    obstacle.row = 100;
    obstacle.col = 120;
    obstacle.vRow = 1;
    obstacle.vCol = 1;
    obstacle.height = 12;
    obstacle.oldRow = 2;
    obstacle.oldCol = 2;
    obstacle.color1 = MAGENTA;
    obstacle.color2 = PURPLE;
}

// Updates obstacle position
void updateObstacle() {
    obstacle.row += obstacle.vRow;
    obstacle.col += obstacle.vCol;
}

// Draw Obstacle Icon
void drawObstacle() {
    int row = obstacle.row;
    int col = obstacle.col;
    int height = obstacle.height;
    unsigned short color1 = obstacle.color1;
    unsigned short color2 = obstacle.color2;

    // Erase old obstacle
    drawRect(obstacle.oldRow, obstacle.oldCol, height, height, BG_COLOR);

    // Draw current obstacle
    drawRect(row, col, height, height, color1);

    // Eyebrows
    drawRect(row + 2, col + 2, 1, 3, color2);
    drawRect(row + 2, col + 7, 1, 3, color2);

    // Eyes
    drawRect(row + 3, col + 2, 3, 3, WHITE);
    drawRect(row + 3, col + 7, 3, 3, WHITE);

    // Mouth
    drawRect(row + 9, col + 8, 1, 1, color2);

    // Pupils
    int pupilUp = (row < obstacle.oldRow) ? -1 : 0;
    int pupilLeft = (col < obstacle.oldCol) ? -1 : 0;
    int pupilRight = (col > obstacle.oldCol) ? 1 : 0;
    drawRect(row + 4 + pupilUp, col + 3 + pupilLeft, 2, 2, BLACK);
    drawRect(row + 4 + pupilUp, col + 7 + pupilRight, 2, 2, BLACK);
}

// Draw Win Icon
void drawWin() {
    int row = player.row;
    int col = player.col;
    int height = player.height;
    drawRect(row, col, height, height, WHITE);

    // Eyes
    drawRect(row + 2, col + 2, 1, 1, GREEN);
    drawRect(row + 2, col + 5, 1, 1, GREEN);

    // Frown
    drawRect(row + 5, col + 3, 2, 2, GREEN);
    drawRect(row + 5, col + 2, 1, 4, GREEN);
}

// Draw Lose Icon
void drawLose() {
    int row = player.row;
    int col = player.col;
    int height = player.height;
    drawRect(row, col, height, height, WHITE);

    // Eyes
    drawRect(row + 2, col + 2, 1, 1, BLACK);
    drawRect(row + 2, col + 5, 1, 1, BLACK);

    // Frown
    drawRect(row + 5, col + 3, 2, 2, BLACK);
    drawRect(row + 6, col + 2, 1, 4, BLACK);
}

// Check for player collisions into walls
void checkPlayerWallCollision() {
    int row = player.row;
    int col = player.col;
    int height = player.height;
    if (collision(row, col, height, height, 0, 0, SCREENHEIGHT, 3)) {
        player.col += 2;
    }
    if (collision(row, col, height, height, 0, SCREENWIDTH - 3,
        SCREENHEIGHT, 3)) {
        player.col -= 2;
    }
    if (collision(row, col, height, height, 0, 0, 3, SCREENWIDTH)) {
        player.row += 2;
    }
    if (collision(row, col, height, height, SCREENHEIGHT - 3, 0, 3,
        SCREENWIDTH)) {
        player.row -= 2;
    }
}

// Check for enemy collisions into walls
void checkEnemyWallCollision() {
    int row = enemy.row;
    int col = enemy.col;
    int height = enemy.height;
    if (collision(row, col, height, height, 0, 0, SCREENHEIGHT, 3)) {
        enemy.col += 2;
    }
    if (collision(row, col, height, height, 0, SCREENWIDTH - 3,
        SCREENHEIGHT, 3)) {
        enemy.col -= 2;
    }
    if (collision(row, col, height, height, 0, 0, 3, SCREENWIDTH)) {
        enemy.row += 2;
    }
    if (collision(row, col, height, height, SCREENHEIGHT - 3, 0, 3,
        SCREENWIDTH)) {
        enemy.row -= 2;
    }
}

// Check for obstacle collisions into walls and enemy
void checkObstacleCollision() {
    int row = obstacle.row;
    int col = obstacle.col;
    int height = obstacle.height;
    int eRow = enemy.row;
    int eCol = enemy.col;
    int eHeight = enemy.height;
    // Collisions into walls
    if (collision(row, col, height, height, 0, 0, SCREENHEIGHT, 3)) {
        obstacle.col += 3;
        obstacle.vCol = -obstacle.vCol;
    }
    if (collision(row, col, height, height, 0, SCREENWIDTH - 3,
        SCREENHEIGHT, 3)) {
        obstacle.col -= 3;
        obstacle.vCol = -obstacle.vCol;
    }
    if (collision(row, col, height, height, 0, 0, 3, SCREENWIDTH)) {
        obstacle.row += 3;
        obstacle.vRow = -obstacle.vRow;
    }
    if (collision(row, col, height, height, SCREENHEIGHT - 3, 0, 3,
        SCREENWIDTH)) {
        obstacle.row -= 3;
        obstacle.vRow = -obstacle.vRow;
    }
    // Collisions into enemy
    if (collision(row, col, height, height, eRow, eCol + eHeight, eHeight, 1)) {
        obstacle.col += 3;
        obstacle.vCol = -obstacle.vCol;
    }
    if (collision(row, col, height, height, eRow, eCol, eHeight, 1)) {
        obstacle.col -= 3;
        obstacle.vCol = -obstacle.vCol;
    }
    if (collision(row, col, height, height, eRow + eHeight, eCol, 1, eHeight)) {
        obstacle.row += 3;
        obstacle.vRow = -obstacle.vRow;
    }
    if (collision(row, col, height, height, eRow, eCol, 1, eHeight)) {
        obstacle.row -= 3;
        obstacle.vRow = -obstacle.vRow;
    }
}

// Check for player collisions into coins
void checkPlayerCoinCollision() {
    for (int i = 0; i < 8; i++) {
        if (coins[i].active && collision(player.row, player.col, player.height,
            player.height, coins[i].row, coins[i].col, 6, 3)) {
            coinsRemaining--;
            updateCoin(&coins[i]);
            // Update Obstacle variables based on player progression
            if (coinsRemaining == 4) {
                obstacle.vRow *= 2;
                obstacle.vCol *= 2;
            }
            if (coinsRemaining == 2) {
                obstacle.vRow = obstacle.vRow / 2 * 3;
                obstacle.vCol = obstacle.vCol / 2 * 3;
            }
        }
    }
}

// Check for player collisions into enemy, obstacle, and bird
void checkPlayerEnemyCollision() {
    if (collision(player.row, player.col, player.height, player.height,
        enemy.row, enemy.col, enemy.height, enemy.height)) {
        coinsRemaining = -1;
    }
    if (collision(player.row, player.col, player.height, player.height,
        obstacle.row, obstacle.col, obstacle.height, obstacle.height)) {
        coinsRemaining = -1;
    }
}