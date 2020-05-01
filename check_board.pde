// 盤面の状態をチェック
void check_board(){
  // 白黒それぞれの石がいくつあるか
  // 置くことのできるマスがいくつあるか
  black_count = 0;
  white_count = 0;
  available = 0;
  for(int x=0; x<8; x++){
    for(int y=0; y<8; y++){
      if(board[x][y] == BLACK){
        black_count++;
      }else if(board[x][y] == WHITE){
        white_count++;
      }
      if(can_put_here(x, y)){
        available++;
      }
    }
  }

  // 置けるマスがなかったらスキップして攻守交代
  if(available==0){
    turn_wb = -1*turn_wb;
    skip_count++;
  }else{
    skip_count = 0;
  }
  // 2回連続でスキップされたら(どちらも置けない状況なら)ゲームセット
  if(skip_count==2){
    String result = "";
    if(black_count > white_count){
      result = "BALCK win";
    }else if(black_count < white_count){
      result = "WHITE win";
    }else{
      result = "DRAW";
    }
    fill(0);
    text(result,250,450);
    noLoop();
  }
}
