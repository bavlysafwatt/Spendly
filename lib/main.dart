import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/core/util/service_locator.dart';
import 'package:spendly/core/widgets/introduction_page.dart';
import 'package:spendly/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:spendly/cubits/goal_cubit/goal_cubit.dart';
import 'package:spendly/cubits/home_cubit/home_cubit.dart';
import 'package:spendly/models/expense.dart';
import 'package:spendly/models/goal.dart';
import 'package:spendly/pages/home/home_page.dart';

void main() async {
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());
  Hive.registerAdapter(GoalAdapter());
  await Hive.openBox(names);
  await Hive.openBox(expenses);
  await Hive.openBox(spent);
  await Hive.openBox(goals);
  await Hive.openBox(wallet);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: scaffoldBackgroundColor,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(Spendly());
  });
}

class Spendly extends StatelessWidget {
  const Spendly({super.key});

  @override
  Widget build(BuildContext context) {
    String? name = getIt.get<Database>().getName();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..loadProfile(),
        ),
        BlocProvider(
          create: (context) =>
              ExpensesCubit(context.read<HomeCubit>())..loadExpenses(),
        ),
        BlocProvider(
          create: (context) => GoalCubit(
              context.read<ExpensesCubit>(), context.read<HomeCubit>()),
        ),
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Exo",
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            primarySwatch: Colors.lightBlue,
            useMaterial3: false,
          ),
          home: name == null ? IntroductionPage() : HomePage(),
        ),
      ),
    );
  }
}
