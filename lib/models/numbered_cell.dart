import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/cell.dart';

class NumberedCell extends Cell {
  int number;
  bool isMerged = false;

  NumberedCell(this.number, super.row, super.column);

  @override
  String toString() {
    return number.toString();
  }
}
