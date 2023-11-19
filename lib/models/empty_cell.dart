import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/cell.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/numbered_cell.dart';

class EmptyCell extends Cell {
  EmptyCell(super.row, super.column);

  @override
  String toString() {
    return "0";
  }
}
