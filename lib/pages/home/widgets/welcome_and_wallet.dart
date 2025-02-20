import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/assets.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/cubits/home_cubit/home_cubit.dart';
import 'package:spendly/pages/home/widgets/fitted_text.dart';

class WelcomeAndWallet extends StatelessWidget {
  const WelcomeAndWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String name = Database.getName()!;

    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.04,
            left: screenWidth * 0.08,
            child: Transform.scale(
              scale: 0.1,
              child: Image.asset(Assets.coin2),
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * -0.3,
            child: Transform.scale(
              scale: 0.1,
              child: Image.asset(Assets.coin1),
            ),
          ),
          Positioned(
            top: screenHeight * -0.12,
            right: screenWidth * 0.099,
            child: Transform.scale(
              scale: 0.05,
              child: Image.asset(Assets.mainCoin),
            ),
          ),
          Center(
            child: Column(
              children: [
                Spacer(flex: 2),
                FittedText(
                  title: "Welcome back, $name!",
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(flex: 1),
                FittedText(
                  title: "Follow your expenses!",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(flex: 6),
                FittedText(
                  title: "Your Wallet has..",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(flex: 3),
                FittedText(
                  title:
                      "${truncateValue(BlocProvider.of<HomeCubit>(context).wallet)}",
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                ),
                Spacer(flex: 3),
                FittedText(
                  title: "EGP",
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
                Spacer(flex: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
