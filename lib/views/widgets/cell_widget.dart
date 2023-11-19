import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/palette.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/sizes.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/cell.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/models/numbered_cell.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/views/widgets/cell_box_widget.dart';
import 'package:flutter/material.dart';

class CellWidget extends StatelessWidget {
  final Cell cell;
  final int column;

  const CellWidget({
    super.key,
    required this.cell,
    required this.column,
  });

  @override
  Widget build(BuildContext context) {
    double width = (Sizes.boardWidth - (column + 1) * Sizes.cellPadding) / column;

    if (cell is NumberedCell) {
      return CellBox(
        left: (cell.column * width) + ((cell.column + 1) * Sizes.cellPadding),
        top: (cell.row * width) + ((cell.row + 1) * Sizes.cellPadding),
        size: width,
        color: Palette.boxColor[(cell as NumberedCell).number] ?? Palette.boxColor[Palette.boxColor.keys.last]!,
        text: Text(
          (cell as NumberedCell).number.toString(),
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: (cell as NumberedCell).number < 32 ? Colors.grey[600] : Colors.grey[50],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
