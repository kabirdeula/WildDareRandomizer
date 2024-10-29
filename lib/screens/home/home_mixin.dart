import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/screens/custom_rule_screen.dart';

mixin HomeMixin {
  late final List<RuleModel> rules;

  int getCrossAxisCount(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    return (screenWidth < 600)
        ? 2
        : (screenWidth < 1200)
            ? 4
            : 6;
  }

  Color getRuleColor(int index) {
    switch (index % 4) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.yellow;
      default:
        return Colors.purple;
    }
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void toggleViewMode(WidgetRef ref, bool currentViewMode) {
    ref.read(viewModeProvider.notifier).state = !currentViewMode;
  }

  void navigateToCustomRules(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CustomRuleScreen()),
    );
  }

  bool isDarkMode(WidgetRef ref) {
    return ref.watch(themeProvider) == ThemeMode.dark;
  }
}
