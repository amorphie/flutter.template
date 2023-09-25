import 'package:burgan_core/burgan_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
configureDependencies() {
  getIt.registerLazySingleton<BrgWidgetEventBus>(() => BrgWidgetEventBus());
  getIt.init();
}
