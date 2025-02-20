// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/models/goal.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key, required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: duplicate_ignore
            // ignore: deprecated_member_use
            Text(
              "${truncateValue(goal.completed)} EGP",
              style: TextStyle(color: Color(goal.color).withOpacity(0.8)),
            ),
            SizedBox(width: responsiveSpacing(context, 5)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(goal.color),
              ),
              child: Text(
                "${((goal.completed / goal.amount) * 100).ceil()}%",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: responsiveSpacing(context, 3)),
            Icon(
              Icons.arrow_right_alt_rounded,
              size: responsiveFontSize(context, 15),
              color: Color(goal.color).withOpacity(0.8),
            ),
            SizedBox(width: responsiveSpacing(context, 3)),
            Text(
              "${truncateValue(goal.amount)} EGP",
              style: TextStyle(color: Color(goal.color).withOpacity(0.8)),
            ),
            SizedBox(width: responsiveSpacing(context, 5)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(goal.color).withOpacity(0.6),
              ),
              child: Text(
                "100%",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: responsiveSpacing(context, 10)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: responsiveSpacing(context, 16)),
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(10),
            minHeight: 10,
            value: ((goal.completed / goal.amount) * 100).ceil().toDouble(),
            color: Color(goal.color),
            backgroundColor: Color(goal.color).withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
