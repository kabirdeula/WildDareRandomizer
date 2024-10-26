import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/data/sources/hive_services.dart';

class RuleRepository {
  final HiveServices _hiveService = HiveServices();
  Future<List<RuleModel>> loadRulesFromJson() async {
    final String response = await rootBundle.loadString('assets/rules.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => RuleModel.fromJson(json)).toList();
  }

  Future<List<RuleModel>> fetchAllRules() async {
    List<RuleModel> predefinedRules = await loadRulesFromJson();
    List<RuleModel> customRules = await _hiveService.fetchAllRules();

    List<RuleModel> allRules = [...predefinedRules, ...customRules];
    allRules.shuffle();
    return allRules.take(16).toList();
  }
}
