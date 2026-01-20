import 'dart:math';

import '../../rules.dart';

class RuleDisplayHelper {
  /// Generates random values for a rule and returns the processed text
  static RuleDisplay processRule(RuleEntity rule, {int? seed}) {
    final random = seed != null ? Random(seed) : Random();
    final generatedValues = <String, int>{};

    // Generate random values for each placeholder
    if (rule.random != null) {
      rule.random!.forEach((key, randomValue) {
        final value =
            randomValue.min +
            random.nextInt(randomValue.max - randomValue.min + 1);
        generatedValues[key] = value;
      });
    }

    // Replace placeholders in title
    String processedTitle = rule.title;
    generatedValues.forEach((key, value) {
      processedTitle = processedTitle.replaceAll('{$key}', value.toString());
    });

    // Replace placeholders in description
    String processedDescription = rule.description;
    generatedValues.forEach((key, value) {
      processedDescription = processedDescription.replaceAll(
        '{$key}',
        value.toString(),
      );
    });

    // Replace placeholders in clarification if exists
    String? processedClarification = rule.clarification;
    if (processedClarification != null) {
      generatedValues.forEach((key, value) {
        processedClarification = processedClarification!.replaceAll(
          '{$key}',
          value.toString(),
        );
      });
    }

    return RuleDisplay(
      rule: rule,
      processedTitle: processedTitle,
      processedDescription: processedDescription,
      processedClarification: processedClarification,
      generatedValues: generatedValues,
      canReroll: rule.random?.values.any((rv) => rv.reroll) ?? false,
    );
  }
}

/// Holds the processed rule with generated random values
class RuleDisplay {
  final RuleEntity rule;
  final String processedTitle;
  final String processedDescription;
  final String? processedClarification;
  final Map<String, int> generatedValues;
  final bool canReroll;

  RuleDisplay({
    required this.rule,
    required this.processedTitle,
    required this.processedDescription,
    required this.processedClarification,
    required this.generatedValues,
    required this.canReroll,
  });
}
