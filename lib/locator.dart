import 'package:bookapp/service/api/api_utils/api_helper.dart';
import 'package:bookapp/service/api/books_api/books_api.dart';
import 'package:bookapp/service/api/books_api/books_api_impl.dart';
import 'package:bookapp/service/onboarding/onboarding_info_cache.dart';
import 'package:get_it/get_it.dart';

import 'service/api/authentication_api/authentication_api.dart';
import 'service/api/authentication_api/authentication_api_impl.dart';
import 'service/theme/theme_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  //Api services
  locator.registerLazySingleton<API>(() => API());
  locator
      .registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());
  //onboarding
  locator.registerLazySingleton<OnboardInfoCache>(() => OnboardInfoCache());
  //Theme service
  locator.registerLazySingleton<ThemeService>(() => ThemeService());
  locator.registerLazySingleton<BooksApi>(() => BooksApiImpl());
}
