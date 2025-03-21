import 'package:get_it/get_it.dart';
import 'package:spendly/core/util/database.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Database>(
    () => Database(),
  );
}
