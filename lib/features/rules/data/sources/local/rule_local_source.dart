import 'package:hive_ce/hive.dart';

import '../../../../../core/core.dart';
import '../../../rules.dart';

class RuleLocalSource {
  static const _boxName = HiveBoxes.ruleEntity;

  Future<Box<RuleEntity>> get _box async =>
      await HiveService.openBox<RuleEntity>(boxName: _boxName);

  Future<void> saveRules(List<RuleEntity> rules) async {
    final box = await _box;
    for (var rule in rules) {
      await box.put(rule.id, rule);
    }
  }

  Future<List<RuleEntity>> getRules() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> clearRules() async {
    final box = await _box;
    await box.clear();
  }
}
