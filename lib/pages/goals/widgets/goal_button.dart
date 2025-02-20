import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';

class GoalButton extends StatelessWidget {
  const GoalButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
  });

  final String text;
  final void Function() onTap;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: responsiveSpacing(context, 24),
            vertical: responsiveSpacing(context, 10)),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
