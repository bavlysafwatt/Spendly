import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';

class AddExpenseButton extends StatelessWidget {
  const AddExpenseButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 30,
    required this.iconData,
  });

  final String text;
  final void Function() onTap;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        elevation: 0.7,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveSpacing(context, 24),
            vertical: responsiveSpacing(context, 8),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: textColor,
                ),
                SizedBox(width: responsiveSpacing(context, 8)),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: responsiveFontSize(context, 20),
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
