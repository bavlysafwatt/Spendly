import 'package:flutter/material.dart';
import 'package:spendly/pages/goals/widgets/edit_goal_form.dart';

class EditGoalDialogBox extends StatelessWidget {
  const EditGoalDialogBox({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffe9e8f0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: EditGoalForm(index: index),
        ),
      ),
    );
  }
}
