import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/data/sources/hive_services.dart';

class RuleRepository {
  final HiveServices _hiveService;

  RuleRepository({HiveServices? hiveService})
      : _hiveService = hiveService ?? HiveServices();

  Future<void> loadRulesFromJson() async {
    try {
      final String response = await rootBundle.loadString('assets/rules.json');
      print('JSON Loaded Successfully');
      final List<dynamic> data = json.decode(response);

      final List<RuleModel> rules =
          data.map((json) => RuleModel.fromJson(json)).toList();

      for (final rule in rules) {
        await _hiveService.addRule(rule);
      }
    } catch (e) {
      print("Error loading rules from JSON: $e");
    }
  }

  Future<void> loadRulesIfNeeded() async {
    final existingRules = await _hiveService.fetchAllRules();
    if (existingRules.isEmpty) {
      await loadRulesFromJson();
    }
  }

  Future<List<RuleModel>> fetchAllRules() async {
    List<RuleModel> customRules = await _hiveService.fetchAllRules();

    return customRules.toList();
  }

  Future<void> addRule(RuleModel rule) async {
    await _hiveService.addRule(rule);
  }

  Future<void> updateRule(int index, RuleModel rule) async {
    await _hiveService.updateRule(index, rule);
  }

  Future<void> deleteRule(int index) async {
    await _hiveService.deleteRule(index);
  }
}
