// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/functions/show_snack_bar.dart';
import 'package:spendly/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:spendly/pages/add/widgets/add_expense_button.dart';
import 'package:spendly/pages/add/widgets/add_expense_text_field.dart';

class AddPageBody extends StatelessWidget {
  AddPageBody({super.key});

  final TextEditingController amount = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpensesCubit, ExpensesState>(
      listener: (context, state) {
        if (state is ExpensesSuccess) {
          FocusScope.of(context).unfocus();
          amount.clear();
          description.clear();
          showSnackBar(context, "Expense Saved.", Colors.green);
        } else if (state is ExpensesFailure) {
          showSnackBar(context, state.message, Colors.red);
        }
      },
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: responsiveSpacing(context, 20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add or Withdraw to/from your wallet!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsiveFontSize(context, 20),
                ),
              ),
              SizedBox(height: responsiveSpacing(context, 20)),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: responsiveSpacing(context, 16),
                    vertical: responsiveSpacing(context, 15)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(
                    width: 1.5,
                    color: primaryColor,
                  ),
                ),
                child: Column(
                  children: [
                    AddExpenseTextField(
                      controller: amount,
                      hint: "0.00",
                      keyboardType: TextInputType.number,
                    ),
                    Divider(
                      color: primaryColor,
                      thickness: 1.5,
                    ),
                    AddExpenseTextField(
                      controller: description,
                      hint: "Description",
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsiveSpacing(context, 20)),
              Row(
                children: [
                  Expanded(
                    child: AddExpenseButton(
                      iconData: Icons.remove_circle_outline,
                      text: "Withdraw",
                      onTap: () {
                        if (amount.text.isNotEmpty &&
                            description.text.isNotEmpty) {
                          BlocProvider.of<ExpensesCubit>(context).saveWithdraw(
                              title: description.text,
                              amount: double.parse(amount.text));
                        } else {
                          showSnackBar(
                              context, "Please add missing data.", Colors.red);
                        }
                      },
                      backgroundColor: Colors.red.shade50,
                      textColor: Colors.red,
                    ),
                  ),
                  SizedBox(width: responsiveSpacing(context, 10)),
                  Expanded(
                    child: AddExpenseButton(
                      iconData: Icons.add_circle_outline,
                      text: "Add",
                      onTap: () {
                        if (amount.text.isNotEmpty &&
                            description.text.isNotEmpty) {
                          BlocProvider.of<ExpensesCubit>(context).saveDeposit(
                              title: description.text,
                              amount: double.parse(amount.text));
                        } else {
                          showSnackBar(
                              context, "Please add missing data.", Colors.red);
                        }
                      },
                      backgroundColor: Colors.green.shade50,
                      textColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsiveSpacing(context, 40)),
            ],
          ),
        ),
      ),
    );
  }
}
