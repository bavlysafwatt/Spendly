part of 'goal_cubit.dart';

@immutable
sealed class GoalState {}

final class GoalInitial extends GoalState {}

final class GoalSuccess extends GoalState {}

final class GoalFailure extends GoalState {
  final String message;

  GoalFailure({required this.message});
}
