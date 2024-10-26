import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';

class RuleRepository {
  Future<List<RuleModel>> loadRulesFromJson() async {
    final String response = await rootBundle.loadString('assets/rules.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => RuleModel.fromJson(json)).toList();
  }

  Future<List<RuleModel>> loadCustomRulesFromHive() async {
    var box = Hive.box(Config.kHiveBox);
    List<RuleModel> customRules = [];

    for (var rule in box.values) {
      if (rule is Map &&
          rule.containsKey('title') &&
          rule.containsKey('description')) {
        customRules.add(
          RuleModel(title: rule['title'], description: rule['description']),
        );
      }
    }
    return customRules;
  }

  Future<List<RuleModel>> fetchAllRules() async {
    List<RuleModel> predefinedRules = await loadRulesFromJson();
    List<RuleModel> customRules = await loadCustomRulesFromHive();

    List<RuleModel> allRules = [...predefinedRules, ...customRules];
    allRules.shuffle();
    return allRules.take(16).toList();
  }
}
