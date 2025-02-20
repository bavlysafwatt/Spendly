import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String date;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final bool isGoal;

  @HiveField(4)
  final String type;

  Expense({
    required this.title,
    required this.date,
    required this.amount,
    required this.isGoal,
    required this.type,
  });
}
