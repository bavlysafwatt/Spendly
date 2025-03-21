// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spendly/core/util/database.dart';
import 'package:spendly/core/util/service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  double wallet = 0;
  double spent = 0;

  void loadProfile() {
    wallet = getIt.get<Database>().loadWallet();
    spent = getIt.get<Database>().loadSpent();
    emit(HomeRefresh());
  }

  void editWallet(double amount) {
    wallet += amount;
    emit(HomeRefresh());
    getIt.get<Database>().saveWallet(wallet);
  }

  void editSpent(double amount) {
    spent += amount;
    emit(HomeRefresh());
    getIt.get<Database>().saveSpent(spent);
  }
}
