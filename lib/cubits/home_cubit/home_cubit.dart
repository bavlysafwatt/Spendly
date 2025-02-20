// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:spendly/constants/constants.dart';
import 'package:spendly/core/util/database.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final box = Hive.box(kBox);
  double wallet = 0;
  double spent = 0;
  Database database = Database();

  void loadProfile() {
    wallet = database.loadWallet();
    spent = database.loadSpent();
    emit(HomeRefresh());
  }

  void editWallet(double amount) {
    wallet += amount;
    emit(HomeRefresh());
    database.saveWallet(wallet);
  }

  void editSpent(double amount) {
    spent += amount;
    emit(HomeRefresh());
    database.saveSpent(spent);
  }
}
