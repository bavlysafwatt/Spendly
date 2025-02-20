import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';

class FittedText extends StatelessWidget {
  const FittedText(
      {super.key,
      required this.title,
      this.color = Colors.black,
      required this.fontSize,
      required this.fontWeight});

  final String title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: responsiveFontSize(context, fontSize),
          color: color,
        ),
      ),
    );
  }
}
