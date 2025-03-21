// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/core/util/service_locator.dart';
import 'package:spendly/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:spendly/cubits/home_cubit/home_cubit.dart';
import 'package:spendly/models/goal.dart';

part 'goal_state.dart';

class GoalCubit extends Cubit<GoalState> {
  GoalCubit(this.expensesCubit, this.homeCubit) : super(GoalInitial());

  List goals = [];
  final HomeCubit homeCubit;
  final ExpensesCubit expensesCubit;
  int goalColor = 0xff2196f3;

  void loadGoals() {
    goals = getIt.get<Database>().loadGoals();
    emit(GoalSuccess());
  }

  void saveGoal(
      {required String title, required double amount, double completed = 0}) {
    Goal goal =
        Goal(goalColor, title: title, amount: amount, completed: completed);
    goals.add(goal);
    emit(GoalSuccess());
    getIt.get<Database>().saveGoals(goals);
  }

  void editGoal(
      {required int index, required double amount, required bool isAddition}) {
    if (isAddition) {
      if (homeCubit.wallet - amount < 0) {
        emit(GoalFailure(message: "Your wallet doesn't have enough money."));
        return;
      }
      double goalAmount = goals[index].amount;
      double goalCompleted = goals[index].completed;
      if (goalAmount - goalCompleted < amount) {
        emit(GoalFailure(message: "The amount is higher than needed."));
      } else {
        goals[index].completed += amount;
        emit(GoalSuccess());
        expensesCubit.saveWithdraw(
            title: goals[index].title, amount: amount, isGoal: true);
      }
    } else {
      double goalCompleted = goals[index].completed;
      if (amount > goalCompleted) {
        emit(GoalFailure(message: "The amount is higher than completed."));
      } else {
        goals[index].completed -= amount;
        emit(GoalSuccess());
        expensesCubit.saveDeposit(
            title: goals[index].title, amount: amount, isGoal: true);
      }
    }
    getIt.get<Database>().saveGoals(goals);
  }

  void deleteGoal(int index) {
    goals.removeAt(index);
    emit(GoalSuccess());
    getIt.get<Database>().saveGoals(goals);
  }
}
