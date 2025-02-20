import 'package:flutter/material.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/models/expense.dart';

class ExchangeExpenseListTile extends StatelessWidget {
  const ExchangeExpenseListTile(
      {super.key, required this.expense, this.onPressed});

  final Expense expense;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveSpacing(context, 16),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(
          horizontal: responsiveSpacing(context, 12),
          vertical: responsiveSpacing(context, 16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(responsiveSpacing(context, 10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // ignore: deprecated_member_use
                color: Colors.red.withOpacity(0.08),
              ),
              child: Icon(
                Icons.arrow_downward_rounded,
                color: Colors.red,
                size: 18,
              ),
            ),
            SizedBox(width: responsiveSpacing(context, 16)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.isGoal ? "Goal: ${expense.title}" : expense.title,
                    style: TextStyle(
                      fontSize: responsiveFontSize(context, 18),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    expense.date,
                    style: TextStyle(
                      fontSize: responsiveFontSize(context, 13),
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: responsiveSpacing(context, 6),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: responsiveSpacing(context, 10)),
              child: Text(
                "${truncateValue(expense.amount)} EGP",
                style: TextStyle(
                  fontSize: responsiveFontSize(context, 17),
                  fontWeight: FontWeight.w900,
                  color: Colors.red,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            expense.isGoal == false
                ? IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.highlight_remove_outlined,
                      size: 20,
                      color: Colors.red,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
