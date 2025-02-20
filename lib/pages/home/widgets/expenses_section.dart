import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/assets.dart';
import 'package:spendly/cubits/home_cubit/home_cubit.dart';
import 'package:spendly/pages/home/widgets/custom_navigation_bar.dart';
import 'package:spendly/pages/home/widgets/fitted_text.dart';

class ExpensesSection extends StatelessWidget {
  const ExpensesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveSpacing(context, 24),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
          Opacity(
            opacity: 0.04,
            child: Image.asset(
              Assets.dots,
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: responsiveFontSize(context, 16)),
              child: Column(
                children: [
                  Spacer(flex: 5),
                  FittedText(
                    title: "Expenses Summary",
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  Spacer(flex: 1),
                  FittedText(
                    title: "You Spent..",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  Spacer(flex: 2),
                  FittedText(
                    title:
                        "${truncateValue(BlocProvider.of<HomeCubit>(context).spent)}",
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  Spacer(flex: 4),
                  FittedText(
                    title: "In this period!",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  Spacer(flex: 5),
                  CustomNavigationBar(),
                  Spacer(flex: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
