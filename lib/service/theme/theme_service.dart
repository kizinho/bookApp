import 'package:hive/hive.dart';

class ThemeService {
  bool isDark = false;
  Future<bool> initializeThemeService() async {
    final settings = await Hive.openBox('booksfinder');
    bool _dark = settings.get('isDark') ?? false;
    isDark = _dark;
    return isDark;
  }
}
