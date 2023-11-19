import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/palette.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/sizes.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/styles.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/controllers/game_controller.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/globals.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/command.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/views/widgets/game_board_widget.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/views/widgets/cell_widget.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final GameController _gameController = GameController();

  bool _isDragging = false;
  int _bestScore = 0;

  int get bestScore => _bestScore;

  set bestScore(int value) {
    _bestScore = value;
  }

  @override
  void initState() {
    super.initState();
    newGame();
  }

  void newGame() {
    _gameController.startGame();
    setState(() {});
  }

  void _executeCommand(Command command) {
    command.execute();
    checkGameOver();
    setState(() {});
  }

  void move(Direction direction) {
    switch (direction) {
      case Direction.left:
        _executeCommand(MoveLeftCommand(_gameController));
        break;
      case Direction.right:
        _executeCommand(MoveRightCommand(_gameController));
        break;
      case Direction.up:
        _executeCommand(MoveUpCommand(_gameController));
        break;
      case Direction.down:
        _executeCommand(MoveDownCommand(_gameController));
        break;
      default:
        break;
    }
  }

  void checkGameOver() {
    if (_gameController.isGameOver()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Žaidimas baigtas, pralaimėjote!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Gerai"),
            ),
            TextButton(
              onPressed: () {
                newGame();
                Navigator.of(context).pop();
              },
              child: Text("Pradėti iš naujo"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // From docs: There is no concept of “private” for local variables or parameters.
    List<CellWidget> cellWidget = [];
    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < column; ++c) {
        cellWidget.add(
          CellWidget(
            cell: _gameController.get(r, c),
            column: column,
          ),
        );
      }
    }
    List<Widget> children = [];
    children.add(
      BoardGridWidget(
        column: column,
        row: row,
        cellPadding: 5.0,
      ),
    );
    children.addAll(cellWidget);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '2048',
              style: Styles.titleTextStyle(),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 15.0,
              ),
              decoration: BoxDecoration(
                color: Palette.boxBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: SizedBox(
                width: 130.0,
                height: 60.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Rezultatas',
                      style: TextStyle(
                        color: Palette.textColor,
                      ),
                    ),
                    Text(
                      _gameController.score.toString(),
                      style: Styles.boxTextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TextButton(
          child: Container(
            width: 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Palette.boxBackground,
            ),
            child: Center(
              child: Icon(
                Icons.refresh,
                color: Palette.textColor,
                size: 42,
              ),
            ),
          ),
          onPressed: () {
            newGame();
          },
        ),
        Container(
          padding: EdgeInsets.only(
            top: 20.0,
          ),
          margin: Sizes.boxMargins,
          width: Sizes.width,
          //_queryData.size.width,
          height: Sizes.width,
          child: GestureDetector(
            onVerticalDragUpdate: (detail) {
              if (detail.delta.distance == 0 || _isDragging) {
                return;
              }
              _isDragging = true;
              if (detail.delta.direction > 0) {
                move(Direction.down);
              } else {
                move(Direction.up);
              }
            },
            onVerticalDragEnd: (detail) {
              _isDragging = false;
            },
            onVerticalDragCancel: () {
              _isDragging = false;
            },
            onHorizontalDragUpdate: (detail) {
              if (detail.delta.distance == 0 || _isDragging) {
                return;
              }
              _isDragging = true;
              if (detail.delta.direction > 0) {
                move(Direction.left);
              } else {
                move(Direction.right);
              }
            },
            onHorizontalDragDown: (detail) {
              _isDragging = false;
            },
            onHorizontalDragCancel: () {
              _isDragging = false;
            },
            child: Stack(
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
