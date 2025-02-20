import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';

class CustomNavigationBarItem extends StatelessWidget {
  const CustomNavigationBarItem(
      {super.key, required this.iconData, required this.label, this.onTap});

  final IconData iconData;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            size: responsiveFontSize(context, 40),
            color: Colors.white,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: responsiveFontSize(context, 10),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
