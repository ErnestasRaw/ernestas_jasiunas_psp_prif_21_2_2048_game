import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/controllers/game_controller.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/empty_cell.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/numbered_cell.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('isGameOver testas', () {
    GameController gameController = GameController.getInstance();
    gameController.startGame();
    while (!gameController.isGameOver()) {
      gameController.move(Direction.left);
      gameController.move(Direction.up);
      gameController.move(Direction.right);
      gameController.move(Direction.down);
    }
    expect(gameController.isGameOver(), isTrue);
  });

  test('Tasku pridejimas po merge testas', () {
    GameController gameController = GameController.getInstance();
    gameController.boardCells = [
      [NumberedCell(2, 0, 0), NumberedCell(2, 0, 1), EmptyCell(0, 2), EmptyCell(0, 3)],
      [NumberedCell(4, 1, 0), EmptyCell(1, 1), EmptyCell(1, 2), EmptyCell(1, 3)],
      [EmptyCell(2, 0), EmptyCell(2, 1), EmptyCell(2, 2), EmptyCell(2, 3)],
      [EmptyCell(3, 0), EmptyCell(3, 1), EmptyCell(3, 2), EmptyCell(3, 3)],
    ];
    gameController.score = 0;
    gameController.move(Direction.left);
    expect(gameController.score, 4);
  });

  test("merge testas", () {
    GameController gameController = GameController.getInstance();
    gameController.boardCells = [
      [NumberedCell(2, 0, 0), NumberedCell(2, 0, 1), EmptyCell(0, 2), EmptyCell(0, 3)],
      [NumberedCell(4, 1, 0), NumberedCell(4, 1, 1), EmptyCell(1, 2), EmptyCell(1, 3)],
      [EmptyCell(2, 0), EmptyCell(2, 1), EmptyCell(2, 2), EmptyCell(2, 3)],
      [EmptyCell(3, 0), EmptyCell(3, 1), EmptyCell(3, 2), EmptyCell(3, 3)],
    ];
    gameController.score = 0;
    gameController.move(Direction.left);
    expect(gameController.boardCells[0][0], isA<NumberedCell>());
    expect((gameController.boardCells[0][0] as NumberedCell).number, 4);
    expect(gameController.boardCells[1][0], isA<NumberedCell>());
    expect((gameController.boardCells[1][0] as NumberedCell).number, 8);
    expect(gameController.score, 12);
  });
}
