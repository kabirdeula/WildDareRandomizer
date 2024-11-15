import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/data/sources/rule_service.dart';
import 'package:wild_dare_randomizer/utils/logger_util.dart';

/// A repository for managing and accessing rules in the app.
class RuleRepository {
  final RuleService _ruleService;

  /// Constructs a [RuleRepository] with an optional [RuleService] dependency.
  /// If no [ruleService] is provided, a default instance of [RuleService] is used.
  RuleRepository({RuleService? ruleService})
      : _ruleService = ruleService ?? RuleService();

  /// Loads rules from a JSON file in the assets and stores them using the [RuleService].
  ///
  /// If any error occurs while loading or parsing the JSON, it will be logged.
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
      log.e("Error loading rules from JSON: $e");
    }
  }

  /// Loads rules from the JSON file if no existing rules are found in storage.
  Future<void> loadRulesIfNeeded() async {
    final existingRules = await _ruleService.fetchAllRules();
    if (existingRules.isEmpty) {
      await loadRulesFromJson();
    }
  }

  /// Retrieves all rules stored in the [RuleService].
  ///
  /// Returns a list of [RuleModel] objects representing the current rules.
  Future<List<RuleModel>> fetchAllRules() async {
    List<RuleModel> customRules = await _ruleService.fetchAllRules();
    return customRules.toList();
  }

  /// Adds a new rule to the repository.
  ///
  /// Takes a [RuleModel] object representing the rule to add.
  Future<void> addRule(RuleModel rule) async {
    await _ruleService.addRule(rule);
  }

  /// Updates an existing rule at the specified [index].
  ///
  /// Takes a [RuleModel] object representing the updated rule.
  Future<void> updateRule(int index, RuleModel rule) async {
    await _ruleService.updateRule(index, rule);
  }

  /// Deletes a rule from the repository at the specified [index].
  Future<void> deleteRule(int index) async {
    await _ruleService.deleteRule(index);
  }

  /// Retrieves and shuffles the list of rules.
  ///
  /// Returns a shuffled list of [RuleModel] objects.
  Future<List<RuleModel>> shuffleRules() async {
    return await _ruleService.shuffleRules();
  }

  /// Exports the current rules to a JSON file.
  ///
  /// This is useful for backing up or sharing rule data.
  Future<void> exportData() async {
    await _ruleService.exportToJson();
  }

  /// Imports rules from a file and adds them to the repository.
  ///
  /// Returns a list of imported [RuleModel] objects.
  Future<List<RuleModel>> importData() async {
    final importedRules = await _ruleService.importRulesFromFile();
    for (var rule in importedRules) {
      await _ruleService.addRule(rule);
    }
    return importedRules;
  }

  /// Clears all rules from the storage.
  ///
  /// This method is useful when a reset of the rule data is needed.
  Future<void> clearRules() async {
    await _ruleService.clearRules();
  }
}
