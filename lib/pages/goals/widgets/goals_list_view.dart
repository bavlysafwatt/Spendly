import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/widgets/empty_body.dart';
import 'package:spendly/cubits/goal_cubit/goal_cubit.dart';
import 'package:spendly/pages/goals/widgets/goal_card.dart';

class GoalsListView extends StatefulWidget {
  const GoalsListView({super.key});

  @override
  State<GoalsListView> createState() => _GoalsListViewState();
}

class _GoalsListViewState extends State<GoalsListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GoalCubit>(context).loadGoals();
  }

  @override
  Widget build(BuildContext context) {
    List goals = BlocProvider.of<GoalCubit>(context).goals;
    return BlocBuilder<GoalCubit, GoalState>(
      builder: (context, state) {
        if (goals.isEmpty) {
          return EmptyBody(message: "No Goals are Available Now!");
        } else {
          return ListView.builder(
            itemCount: goals.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                  bottom: responsiveSpacing(context, 10),
                  top: index == 0 ? 10 : 0),
              child: GoalCard(
                goal: goals[index],
                onDelete: (context) =>
                    BlocProvider.of<GoalCubit>(context).deleteGoal(index),
                index: index,
              ),
            ),
          );
        }
      },
    );
  }
}
