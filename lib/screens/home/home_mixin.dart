import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';

mixin HomeMixin {
  late final List<RuleModel> rules;

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

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
}
