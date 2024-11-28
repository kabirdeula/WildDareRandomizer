import 'dart:convert';
import 'dart:html' as html;
import 'dart:math' hide log;

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/app/config.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

/// A service class the manages CRUD operations for rules stored in a Hive database,
/// as well as functionality for importing and exporting rules in JSON format.
///
/// This service provides methods for adding, fetching, updating, deleting,
/// shuffling, and exporting rules to a JSON file. It also includes import
/// functionality to load rules from a JSON file into the app.
class RuleService {
  /// The [Future] Hive [Box] instance for managing the rule data storage.
  late Future<Box> _box;

  /// Creates a new instance of [RuleService] and initializes the Hive box.
  RuleService() {
    _box = HiveUtil.openHiveBox(Config.kRuleBox);
  }

  /// Fetches all rules from the Hive box and converts them to a list of [RuleModel] objects.
  ///
  /// Returns a [List] of [RuleModel] objects or an empty list if an error occurs.
  Future<List<RuleModel>> fetchAllRules() async {
    try {
      final box = await _box;
      log.d("Rules: ${box.values}");
      return box.values
          .whereType<Map>()
          .map((ruleMap) => RuleModel(
              title: ruleMap['title'] ?? '',
              description: ruleMap['description'] ?? '',
              level: ruleMap['level'] ?? ''))
          .toList();
    } catch (e) {
      log.e("Error fetching rules: $e");
      return [];
    }
  }

  /// Adds a new rule to the Hive box.
  ///
  /// [rule] - The [RuleModel] instance to add to the box.
  Future<void> addRule(RuleModel rule) async {
    try {
      final box = await _box;
      await box.add({
        'title': rule.title,
        'description': rule.description,
        'level': rule.level,
      });
    } catch (e) {
      log.e("Error adding rule: $e");
    }
  }

  /// Deletes a rule from the Hive box at the specified [index].
  Future<void> deleteRule(int index) async {
    try {
      final box = await _box;
      await box.deleteAt(index);
    } catch (e) {
      log.e("Error deleting rule: $e");
    }
  }

  /// Updates a rule in the Hive box at the specified [index] with new data.
  ///
  /// [rule] - The updated [RuleModel] object.
  Future<void> updateRule(int index, RuleModel rule) async {
    try {
      final box = await _box;
      await box.putAt(index, {
        'title': rule.title,
        'description': rule.description,
        'level': rule.level
      });
    } catch (e) {
      log.e("Error updating rule: $e");
    }
  }

  /// Shuffles the list of rules randomly and saves the shuffled order back to the Hive box.
  ///
  /// Returns the shuffled list of [RuleModel] objects.
  Future<List<RuleModel>> shuffleRules() async {
    final rules = await fetchAllRules();
    rules.shuffle(Random());
    final box = await _box;
    await box.clear();

    // Save the shuffled rules back to the box
    for (var rule in rules) {
      await box.add({
        'title': rule.title,
        'description': rule.description,
        'level': rule.level
      });
    }
    return rules;
  }

  /// Closes the Hive box if it is currently open.s
  Future<void> closeBox() async {
    if (Hive.isBoxOpen(Config.kRuleBox)) {
      await Hive.box(Config.kRuleBox).close();
    }
  }

  /// Converts a list of [RuleModel] objects to a JSON-formatted [String].
  ///
  /// [rules] - The list of rules to convert.
  /// Returns the JSON [String] representation of the list.
  String convertRulesToJson(List<RuleModel> rules) {
    List<Map<String, dynamic>> jsonList =
        rules.map((rule) => rule.toJson()).toList();
    return jsonEncode(jsonList);
  }

  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    log.d('Path: ${directory.path}');
    return '${directory.path}/rules.json';
  }

  /// Exports all rules to a JSON file named `rules.json`.
  ///
  /// For web, initiates a download of the file directly. Logs an error if an
  /// exception occurs during export.
  Future<void> exportToJson() async {
    try {
      final rules = await fetchAllRules();
      String jsonString = convertRulesToJson(rules);
      if (kIsWeb) {
        final blob = html.Blob([jsonString]);

        final url = html.Url.createObjectUrlFromBlob(blob);

        final anchor = html.AnchorElement(href: url)
          ..target = 'blank'
          ..download = 'rules.json';

        anchor.click();

        html.Url.revokeObjectUrl(url);
      }
    } catch (e) {
      log.e("Error exporting data: $e");
    }
  }

  /// Imports rules from a JSON file and converts them into a list of [RuleModel] objects.
  ///
  /// For web, opens a file picker for the user to select the file.
  /// Returns a list of imported [RuleModel] objects or an empty list if an error occurs.
  Future<List<RuleModel>> importRulesFromFile() async {
    try {
      final input = html.FileUploadInputElement()..accept = ".json";
      input.click();

      final file = await input.onChange.first.then((_) => input.files?.first);
      if (file == null) return [];

      final reader = html.FileReader();
      reader.readAsText(file);

      await reader.onLoadEnd.first;

      final jsonString = reader.result as String;
      final List<dynamic> data = json.decode(jsonString);
      return data.map((rule) => RuleModel.fromJson(rule)).toList();
    } catch (e) {
      log.e("Error importing data: $e");
      return [];
    }
  }

  /// Clears all rules from the Hive box.
  ///
  /// Throws an error if an exception occurs during the operation.
  Future<void> clearRules() async {
    try {
      final box = await _box;
      await box.clear();
    } catch (e) {
      log.e("Error clearing rules: $e");
    }
  }
}
