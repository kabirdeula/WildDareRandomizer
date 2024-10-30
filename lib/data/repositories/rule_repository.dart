import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/data/sources/rule_service.dart';

class RuleRepository {
  final RuleService _ruleService;

  RuleRepository({RuleService? ruleService})
      : _ruleService = ruleService ?? RuleService();

  Future<void> loadRulesFromJson() async {
    try {
      final String response = await rootBundle.loadString('assets/rules.json');

      final List<dynamic> data = json.decode(response);

      final List<RuleModel> rules =
          data.map((json) => RuleModel.fromJson(json)).toList();

      for (final rule in rules) {
        await _ruleService.addRule(rule);
      }
    } catch (e) {
      print("Error loading rules from JSON: $e");
    }
  }

  Future<void> loadRulesIfNeeded() async {
    final existingRules = await _ruleService.fetchAllRules();
    if (existingRules.isEmpty) {
      await loadRulesFromJson();
    }
  }

  Future<List<RuleModel>> fetchAllRules() async {
    List<RuleModel> customRules = await _ruleService.fetchAllRules();

    return customRules.toList();
  }

  Future<void> addRule(RuleModel rule) async {
    await _ruleService.addRule(rule);
  }

  Future<void> updateRule(int index, RuleModel rule) async {
    await _ruleService.updateRule(index, rule);
  }

  Future<void> deleteRule(int index) async {
    await _ruleService.deleteRule(index);
  }

  Future<List<RuleModel>> shuffleRules() async {
    return await _ruleService.shuffleRules();
  }
}
