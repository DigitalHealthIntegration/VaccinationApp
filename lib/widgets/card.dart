import 'package:flutter/material.dart';
import 'package:flutter_r1/theme.dart';

class AppCard extends StatelessWidget {
  final Widget body;
  double padding;
  double borderRadius;
  double elevation;
  Color color;

  AppCard(
      {@required this.body,
      this.padding,
      this.elevation,
      this.color,
      this.borderRadius}) {
    padding ??= 10;
    color ??= AppColors.light;
    borderRadius ??= 15.0;
    elevation ??= 5;
  }

  @override
  Card build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: body,
        ),
      ),
    );
  }
}
