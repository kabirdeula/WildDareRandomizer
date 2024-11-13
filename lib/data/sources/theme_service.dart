import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/data/models/settings_model.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

/// A service class that manages theme-related settings and preferences for the app.
/// This service provides methods to load, toggle, and save theme settings.
/// by interacting with a local Hive database.
class ThemeService {
  /// The Hive box containing theme settings.
  late final Future<Box> _box;

  /// The key used to store the theme settings in the Hive box.
  static const _settingsKey = 'settings';

  /// Initializes a new instance of [ThemeService].
  /// This constructor opens the Hive box for theme settings.
  ThemeService() {
    _box = HiveUtil.openHiveBox(Config.kSettingsBox);
  }

  /// Loads the theme settings from the Hive box.
  ///
  /// Returns a [SettingsModel] representing the current theme settings.
  /// If no settings are saved, it returns a default [SettingsModel] with
  /// default values.
  Future<SettingsModel> loadSettings() async {
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

  /// Toggles the theme mode between light and dark based on the given [isDarkMode] value.
  ///
  /// This method updates the stored settings with the new theme preference
  /// and saves it to the Hive box.
  ///
  /// * [isDarkMode]: A boolean value indicating whether dark mode is enabled.
  Future<void> toggleTheme(bool isDarkMode) async {
    try {
      final settings = await loadSettings();
      final updatedSettings = settings.copyWith(isDarkMode: isDarkMode);
      final box = await _box;
      await box.put(_settingsKey, updatedSettings.toJson());
    } catch (e, stackTrace) {
      log.e("Error Toggling Theme: $e", error: e, stackTrace: stackTrace);
    }
  }

  /// Loads the current theme preference, returning `true` if dark mode is enabled.
  ///
  /// Returns a [bool] indicating the current theme preference.
  /// This method fetches the value of `isDarkMode` from the [SettingsModel].
  Future<bool> loadTheme() async {
    final settings = await loadSettings();
    return settings.isDarkMode;
  }
}
