import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/functions/show_snack_bar.dart';
import 'package:spendly/cubits/goal_cubit/goal_cubit.dart';
import 'package:spendly/pages/goals/widgets/edit_goal_button.dart';

class EditGoalForm extends StatefulWidget {
  const EditGoalForm({super.key, required this.index});

  final int index;

  @override
  State<EditGoalForm> createState() => _EditGoalFormState();
}

class _EditGoalFormState extends State<EditGoalForm> {
  bool isAdding = true;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoalCubit, GoalState>(
      listener: (context, state) {
        if (state is GoalSuccess) {
          Navigator.of(context).pop();
          controller.clear;
          showSnackBar(context, "Goal edited successfully.", Colors.green);
        } else if (state is GoalFailure) {
          showSnackBar(context, state.message, Colors.red);
        }
      },
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: responsiveSpacing(context, 10)),
          child: Column(
            children: [
              Text(
                "Edit Goal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsiveFontSize(context, 35),
                  color: primaryColor,
                ),
              ),
              SizedBox(height: responsiveSpacing(context, 25)),
              Row(
                children: [
                  Expanded(
                    child: EditGoalButton(
                      text: "Addition",
                      onTap: () {
                        setState(() {
                          isAdding = true;
                        });
                      },
                      backgroundColor:
                          isAdding ? primaryColor : Colors.transparent,
                      textColor: isAdding ? Colors.white : primaryColor,
                    ),
                  ),
                  SizedBox(width: responsiveSpacing(context, 10)),
                  Expanded(
                    child: EditGoalButton(
                      text: "Deduction",
                      onTap: () {
                        setState(() {
                          isAdding = false;
                        });
                      },
                      backgroundColor:
                          isAdding ? Colors.transparent : primaryColor,
                      textColor: isAdding ? primaryColor : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsiveSpacing(context, 25)),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Amount",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 159, 159, 159),
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Color(0xfffafafa),
                  filled: true,
                ),
                cursorColor: Colors.black,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: responsiveSpacing(context, 25)),
              Row(
                children: [
                  Expanded(
                    child: EditGoalButton(
                      text: "Confirm",
                      onTap: () {
                        if (controller.text.isNotEmpty) {
                          BlocProvider.of<GoalCubit>(context).editGoal(
                              index: widget.index,
                              amount: double.parse(controller.text),
                              isAddition: isAdding);
                        } else {
                          showSnackBar(
                              context, "Please add missing data.", Colors.red);
                        }
                      },
                      backgroundColor: primaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: responsiveSpacing(context, 20)),
                  Expanded(
                    child: EditGoalButton(
                      text: "Cancel",
                      onTap: () => Navigator.of(context).pop(),
                      backgroundColor: Colors.transparent,
                      textColor: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsiveSpacing(context, 10)),
            ],
          ),
        ),
      ),
    );
  }
}
