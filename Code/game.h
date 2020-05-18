// Player Struct
typedef struct {
    int row;
    int col;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} PLAYER;

// Enemy Struct
typedef struct {
    int row;
    int col;
    int height;
    int oldRow;
    int oldCol;
    unsigned short color1;
    unsigned short color2;
} ENEMY;

// Obstacle Struct
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

// Coin Struct
typedef struct {
    int row;
    int col;
    unsigned short color;
    int active;
} COIN;

// Constants
#define COINCOUNT 8
#define BG_COLOR WHITE

// Variables
extern PLAYER player;
extern ENEMY enemy;
extern OBSTACLE obstacle;
extern COIN coins[COINCOUNT];
extern int coinsRemaining;

// Prototypes
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