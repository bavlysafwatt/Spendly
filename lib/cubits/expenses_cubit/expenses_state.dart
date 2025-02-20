part of 'expenses_cubit.dart';

@immutable
sealed class ExpensesState {}

final class ExpensesInitial extends ExpensesState {}

final class ExpensesSuccess extends ExpensesState {}

final class ExpensesFailure extends ExpensesState {
  final String message;

  ExpensesFailure({required this.message});
}
