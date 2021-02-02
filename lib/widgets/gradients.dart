import 'package:flutter/material.dart';

class Gradients {
  static LinearGradient get gradient1 => LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.25, 0.85],
      colors: [Color.fromRGBO(0x40,0x51,0xDB, 1), Color.fromRGBO(00, 0xDB, 0xDE, 1)]);

  static LinearGradient get gradient2 => LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.5,
            0.75
          ],
          colors: [
            Color.fromRGBO(95, 113, 199, 1),
            Color.fromRGBO(71, 171, 210, 1)
          ]);
  static LinearGradient get qrBottomGradient => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.4,
            0.8
          ],
          colors: [
            Color.fromRGBO(66, 83, 219, 1),
            Color.fromRGBO(78, 105, 222, 1)
          ]);
  static LinearGradient get confirmBottomGradient => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.4,
            0.8
          ],
          colors: [
            Color.fromRGBO(140, 180, 227, 1),
            Color.fromRGBO(116, 193, 225, 1)
          ]);
}
