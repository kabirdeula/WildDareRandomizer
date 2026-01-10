import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/model.dart';
import '../data/sources/source.dart';
import '../utils/util.dart';

/// Manages persisted user settings.
class SettingsCubit extends Cubit<SettingsModel> {
  final ThemeService _themeService;

  SettingsCubit(this._themeService) : super(const SettingsModel()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final settings = await _themeService.loadSettings();
      emit(settings);
    } catch (e) {
      log.e('Error loading settings: $e');
    }
  }

  Future<void> toggleTheme() async {
    try {
      final isDarkMode = !state.isDarkMode;
      emit(state.copyWith(isDarkMode: isDarkMode));
      await _themeService.toggleTheme(isDarkMode);
    } catch (e) {
      log.e('Error toggling theme: $e');
    }
  }

  void toggleViewMode() {
    emit(state.copyWith(isGridView: !state.isGridView));
  }
}
