import 'package:freezed_annotation/freezed_annotation.dart';

part 'rule_model.freezed.dart';
part 'rule_model.g.dart';

/// Represents a single rule used in the application, with its title, description, and difficulty level.
///
/// The `RuleModel` class is a data model designed to store and manage information about 
/// each rule in the game. It includes a title, a description, and a level of difficulty 
/// (e.g., "Easy," "Medium," "Hard," or "Extreme").
/// 
/// This model supports JSON serialization and deserialization, enabling seamless 
/// integration with APIs or local storage. The `RuleModel` is immutable and generated 
/// using the `freezed` package for safety and convenience.
@freezed
class RuleModel with _$RuleModel {
  /// Creates a new `RuleModel` instance.
  ///
  /// [title] is the name or main heading of the rule that explains its primary purpose or action.
  ///
  /// [description] provides a detailed explanation of the rule, including any specific
  /// conditions, limitations, or instructions for its application.
  ///
  /// [level] represents the difficulty level of the rule, categorized as "Easy," "Medium," 
  /// "Hard," or "Extreme." This helps to sort and organize rules based on their complexity or impact.
  const factory RuleModel({
    required String title,
    required String description,
    required String level,
  }) = _RuleModel;

  /// Deserializes a JSON object to create a `RuleModel` instance.
  ///
  /// This factory method enables converting JSON data into a `RuleModel` object by passing 
  /// a `Map<String, dynamic>`. It is typically used when loading data from an API, 
  /// a database, or local storage.
  ///
  /// Example usage:
  /// ```dart
  /// final jsonData = {
  ///   "title": "Change Color, Next Draws 4",
  ///   "description": "Change the color, and if the next player doesn't have it, they must draw 4 cards.",
  ///   "level": "Medium"
  /// };
  /// final rule = RuleModel.fromJson(jsonData);
  /// print(rule.title); // Output: Change Color, Next Draws 4
  /// ```
  factory RuleModel.fromJson(Map<String, dynamic> json) =>
      _$RuleModelFromJson(json);
}
