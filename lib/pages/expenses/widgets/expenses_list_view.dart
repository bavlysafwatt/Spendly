import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/widgets/empty_body.dart';
import 'package:spendly/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:spendly/pages/expenses/widgets/deposit_expense_list_tile.dart';
import 'package:spendly/pages/expenses/widgets/exchange_expense_list_tile.dart';

class ExpensesListView extends StatelessWidget {
  const ExpensesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        List expenses =
            BlocProvider.of<ExpensesCubit>(context).expenses.reversed.toList();
        if (expenses.isEmpty) {
          return EmptyBody(message: "No Expenses are Available Now!");
        } else {
          return ListView.builder(
            itemCount: expenses.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    index == 0 ? EdgeInsets.only(top: 10) : EdgeInsets.zero,
                child: expenses[index].type == exchange
                    ? ExchangeExpenseListTile(
                        expense: expenses[index],
                        onPressed: () => BlocProvider.of<ExpensesCubit>(context)
                            .deleteExpense(expenses.length - index - 1),
                      )
                    : DepositExpenseListTile(
                        expense: expenses[index],
                        onPressed: () => BlocProvider.of<ExpensesCubit>(context)
                            .deleteExpense(expenses.length - index - 1),
                      ),
              );
            },
          );
        }
      },
    );
  }
}
