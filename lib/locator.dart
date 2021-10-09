import 'package:bookapp/service/service/theme/theme_service.dart';
import 'package:get_it/get_it.dart';

import 'service/service/api/api_utils/api_helper.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  //Api services
  locator.registerLazySingleton<API>(() => API());
  //Theme service
  locator.registerLazySingleton<ThemeService>(() => ThemeService());
}
