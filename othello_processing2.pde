int[][] board;
final int SQUARE_SIZE = 50;
final int NONE = 0;
final int BLACK = 1;
final int WHITE = -1;
int[][] directions = {{-1, 0}, {-1,-1}, { 0,-1}, { 1,-1},
                      { 1, 0}, { 1, 1}, { 0, 1}, {-1, 1}};
int turn_wb = 1; // 白と黒どちらのターンか．1が黒
int available;
int black_count;
int white_count;
int skip_count = 0;


void setup(){
  size(400, 500);
  textAlign(CENTER, CENTER);
  board = new int[8][8];
  for(int x=0; x<8; x++){
    for(int y=0; y<8; y++){
        board[x][y] = NONE;
    }
  }
  // 基本形
  board[3][3] = board[4][4] = WHITE;
  board[3][4] = board[4][3] = BLACK;
}


void draw(){
  drawBoard();
  check_board();
  showInfo();
}


void mousePressed(){
  int x = mouseX/SQUARE_SIZE;
  int y = mouseY/SQUARE_SIZE;

  // 下の情報パネルをクリック or すでに石があるマスをクリックしたら反応しない
  if(mouseY>400 || board[x][y]!=NONE)return;

  if(can_put_here(x,y)){
    board[x][y] = turn_wb;

    // 全ての方向について，裏返せる部分を裏返す
    for (int[] d : directions){
      if( check_direction(x, y, d[0], d[1]) ){
        reverse_around(x, y, d[0], d[1]);
      }
    }
    turn_wb = -1*turn_wb;
  }
}
