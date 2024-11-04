import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/sources/source.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final _themeService = ThemeService();
  ThemeNotifier() : super(ThemeMode.light) {
    _loadTheme();
  }

  Future<void> toggleTheme() async {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _themeService.toggleTheme(state == ThemeMode.dark);
  }

  Future<void> _loadTheme() async {
    final isDarkMode = await _themeService.loadTheme();
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);

final themeServiceProvider = Provider<ThemeService>((ref) => ThemeService());
