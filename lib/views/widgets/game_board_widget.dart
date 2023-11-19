import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/palette.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/sizes.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/views/widgets/cell_box_widget.dart';
import 'package:flutter/material.dart';

class BoardGridWidget extends StatelessWidget {
  final int column;
  final int row;
  final double cellPadding;

  const BoardGridWidget({
    super.key,
    required this.column,
    required this.row,
    required this.cellPadding,
  });

  @override
  Widget build(BuildContext context) {
    double width = (Sizes.boardWidth - (column + 1) * cellPadding) / column;
    List<CellBox> backgroundBox = [];
    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < column; ++c) {
        CellBox box = CellBox(
          color: Palette.boxBackground,
          left: c * width + cellPadding * (c + 1),
          top: r * width + cellPadding * (r + 1),
          size: width,
        );
        backgroundBox.add(box);
      }
    }
    return Positioned(
      left: 0.0,
      top: 0.0,
      child: Container(
        width: Sizes.boardWidth,
        height: Sizes.boardWidth,
        decoration: BoxDecoration(
          color: Palette.borderColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Stack(
          children: backgroundBox,
        ),
      ),
    );
  }
}
