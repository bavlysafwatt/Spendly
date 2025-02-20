import 'package:hive/hive.dart';
import 'package:spendly/constants/constants.dart';

class Database {
  final appBox = Hive.box(kBox);

  static String? getName() {
    final appBox = Hive.box(kBox);
    String? name;
    if (appBox.get("name") == null) {
      name = null;
    } else {
      name = appBox.get("name");
    }
    return name;
  }

  void saveName(String name) {
    appBox.put("name", name);
  }

  void saveWallet(double wallet) {
    appBox.put("wallet", wallet);
  }

  void saveSpent(double spent) {
    appBox.put("spent", spent);
  }

  void saveExpenses(List expenses) {
    appBox.put("expensesList", expenses);
  }

  void saveGoals(List goals) {
    appBox.put("goals", goals);
  }

  double loadWallet() {
    double wallet;
    if (appBox.get("wallet") == null) {
      wallet = 0;
    } else {
      wallet = appBox.get("wallet");
    }
    return wallet;
  }

  double loadSpent() {
    double spent;
    if (appBox.get("spent") == null) {
      spent = 0;
    } else {
      spent = appBox.get("spent");
    }
    return spent;
  }

  List loadExpenses() {
    List expenses;
    if (appBox.get("expensesList") == null) {
      expenses = [];
    } else {
      expenses = appBox.get("expensesList");
    }
    return expenses;
  }

  List loadGoals() {
    List goals;
    if (appBox.get("goals") == null) {
      goals = [];
    } else {
      goals = appBox.get("goals");
    }
    return goals;
  }
}
