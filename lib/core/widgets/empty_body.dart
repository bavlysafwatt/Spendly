import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/assets.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Lottie.asset(
              Assets.empty,
              width: screenWidth * 0.7,
              height: screenHeight * 0.3,
            ),
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: responsiveFontSize(context, 20),
            ),
          ),
        ],
      ),
    );
  }
}
