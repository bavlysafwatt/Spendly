import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.colorValue,
    required this.isActive,
  });

  final Color colorValue;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: responsiveSpacing(context, 2),
        ),
        decoration: BoxDecoration(
          color: colorValue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: isActive
            ? Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 24,
                ),
              )
            : null,
      ),
    );
  }
}
