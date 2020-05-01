// (x, y)マスの(dx, dy)の方向に裏返せる石が存在するかどうか
// たしかCMPの資料から引用したやり方？
boolean check_direction(int x, int y, int dx, int dy){
  if( !inside(x+dx,y+dy) ) return false;
  if(board[x+dx][y+dy] == NONE){
    return false;
  }else if(board[x+dx][y+dy] != turn_wb){
    return check_direction_sub(x+dx,y+dy,dx,dy);
  }else{
    return false;
  }
}

boolean check_direction_sub(int x, int y, int dx, int dy){
  if(!inside(x+dx,y+dy)) return false;

  if(board[x+dx][y+dy] == NONE){
    return false;
  }else if(board[x+dx][y+dy] !=  turn_wb){
    return check_direction_sub(x+dx,y+dy,dx,dy);
  }else if(board[x+dx][y+dy] == turn_wb){
    return true;
  }else{
    return false;
  }
}
