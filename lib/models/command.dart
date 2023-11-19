import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/controllers/game_controller.dart';

abstract class Command {
  void execute();
}

class MoveLeftCommand implements Command {
  final GameController _gameController;

  MoveLeftCommand(this._gameController);

  @override
  void execute() {
    _gameController.move(Direction.left);
  }
}

class MoveRightCommand implements Command {
  final GameController _gameController;

  MoveRightCommand(this._gameController);

  @override
  void execute() {
    _gameController.move(Direction.right);
  }
}

class MoveUpCommand implements Command {
  final GameController _gameController;

  MoveUpCommand(this._gameController);

  @override
  void execute() {
    _gameController.move(Direction.up);
  }
}

class MoveDownCommand implements Command {
  final GameController _gameController;

  MoveDownCommand(this._gameController);

  @override
  void execute() {
    _gameController.move(Direction.down);
  }
}
