import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';

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

  bool isDarkMode(WidgetRef ref) {
    return ref.watch(themeProvider) == ThemeMode.dark;
  }

  Card buildRuleCard({
    required BuildContext context,
    required String content,
    required TextStyle? style,
    required double maxFontSize,
    required double minFontSize,
    bool isScrollable = false,
    required Color color,
  }) {
    final child = AutoSizeText(
      content,
      style: style,
      maxFontSize: maxFontSize,
      minFontSize: minFontSize,
      maxLines: isScrollable ? 12 : 4,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
    return Card(
      elevation: 2,
      color: color,
      child: Padding(
        padding: EdgeInsets.all(kIsWeb ? 16 : 8.w),
        child: Center(
          child: isScrollable ? SingleChildScrollView(child: child) : child,
        ),
      ),
    );
  }
}
