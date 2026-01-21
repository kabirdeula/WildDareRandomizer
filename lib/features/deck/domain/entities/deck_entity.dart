import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'deck_entity.freezed.dart';
part 'deck_entity.g.dart';

@freezed
@HiveType(typeId: 2)
abstract class DeckEntity with _$DeckEntity {
  const factory DeckEntity({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required List<String> ruleIds,
    @HiveField(3) required int shuffleSeed,
    @HiveField(4) required DateTime createdAt,
    @HiveField(5) required DateTime updatedAt,
  }) = _DeckEntity;

  factory DeckEntity.fromJson(Map<String, dynamic> json) =>
      _$DeckEntityFromJson(json);
}
