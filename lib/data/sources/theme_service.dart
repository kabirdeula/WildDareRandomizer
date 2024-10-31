import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

class ThemeService {
  late Future<Box> _box;
  static const _themeKey = 'isDarkMode';

  ThemeService() {
    _box = HiveUtil.openHiveBox(Config.kSettingsBox);
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    try {
      final box = await _box;
      await box.put(_themeKey, isDarkMode);
    } catch (e) {
      log.e("Error toggling theme: $e");
    }
  }

  Future<bool> loadTheme() async {
    try {
      final box = await _box;
      return box.get(_themeKey, defaultValue: false);
    } catch (e) {
      log.e('Error loading theme: $e');
      return false;
    }
  }
}
