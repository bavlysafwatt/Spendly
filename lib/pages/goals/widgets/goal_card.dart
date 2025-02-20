import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/models/goal.dart';
import 'package:spendly/pages/goals/widgets/edit_goal_dialog_box.dart';
import 'package:spendly/pages/goals/widgets/progress_section.dart';

class GoalCard extends StatelessWidget {
  const GoalCard(
      {super.key, required this.goal, this.onDelete, required this.index});

  final Goal goal;
  final void Function(BuildContext)? onDelete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          CustomSlidableAction(
            onPressed: onDelete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(16),
            child: Icon(
              FontAwesomeIcons.trash,
              size: responsiveFontSize(context, 20),
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => EditGoalDialogBox(index: index),
          );
        },
        child: IntrinsicHeight(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: responsiveSpacing(context, 12),
                horizontal: responsiveSpacing(context, 8)),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Color(goal.color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 1,
                // ignore: deprecated_member_use
                color: Color(goal.color).withOpacity(0.4),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    goal.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: responsiveFontSize(context, 20),
                    ),
                  ),
                  SizedBox(height: responsiveSpacing(context, 3)),
                  ProgressSection(goal: goal),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
