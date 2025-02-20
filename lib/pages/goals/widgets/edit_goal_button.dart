import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';

class EditGoalButton extends StatelessWidget {
  const EditGoalButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 30,
  });

  final String text;
  final void Function() onTap;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: responsiveSpacing(context, 24),
            vertical: responsiveSpacing(context, 8)),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: primaryColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: responsiveFontSize(context, 20),
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
