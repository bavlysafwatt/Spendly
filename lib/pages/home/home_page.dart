import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/cubits/home_cubit/home_cubit.dart';
import 'package:spendly/pages/home/widgets/expenses_section.dart';
import 'package:spendly/pages/home/widgets/welcome_and_wallet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: WelcomeAndWallet(),
                ),
                Expanded(
                  flex: 4,
                  child: ExpensesSection(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
