import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/widgets/confirm_dialog.dart';
import 'package:spendly/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:spendly/pages/add/add_page.dart';
import 'package:spendly/pages/expenses/widgets/clear_button.dart';
import 'package:spendly/pages/expenses/widgets/expenses_list_view.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "All Expenses",
          style: TextStyle(
            fontSize: responsiveFontSize(context, 24),
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: responsiveSpacing(context, 16)),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
          ),
        ),
        actions: [
          ClearButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ConfirmDialog(
                    onTap: () => BlocProvider.of<ExpensesCubit>(context)
                        .clearExpenses()),
              );
            },
          ),
        ],
      ),
      body: ExpensesListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => AddPage(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 150),
          ),
        ),
      ),
    );
  }
}
