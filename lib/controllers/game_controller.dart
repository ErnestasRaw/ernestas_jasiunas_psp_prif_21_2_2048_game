import 'dart:math';

import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/globals.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/cell.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/empty_cell.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/numbered_cell.dart';

enum Direction { left, right, up, down }

/// This class is responsible for handling the game logic, such as merging cells and moving cells.
///
/// Should be initialized before use. Initialization: [GameController.startGame]
class GameController {
  //Singletonas
  static GameController? _instance;

  GameController._();

  static GameController getInstance() {
    _instance ??= GameController._();
    return _instance!;
  }

  int _score = 0;

  int get score => _score;

  set score(int value) {
    _score = value;
  }

  //Not encapsulated beacause of testing
  late List<List<Cell>> boardCells;

  GameController();

  void startGame() {
    score = 0;
    boardCells = List.generate(row, (r) => List.generate(column, (c) => EmptyCell(r, c)));
    for (int i = 0; i < 2; ++i) {
      _generateRandomCell();
    }
  }

  Cell get(int r, int c) {
    return boardCells[r][c];
  }

  void move(Direction direction) {
    bool canMove = false;

    switch (direction) {
      case Direction.left:
        canMove = _canMoveLeft();
        for (int r = 0; r < row; ++r) {
          for (int c = 0; c < column; ++c) {
            _mergeLeft(r, c);
          }
        }
        break;
      case Direction.right:
        canMove = _canMoveRight();
        for (int r = 0; r < row; ++r) {
          for (int c = column - 2; c >= 0; --c) {
            _mergeRight(r, c);
          }
        }
        break;
      case Direction.up:
        canMove = _canMoveUp();
        for (int c = 0; c < column; ++c) {
          for (int r = 1; r < row; ++r) {
            _mergeUp(r, c);
          }
        }
        break;
      case Direction.down:
        canMove = _canMoveDown();
        for (int c = 0; c < column; ++c) {
          for (int r = row - 2; r >= 0; --r) {
            _mergeDown(r, c);
          }
        }
        break;
    }

    if (canMove) {
      _generateRandomCell();
      _resetMergeStatuses();
    }
  }

  bool _canMoveLeft() {
    for (int r = 0; r < row; ++r) {
      for (int c = 1; c < column; ++c) {
        if (_canMerge(boardCells[r][c], boardCells[r][c - 1])) {
          return true;
        }
      }
    }
    return false;
  }

  bool _canMoveRight() {
    for (int r = 0; r < row; ++r) {
      for (int c = column - 2; c >= 0; --c) {
        if (_canMerge(boardCells[r][c], boardCells[r][c + 1])) {
          return true;
        }
      }
    }
    return false;
  }

  bool _canMoveUp() {
    for (int c = 0; c < column; ++c) {
      for (int r = 1; r < row; ++r) {
        if (_canMerge(boardCells[r][c], boardCells[r - 1][c])) {
          return true;
        }
      }
    }
    return false;
  }

  bool _canMoveDown() {
    for (int c = 0; c < column; ++c) {
      for (int r = row - 2; r >= 0; --r) {
        if (_canMerge(boardCells[r][c], boardCells[r + 1][c])) {
          return true;
        }
      }
    }
    return false;
  }

  void _mergeLeft(int r, int c) {
    while (c > 0) {
      _merge(boardCells[r][c], boardCells[r][c - 1]);
      c--;
    }
  }

  void _mergeRight(int r, int c) {
    while (c < column - 1) {
      _merge(boardCells[r][c], boardCells[r][c + 1]);
      c++;
    }
  }

  void _mergeUp(int r, int c) {
    while (r > 0) {
      _merge(boardCells[r][c], boardCells[r - 1][c]);
      r--;
    }
  }

  void _mergeDown(int r, int c) {
    while (r < row - 1) {
      _merge(boardCells[r][c], boardCells[r + 1][c]);
      r++;
    }
  }

  /// Checks if its possible to merge [a] to [b]
  bool _canMerge(Cell a, Cell b) {
    if (a is NumberedCell && b is NumberedCell) {
      return !b.isMerged && a.number == b.number;
    } else if (b is EmptyCell && a is NumberedCell) {
      return true;
    }
    return false;
  }

  /// Merges cell [a] to cell [b]
  void _merge(Cell a, Cell b) {
    if (!_canMerge(a, b)) {
      if (a is NumberedCell && b is NumberedCell) {
        b.isMerged = true;
      }
      return;
    }
    if (b is EmptyCell) {
      b = NumberedCell((a as NumberedCell).number, b.row, b.column);
      a = EmptyCell(a.row, a.column);
      boardCells[b.row][b.column] = b;
      boardCells[a.row][a.column] = a;
    } else if (a is NumberedCell && b is NumberedCell && a.number == b.number) {
      b.number = a.number + b.number;
      a = EmptyCell(a.row, a.column);
      score += b.number;
      b.isMerged = true;
      boardCells[b.row][b.column] = b;
      boardCells[a.row][a.column] = a;
    } else if (b is NumberedCell) {
      b.isMerged = true;
      boardCells[b.row][b.column] = b;
    }
  }

  bool isGameOver() {
    return !_canMoveLeft() && !_canMoveRight() && !_canMoveUp() && !_canMoveDown();
  }

  void _generateRandomCell() {
    List<Cell> emptyCells = [];
    for (var cells in boardCells) {
      emptyCells.addAll(cells.whereType<EmptyCell>());
    }
    if (emptyCells.isEmpty) {
      return;
    }
    Random r = Random();
    int index = r.nextInt(emptyCells.length);
    boardCells[emptyCells[index].row][emptyCells[index].column] = NumberedCell(
      _randomCellNum(),
      emptyCells[index].row,
      emptyCells[index].column,
    );
    emptyCells.removeAt(index);
  }

  int _randomCellNum() {
    final Random r = Random();
    return r.nextInt(9) == 0 ? 4 : 2;
  }

  void _resetMergeStatuses() {
    for (var cells in boardCells) {
      for (var cell in cells) {
        if (cell is NumberedCell) {
          cell.isMerged = false;
        }
      }
    }
  }
}
