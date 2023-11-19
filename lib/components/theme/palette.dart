import 'package:flutter/material.dart';

class Palette {
  Palette._();

  static const Color boxBackground = Color(0x2D777F94);
  static const borderColor = Color.fromRGBO(96, 125, 139, 0.25);
  static const Color textColor = Colors.black;

  static Map<int, Color> boxColor = <int, Color>{
    2: Colors.red[50]!,
    4: Colors.red[100]!,
    8: Colors.red[200]!,
    16: Colors.red[300]!,
    32: Colors.red[400]!,
    64: Colors.red[500]!,
    128: Colors.red[600]!,
    256: Colors.red[700]!,
    512: Colors.red[800]!,
    1025: Colors.red[900]!,
  };
}
