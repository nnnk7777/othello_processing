// (x, y)が盤面の内側か
boolean inside(int x, int y){
  if((0<=x && x<8) && (0<=y && y<8)){
    return true;
  }else{
    return false;
  }
}



// (x, y)のマスに石を置くことができるか
boolean can_put_here(int x, int y){
  boolean puttable = false;
  if(board[x][y] != NONE){
    return puttable; // すでに石が置かれてたら置けない
  }
  for (int[] d : directions){
    if( check_direction(x, y, d[0], d[1]) ){
      puttable = true;
    }
  }
  return puttable;
}



// 石を裏返す
void reverse_around(int x, int y,int dx, int dy){
  if( !inside(x+dx,y+dy) ) return;

  if(board[x+dx][y+dy] != turn_wb){
    board[x+dx][y+dy] = turn_wb;
    x = x+dx;
    y = y+dy;
    reverse_around(x,y,dx,dy);
  }
}
