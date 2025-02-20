import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/pages/add/add_page.dart';
import 'package:spendly/pages/expenses/expenses_page.dart';
import 'package:spendly/pages/goals/goals_page.dart';
import 'package:spendly/pages/home/widgets/custom_navigation_bar_item.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: responsiveSpacing(context, 30),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xff1C1C1C),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomNavigationBarItem(
            iconData: Icons.receipt_long_rounded,
            label: 'Expenses',
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => ExpensesPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 150),
              ),
            ),
          ),
          CustomNavigationBarItem(
            iconData: Icons.task_alt_rounded,
            label: 'Goals',
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => GoalsPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 150),
              ),
            ),
          ),
          CustomNavigationBarItem(
            iconData: Icons.add_circle_outline_rounded,
            label: 'Add',
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => AddPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(milliseconds: 150),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
