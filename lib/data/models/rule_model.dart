import 'package:freezed_annotation/freezed_annotation.dart';

part 'rule_model.freezed.dart';
part 'rule_model.g.dart';

/// Represents a single rule within the application, with a title and description.
///
/// The `RuleModel` class is used to store information about each rule,
/// including the title and description. This model can be serialized
/// to and from JSON using the generated `toJson` and `fromJson` methods.
@freezed
class RuleModel with _$RuleModel {
  /// Creates a new `RuleModel` instance.
  ///
  /// [title] is the main title of the rule, describing its purpose.
  ///
  /// [description] provides additional details about the rule.
  const factory RuleModel({
    required String title,
    required String description,
  }) = _RuleModel;

  /// Deserializes a JSON object to create a `RuleModel` instance.
  ///
  /// This factory method enables converting JSON data directly into a
  /// `RuleModel` object by passing a `Map<String, dynamic>`, typically
  /// from an API or local storage.
  ///
  /// Example:
  /// ```dart
  /// final rule = RuleModel.fromJson(jsonData);
  /// ```
  factory RuleModel.fromJson(Map<String, dynamic> json) =>
      _$RuleModelFromJson(json);
}
