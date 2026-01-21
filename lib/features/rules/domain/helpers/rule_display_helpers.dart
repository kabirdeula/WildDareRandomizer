import 'dart:math';

import '../../rules.dart';

class RuleDisplayHelper {
  /// Generates random values for a rule and returns the processed text
  static RuleDisplay processRule(RuleEntity rule, {int? seed}) {
    final random = seed != null ? Random(seed) : Random();
    final generatedValues = <String, String>{};

    // Generate random values for each placeholder
    if (rule.random != null) {
      rule.random!.forEach((key, randomValue) {
        String value;

        if (randomValue.type == 'choice' && randomValue.choices != null) {
          // Pick random choice from list
          final choiceIndex = random.nextInt(randomValue.choices!.length);
          value = randomValue.choices![choiceIndex];
        } else if (randomValue.type == 'int' && 
                   randomValue.min != null && 
                   randomValue.max != null) {
          // Generate random integer
          final intValue = randomValue.min! + 
              random.nextInt(randomValue.max! - randomValue.min! + 1);
          value = intValue.toString();
        } else {
          value = '?'; // Fallback
        }

        generatedValues[key] = value;
      });
    }

    // Auto-generate article if needed
    if (generatedValues.containsKey('condition') &&
        !generatedValues.containsKey('article')) {
      final condition = generatedValues['condition']!;
      generatedValues['article'] = _getArticle(condition);
    }

    // Replace placeholders in title
    String processedTitle = rule.title;
    generatedValues.forEach((key, value) {
      processedTitle = processedTitle.replaceAll('{$key}', value);
    });

    // Replace placeholders in description
    String processedDescription = rule.description;
    generatedValues.forEach((key, value) {
      processedDescription = processedDescription.replaceAll('{$key}', value);
    });

    // Replace placeholders in clarification if exists
    String? processedClarification = rule.clarification;
    if (processedClarification != null) {
      generatedValues.forEach((key, value) {
        processedClarification = processedClarification!.replaceAll(
          '{$key}',
          value,
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

  /// Returns "a" or "an" based on the word
  static String _getArticle(String word) {
    final vowels = ['a', 'e', 'i', 'o', 'u'];
    final firstLetter = word.trim().toLowerCase()[0];
    return vowels.contains(firstLetter) ? 'an' : 'a';
  }
}

/// Holds the processed rule with generated random values
class RuleDisplay {
  final RuleEntity rule;
  final String processedTitle;
  final String processedDescription;
  final String? processedClarification;
  final Map<String, String> generatedValues;
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
