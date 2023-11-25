void main() {
  var s1 = Solution();
  List<List<int>> num1 = [
    [0, 0],
    [2, 0],
    [1, 1],
    [2, 1],
    [2, 2]
  ]; //
  String res;
  res = s1.tictactoe(num1);
  print(res);
}

class Solution {
  String tictactoe(List<List<int>> moves) {
    List<List<String>> grid = fill2Dim(moves);
    String res = checkAllPivots(grid);
    return res;
  }

  List<List<String>> fill2Dim(List<List<int>> moves) {
    List<List<String>> grid = List.generate(3, (_) => List.filled(3, "D"));
    for (int x = 0; x < moves.length; x++) {
      if (x % 2 == 0) {
        grid[moves[x][0]][moves[x][1]] = "A";
      } else {
        grid[moves[x][0]][moves[x][1]] = "B";
      }
    }
    return grid;
  }

  String checkAllPivots(List<List<String>> moves) {
    for (int x = 0; x < 3; x++) {
      if (moves[x][0] == "A" && moves[x][1] == "A" && moves[x][2] == "A") {
        return "A";
      } else if (moves[0][x] == "A" &&
          moves[1][x] == "A" &&
          moves[2][x] == "A") {
        return "A";
      }
      if (moves[x][0] == "B" && moves[x][1] == "B" && moves[x][2] == "B") {
        return "B";
      } else if (moves[0][x] == "B" &&
          moves[1][x] == "B" &&
          moves[2][x] == "B") {
        return "B";
      }
    }
    if (xPivot(moves, "A")) return "A";
    if (xPivot(moves, "B")) return "B";
    return moves.any((row) => row.contains("D")) ? "Pending" : "Draw";
  }

  bool xPivot(List<List<String>> moves, String tar) {
    if (moves[0][0] == tar && moves[1][1] == tar && moves[2][2] == tar) {
      return true;
    } else if (moves[0][2] == tar && moves[1][1] == tar && moves[2][0] == tar) {
      return true;
    }
    return false;
  }
}
