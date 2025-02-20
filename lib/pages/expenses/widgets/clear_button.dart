import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: responsiveSpacing(context, 16),
        top: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 244, 127, 127),
        border: Border.all(
          color: Colors.red,
          width: 1,
        ),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              "Clear",
              style: TextStyle(
                fontSize: responsiveFontSize(context, 16),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
