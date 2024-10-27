import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';

class HiveServices {
  Future<Box> openBox() async {
    if (!Hive.isBoxOpen(Config.kHiveBox)) {
      return await Hive.openBox(Config.kHiveBox);
    }
    return Hive.box(Config.kHiveBox);
  }

  Future<List<RuleModel>> fetchAllRules() async {
    final box = await openBox();
    final rules = box.values
        .whereType<Map>()
        .map((ruleMap) => RuleModel(
            title: ruleMap['title'] ?? '',
            description: ruleMap['description'] ?? ''))
        .toList();
    return rules;
  }

  Future<void> addRule(RuleModel rule) async {
    final box = await openBox();
    await box.add({'title': rule.title, 'description': rule.description});
  }

  Future<void> deleteRule(int index) async {
    final box = await openBox();
    await box.deleteAt(index);
  }

  Future<void> updateRule(int index, RuleModel rule) async {
    final box = await openBox();
    await box.putAt(index, {
      'title': rule.title,
      'description': rule.description,
    });
  }

  Future<void> closeBox() async {
    if (Hive.isBoxOpen(Config.kHiveBox)) {
      await Hive.box(Config.kHiveBox).close();
    }
  }
}
