// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/core/util/service_locator.dart';
import 'package:spendly/cubits/home_cubit/home_cubit.dart';
import 'package:spendly/models/expense.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit(this.homeCubit) : super(ExpensesInitial());

  final HomeCubit homeCubit;
  List expenses = [];

  void loadExpenses() {
    expenses = getIt.get<Database>().loadExpenses();
    emit(ExpensesSuccess());
  }

  void saveWithdraw(
      {required String title, required double amount, bool isGoal = false}) {
    if (homeCubit.wallet - amount < 0) {
      emit(ExpensesFailure(message: "Your wallet doesn't have enough money."));
    } else {
      Expense expense = Expense(
        title: title,
        date: DateFormat('E, dd MMM yyyy · hh:mm a').format(DateTime.now()),
        amount: amount,
        isGoal: isGoal,
        type: exchange,
      );
      expenses.add(expense);
      emit(ExpensesSuccess());
      homeCubit.editWallet(-1 * amount);
      homeCubit.editSpent(amount);
      getIt.get<Database>().saveExpenses(expenses);
    }
  }

  void saveDeposit(
      {required String title, required double amount, bool isGoal = false}) {
    Expense expense = Expense(
      title: title,
      date: DateFormat('E, dd MMM yyyy · hh:mm a').format(DateTime.now()),
      amount: amount,
      isGoal: isGoal,
      type: deposit,
    );
    expenses.add(expense);
    emit(ExpensesSuccess());
    homeCubit.editWallet(amount);
    getIt.get<Database>().saveExpenses(expenses);
  }

  void deleteExpense(int index) {
    if (expenses[index].type == deposit) {
      if (homeCubit.wallet < expenses[index].amount) {
        emit(ExpensesFailure(
            message: "You don't have enough money for this operation."));
      } else {
        double amount = expenses[index].amount;
        expenses.removeAt(index);
        emit(ExpensesSuccess());
        getIt.get<Database>().saveExpenses(expenses);
        homeCubit.editWallet(-1 * amount);
      }
    } else {
      double amount = expenses[index].amount;
      expenses.removeAt(index);
      emit(ExpensesSuccess());
      getIt.get<Database>().saveExpenses(expenses);
      homeCubit.editWallet(amount);
      homeCubit.editSpent(-1 * amount);
    }
  }

  void clearExpenses() {
    expenses.clear();
    emit(ExpensesSuccess());
    getIt.get<Database>().saveExpenses(expenses);
    homeCubit.editSpent(-1 * homeCubit.spent);
  }
}
