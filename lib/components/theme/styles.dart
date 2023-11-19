import 'dart:developer';
import 'dart:ui';

import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/palette.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/sizes.dart';
import 'package:flutter/material.dart';

class Styles {
  Styles._();

 static TextStyle titleTextStyle() {
    return _processTextStyle(TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.bold,
      color: Palette.textColor,
    ));
  }

  static TextStyle boxTextStyle() {
    return _processTextStyle(TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      fontSize: 30.0,
      height: 20 / 16,
      color: Palette.textColor,
    ));
  }

  //Encapsulation
  static TextStyle _processTextStyle(TextStyle style) {
    final weight = style.fontWeight;
    return style.copyWith(
      fontVariations: weight == null
          ? null
          : [
              FontVariation(
                'wght',
                ((weight.index + 1) * 100).toDouble(),
              ),
            ],
    );
  }

}
