import 'package:flutter/material.dart';

class Sizes {
  Sizes._();

  static const EdgeInsets pageMargins = EdgeInsets.symmetric(horizontal: 22, vertical: 16);
  static const EdgeInsets boxMargins = EdgeInsets.symmetric(horizontal: 8, vertical: 12);
  static const double cellPadding = 5.0;

  static double width = guidelineBaseWidth;
  static double height = guidelineBaseHeight;

  static const double guidelineBaseWidth = 350;
  static const double guidelineBaseHeight = 680;

  static double boardWidth = 350.0;

  static void configure(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    boardWidth = Sizes.width - Sizes.boxMargins.left - Sizes.boxMargins.right;
    double ratio = Sizes.width / Sizes.height;
    if (ratio > 0.75) {
      boardWidth = Sizes.height / 2;
    }
  }
}
