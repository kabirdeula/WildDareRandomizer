import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/settings_model.dart';
import 'package:wild_dare_randomizer/data/sources/source.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsModel>((ref) {
  final themeService = ref.watch(themeServiceProvider);
  return SettingsNotifier(themeService);
});

class SettingsNotifier extends StateNotifier<SettingsModel> {
  final ThemeService _themeService;

  SettingsNotifier(this._themeService) : super(const SettingsModel()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = await _themeService.loadSettings();
    state = settings;
  }

  Future<void> toggleTheme() async {
    final isDarkMode = !state.isDarkMode;
    state = state.copyWith(isDarkMode: isDarkMode);
    await _themeService.toggleTheme(isDarkMode);
  }

  void toggleViewMode() {
    state = state.copyWith(isGridView: !state.isGridView);
  }
}
