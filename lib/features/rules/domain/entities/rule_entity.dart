import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'rule_entity.freezed.dart';
part 'rule_entity.g.dart';

@freezed
abstract class RuleAssetFile with _$RuleAssetFile {
  const factory RuleAssetFile({
    required int version,
    required Map<String, String> definitions,
    required List<RuleEntity> rules,
  }) = _RuleAssetFile;

  factory RuleAssetFile.fromJson(Map<String, dynamic> json) =>
      _$RuleAssetFileFromJson(json);
}

@freezed
@HiveType(typeId: 1)
abstract class RuleEntity with _$RuleEntity {
  const factory RuleEntity({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required String level,
    @HiveField(4) @Default([]) List<String> tags,
    @HiveField(5) @Default([]) List<String> flags,
    @HiveField(6) Map<String, RandomValue>? random,
    @HiveField(7) String? clarification,
  }) = _RuleEntity;

  factory RuleEntity.fromJson(Map<String, dynamic> json) =>
      _$RuleEntityFromJson(json);
}

@freezed
abstract class RandomValue with _$RandomValue {
  const factory RandomValue({
    required String type,
    required int min,
    required int max,
    @Default(false) bool reroll,
  }) = _RandomValue;

  factory RandomValue.fromJson(Map<String, dynamic> json) =>
      _$RandomValueFromJson(json);
}
