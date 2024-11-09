import 'package:freezed_annotation/freezed_annotation.dart';

part 'rule_model.freezed.dart';
part 'rule_model.g.dart';

@freezed
class RuleModel with _$RuleModel {
  const factory RuleModel({
    required String title,
    required String description,
  }) = _RuleModel;

  factory RuleModel.fromJson(Map<String, dynamic> json) =>
      _$RuleModelFromJson(json);
}
