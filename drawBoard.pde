void drawBoard(){
  // 盤面の緑の部分
  background(0,128,0);
  // 盤面の線
  stroke(0);
  for(int i=1; i<8; ++i){
    line(i*SQUARE_SIZE, 0, i*SQUARE_SIZE, height);
    line(0, i*SQUARE_SIZE, width, i*SQUARE_SIZE);
  }
  // 情報を表示する部分
  fill(-1);
  rect(0, 400, width, 100);

  // 今おけるマスがいくつあるか
  available = 0;

  // 石の描画
  noStroke();
  float STONE_SIZE = SQUARE_SIZE*0.8;
  for(int x=0; x<8; x++){
    for(int y=0; y<8; y++){
      if(board[x][y]==BLACK){
        fill(0);  //black
        ellipse((x*2+1)*SQUARE_SIZE/2, (y*2+1)*SQUARE_SIZE/2, STONE_SIZE, STONE_SIZE);
      }else if(board[x][y]==WHITE){
        fill(255); // white
        ellipse((x*2+1)*SQUARE_SIZE/2, (y*2+1)*SQUARE_SIZE/2, STONE_SIZE, STONE_SIZE);
      }
      // 置けるマスをハイライト表示
      if(can_put_here(x, y)){
        fill(139,218,153);
        rect(x*SQUARE_SIZE+1, y*SQUARE_SIZE+1, SQUARE_SIZE-1, SQUARE_SIZE-1);
      }
    }
  }
}


void showInfo(){
  // それぞれ石がいくつあるか
  fill(0);
  text("black: "+black_count,150,450);
  text("white: "+white_count,150,470);


  // どっちのターンか
  String turn;
  stroke(1);
  fill(100,200,150);
  rect(10,410,60,30);
  if(turn_wb==1){
    fill(0);
    turn = "black";
  }else{
    fill(-1);
    turn = "white";
  }
  text(turn,10,410,60,30);
}
