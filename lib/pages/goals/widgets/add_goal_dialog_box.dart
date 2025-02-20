import 'package:flutter/material.dart';
import 'package:spendly/pages/goals/widgets/new_goal_form.dart';

class AddGoalDialogBox extends StatelessWidget {
  const AddGoalDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
          child: NewGoalForm(),
        ),
      ),
    );
  }
}
