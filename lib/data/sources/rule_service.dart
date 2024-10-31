import 'dart:math' hide log;

import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/app/config.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

class RuleService {
  late Future<Box> _box;

  RuleService() {
    _box = HiveUtil.openHiveBox(Config.kRuleBox);
  }

  Future<List<RuleModel>> fetchAllRules() async {
    try {
      final box = await _box;
      return box.values
          .whereType<Map>()
          .map((ruleMap) => RuleModel(
              title: ruleMap['title'] ?? '',
              description: ruleMap['description'] ?? ''))
          .toList();
    } catch (e) {
      log.e("Error fetching rules: $e");
      return [];
    }
  }

  Future<void> addRule(RuleModel rule) async {
    try {
      final box = await _box;
      await box.add({'title': rule.title, 'description': rule.description});
    } catch (e) {
      log.e("Error adding rule: $e");
    }
  }

  Future<void> deleteRule(int index) async {
    try {
      final box = await _box;
      await box.deleteAt(index);
    } catch (e) {
      log.e("Error deleting rule: $e");
    }
  }

  Future<void> updateRule(int index, RuleModel rule) async {
    try {
      final box = await _box;
      await box.putAt(index, {
        'title': rule.title,
        'description': rule.description,
      });
    } catch (e) {
      log.e("Error updating rule: $e");
    }
  }

  Future<List<RuleModel>> shuffleRules() async {
    final rules = await fetchAllRules();
    rules.shuffle(Random());
    final box = await _box;
    await box.clear();

    // Save the shuffled rules back to the box
    for (var rule in rules) {
      await box.add({'title': rule.title, 'description': rule.description});
    }

    return rules;
  }

  Future<void> closeBox() async {
    if (Hive.isBoxOpen(Config.kRuleBox)) {
      await Hive.box(Config.kRuleBox).close();
    }
  }
}
