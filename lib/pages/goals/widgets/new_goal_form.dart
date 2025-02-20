import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/functions/show_snack_bar.dart';
import 'package:spendly/core/widgets/custom_text_field.dart';
import 'package:spendly/cubits/goal_cubit/goal_cubit.dart';
import 'package:spendly/pages/goals/widgets/colors_list.dart';
import 'package:spendly/pages/goals/widgets/goal_button.dart';

class NewGoalForm extends StatelessWidget {
  NewGoalForm({super.key});

  final TextEditingController goalName = TextEditingController();
  final TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoalCubit, GoalState>(
      listener: (context, state) {
        if (state is GoalSuccess) {
          Navigator.of(context).pop();
          goalName.clear();
          amount.clear();
          showSnackBar(context, "Goal added successfully.", Colors.green);
        } else if (state is GoalFailure) {
          showSnackBar(context, state.message, Colors.red);
        }
      },
      child: Center(
        child: Column(
          children: [
            Text(
              "Add new goal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: responsiveFontSize(context, 22),
                color: primaryColor,
              ),
            ),
            SizedBox(height: responsiveSpacing(context, 20)),
            CustomTextField(
              controller: goalName,
              hint: "Goal name",
            ),
            SizedBox(height: responsiveSpacing(context, 10)),
            CustomTextField(
              controller: amount,
              hint: "Amount",
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: responsiveSpacing(context, 20)),
            Text(
              "Color",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: responsiveFontSize(context, 18),
                color: Colors.black,
              ),
            ),
            SizedBox(height: responsiveSpacing(context, 5)),
            ColorsList(),
            SizedBox(height: responsiveSpacing(context, 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GoalButton(
                  text: 'Cancel',
                  onTap: () => Navigator.of(context).pop(),
                  backgroundColor: Colors.white,
                  textColor: Colors.grey.shade700,
                ),
                GoalButton(
                  text: 'Add',
                  onTap: () {
                    if (goalName.text.isNotEmpty && amount.text.isNotEmpty) {
                      BlocProvider.of<GoalCubit>(context).saveGoal(
                          title: goalName.text,
                          amount: double.parse(amount.text));
                    } else {
                      showSnackBar(
                          context, "Please add missing data.", Colors.red);
                    }
                  },
                  backgroundColor: primaryColor,
                  textColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: responsiveSpacing(context, 5)),
          ],
        ),
      ),
    );
  }
}
