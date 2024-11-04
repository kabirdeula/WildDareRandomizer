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

  Future<SettingsModel> _loadSettings() async {
    try {
      final box = await _box;
      final settingsJson = box.get(_settingsKey);
      return settingsJson != null
          ? SettingsModel.fromJson(Map<String, dynamic>.from(settingsJson))
          : const SettingsModel();
    } catch (e, stackTrace) {
      log.e("Error Loading Settings: $e", error: e, stackTrace: stackTrace);
      return const SettingsModel();
    }
  }

  Future<void> toggleTheme(bool isDarkMode) async {
    try {
      final settings = await _loadSettings();
      final updatedSettings = settings.copyWith(isDarkMode: isDarkMode);
      final box = await _box;
      await box.put(_settingsKey, updatedSettings.toJson());
    } catch (e, stackTrace) {
      log.e("Error Toggling Theme: $e", error: e, stackTrace: stackTrace);
    }
  }

  Future<bool> loadTheme() async {
    final settings = await _loadSettings();
    return settings.isDarkMode;
  }
}
