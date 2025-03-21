import 'package:hive/hive.dart';
import 'package:spendly/constants/constants.dart';

class Database {
  final namesBox = Hive.box(names);
  final expensesBox = Hive.box(expenses);
  final goalsBox = Hive.box(goals);
  final walletBox = Hive.box(wallet);
  final spentBox = Hive.box(spent);

  String? selectedName = "";

  void setSelectedName(String name) {
    selectedName = name;
    namesBox.put("selectedName", selectedName);
  }

  void deleteName(String name) {
    List<String> names = namesBox.get("names") ?? [];
    names.remove(name);
    namesBox.put("names", names);
    if (expensesBox.containsKey(name)) {
      expensesBox.delete(name);
    }
    if (goalsBox.containsKey(name)) {
      goalsBox.delete(name);
    }
    if (walletBox.containsKey(name)) {
      walletBox.delete(name);
    }
    if (spentBox.containsKey(name)) {
      spentBox.delete(name);
    }
  }

  String? getName() {
    if (namesBox.get("selectedName") == null) {
      selectedName = null;
    } else {
      selectedName = namesBox.get("selectedName");
    }
    return selectedName;
  }

  void saveName(String name) {
    List<String> names = namesBox.get("names") ?? [];
    names.add(name);
    namesBox.put("names", names);

    selectedName = name;
    namesBox.put("selectedName", selectedName);
  }

  List<String> getProfiles() {
    List<String> profiles = namesBox.get("names");
    return profiles;
  }

  void saveWallet(double wallet) {
    walletBox.put(selectedName, wallet);
  }

  void saveSpent(double spent) {
    spentBox.put(selectedName, spent);
  }

  void saveExpenses(List expenses) {
    expensesBox.put(selectedName, expenses);
  }

  void saveGoals(List goals) {
    goalsBox.put(selectedName, goals);
  }

  double loadWallet() {
    double wallet;
    if (walletBox.get(selectedName) == null) {
      wallet = 0;
    } else {
      wallet = walletBox.get(selectedName);
    }
    return wallet;
  }

  double loadSpent() {
    double spent;
    if (spentBox.get(selectedName) == null) {
      spent = 0;
    } else {
      spent = spentBox.get(selectedName);
    }
    return spent;
  }

  List loadExpenses() {
    List expenses;
    if (expensesBox.get(selectedName) == null) {
      expenses = [];
    } else {
      expenses = expensesBox.get(selectedName);
    }
    return expenses;
  }

  List loadGoals() {
    List goals;
    if (goalsBox.get(selectedName) == null) {
      goals = [];
    } else {
      goals = goalsBox.get(selectedName);
    }
    return goals;
  }
}
