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
      print("Error fetching rules: $e");
      return [];
    }
  }

  Future<void> addRule(RuleModel rule) async {
    try {
      final box = await _box;
      await box.add({'title': rule.title, 'description': rule.description});
    } catch (e) {
      print("Error adding rule: $e");
    }
  }

  Future<void> deleteRule(int index) async {
    try {
      final box = await _box;
      await box.deleteAt(index);
    } catch (e) {
      print("Error deleting rule: $e");
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
      print("Error updating rule: $e");
    }
  }

  Future<void> closeBox() async {
    if (Hive.isBoxOpen(Config.kRuleBox)) {
      await Hive.box(Config.kRuleBox).close();
    }
  }
}