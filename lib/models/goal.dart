import 'package:hive_flutter/adapters.dart';

part 'goal.g.dart';

@HiveType(typeId: 1)
class Goal {
  @HiveField(5)
  final String title;

  @HiveField(6)
  final double amount;

  @HiveField(7)
  double completed;

  @HiveField(8)
  final int color;

  Goal(this.color,
      {required this.title, required this.amount, this.completed = 0});
}
