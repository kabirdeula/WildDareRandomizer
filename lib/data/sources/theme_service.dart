import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/data/models/settings_model.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

class ThemeService {
  late final Future<Box> _box;
  static const _settingsKey = 'settings';

  ThemeService() {
    _box = HiveUtil.openHiveBox(Config.kSettingsBox);
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    try {
      final box = await _box;
      final settingsJson = box.get(_settingsKey);
      final settings = settingsJson != null
          ? SettingsModel.fromJson(Map<String, dynamic>.from(settingsJson))
          : const SettingsModel();
      final updatedSettings = settings.copyWith(isDarkMode: isDarkMode);
      await box.put(_settingsKey, updatedSettings.toJson());
    } catch (e, stackTrace) {
      log.e("Error toggling theme: $e", error: e, stackTrace: stackTrace);
    }
  }

  Future<bool> loadTheme() async {
    try {
      final box = await _box;
      final settingsJson = box.get(_settingsKey);
      final settings = settingsJson != null
          ? SettingsModel.fromJson(Map<String, dynamic>.from(settingsJson))
          : const SettingsModel();
      return settings.isDarkMode;
    } catch (e, stackTrace) {
      log.e('Error loading theme: $e', error: e, stackTrace: stackTrace);
      return false;
    }
  }
}
